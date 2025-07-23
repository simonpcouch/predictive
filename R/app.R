#' @import shiny
#' @import bslib
#' @import ellmer
#' @import shinychat
NULL

html_deps <- function() {
  list(
    htmltools::htmlDependency(
      "predictive",
      utils::packageVersion("predictive"),
      src = "www",
      package = "predictive",
      stylesheet = "style.css"
    )
  )
}

latest_session <- reactiveVal()

#' Frontend for tidy modeling
#'
#' @description
#' predictive is an agentic frontend for predictive modeling with tidymodels.
#' The chat application will guide you through the exploratory data analysis
#' and model development process, running R code and launching modeling
#' experiments on your behalf.
#'
#' @seealso
#' The introductory vignette `vignette("predictive", package = "predictive")`
#' contains more information on the workflow and design of this application.
#'
#' @param new_session Logical. If `TRUE`, starts a new chat session. If `FALSE`
#'   (the default), restores the previous chat session (only within the current
#'   R process).
#'
#' @export
predictive <- function(new_session = FALSE) {
  withr::local_envvar(NO_COLOR = "1")

  if (isTRUE(new_session)) {
    reset_state()
  }

  ui <- page_fillable(
    html_deps(),
    layout_columns(
      col_widths = c(7, 5),
      div(
        style = "height: 100%; display: flex; flex-direction: column;",
        div(
          style = "flex: 1; min-height: 0;",
          chat_ui("chat", fill = TRUE, height = "100%")
        ),
        div(
          id = "notification-area",
          style = "padding: 4px 12px; margin-bottom: 4px;",
          uiOutput("experiment_notification")
        )
      ),
      card(
        card_header("Experiments"),
        div(
          id = "experiment-tracker",
          style = "background-color: #f8f9fa; border-radius: 8px; padding: 16px; height: 100%; overflow-y: auto;",
          uiOutput("experiment_cards")
        )
      )
    )
  )

  server <- function(input, output, session) {
    session$allowReconnect(TRUE)
    latest_session(session$token)
    observe({
      if (!identical(latest_session(), session$token)) {
        showModal(modalDialog(
          "Your session ended because a new session was started in a ",
          "different browser tab.",
          fade = FALSE,
          easyClose = TRUE
        ))
        session$close()
      }
    })

    chat <- predictive_client(default_turns = globals$turns)
    restored_since_last_turn <- FALSE

    chat_stream_task <- ExtendedTask$new(function(
      chat_client,
      full_input,
      user_input
    ) {
      clear_on_tool_result <- chat_client$on_tool_result(function(result) {
        session <- shiny::getDefaultReactiveDomain()
        if (is.null(session)) {
          return()
        }
        session$sendCustomMessage(
          "shinychat-hide-tool-request",
          result@request@id
        )
      })

      stream <- save_stream_output()(
        chat_client$stream_async(full_input, stream = "content")
      )

      p <- chat_append("chat", stream)
      promises::then(
        promises::finally(p, function(...) {
          clear_on_tool_result()
        }),
        function(x) {
          if (session$isClosed()) {
            req(FALSE)
          }
          list(user_input = user_input)
        }
      )
    })

    format_single_experiment <- function(name, exp) {
      parts <- c(
        paste0(
          "### Experiment: ",
          name,
          " (",
          if (!is.null(exp$error)) {
            "Error"
          } else {
            "Success"
          },
          ")"
        ),
        "**Script:**",
        paste0("```r\n", exp$script, "\n```")
      )

      if (!is.null(exp$error)) {
        parts <- c(parts, "**Error:**", paste0("```\n", exp$error, "\n```"))
      } else if (!is.null(exp$metrics)) {
        parts <- c(
          parts,
          "**Metrics:**",
          btw::btw_this(exp$metrics, format = "json")
        )
      }

      c(parts, "")
    }

    format_experiment_results <- function() {
      completed_experiments <- names(Filter(
        function(exp) exp$status == "completed",
        the$experiments
      ))
      if (length(completed_experiments) == 0) {
        return("")
      }

      new_exp_names <- new_experiments()
      old_exp_names <- setdiff(completed_experiments, new_exp_names)

      res <- character(0)

      if (length(old_exp_names) > 0) {
        res <- c(res, "## Previous Experiment Results")
        for (name in old_exp_names) {
          res <- c(res, format_single_experiment(name, the$experiments[[name]]))
        }
      }

      if (length(new_exp_names) > 0) {
        res <- c(
          res,
          "## New Experiment Results",
          "When reading experiment results, pay careful attention to markdown 
           headers to ensure that you're connecting the correct experiment
           name to its own results rather than the results of another experiment."
        )
        for (name in new_exp_names) {
          res <- c(res, format_single_experiment(name, the$experiments[[name]]))
        }
      }

      if (length(res) > 0) {
        paste0("\n\n---\n\n", paste(res, collapse = "\n"), "\n---\n\n")
      } else {
        ""
      }
    }

    experiment_state_hash <- reactiveVal("")
    experiment_cards_reactive <- reactiveVal(div(
      style = "text-align: center; color: #666; margin-top: 20px;",
      "No experiments yet."
    ))
    notification_trigger <- reactiveVal(0)
    notification_clicked <- reactiveVal(FALSE)

    experiment_timer <- reactive({
      if (length(running_experiments()) > 0) {
        invalidateLater(50)
      } else {
        invalidateLater(1000)
      }
      Sys.time()
    })

    observe({
      experiment_timer()

      exp_names <- ordered_experiments()
      current_hash <- rlang::hash(list(
        names = exp_names,
        experiments = the$experiments[exp_names]
      ))

      if (!identical(current_hash, experiment_state_hash())) {
        experiment_state_hash(current_hash)

        new_ui <- if (length(exp_names) == 0) {
          div(
            style = "text-align: center; color: #666; margin-top: 20px;",
            "No experiments yet."
          )
        } else {
          lapply(exp_names, function(name) {
            card_render_experiment(name, the$experiments[[name]])
          })
        }

        experiment_cards_reactive(new_ui)
      }
    })

    output$experiment_cards <- renderUI({
      experiment_cards_reactive()
    })

    # Reactive for experiment notification button
    notification_state_hash <- reactiveVal("")

    observe({
      experiment_timer()

      new_exp_names <- new_async_experiments()
      current_hash <- rlang::hash(new_exp_names)

      if (!identical(current_hash, notification_state_hash())) {
        notification_state_hash(current_hash)
        notification_clicked(FALSE)
        notification_trigger(notification_trigger() + 1)
      }
    })

    output$experiment_notification <- renderUI({
      notification_trigger()

      new_exp_names <- new_async_experiments()
      clicked <- notification_clicked()

      if (length(new_exp_names) > 0 && !clicked) {
        button_text <- cli::format_inline(
          "Notify with new results {glue::backtick(new_exp_names)}"
        )

        actionButton(
          "notify_new_results",
          button_text,
          class = "btn-outline-primary",
          style = "font-size: 11px; padding: 4px 8px; border-radius: 12px; background-color: white; border: 1px solid #6c9bd1; width: 100%; text-align: left; color: #6c9bd1;"
        )
      } else if (length(new_exp_names) > 0 && clicked) {
        button_text <- cli::format_inline(
          "Notify with new results {glue::backtick(new_exp_names)}"
        )

        actionButton(
          "notify_new_results_disabled",
          button_text,
          class = "btn-outline-secondary",
          style = "font-size: 11px; padding: 4px 8px; border-radius: 12px; background-color: #f8f9fa; border: 1px solid #dee2e6; width: 100%; text-align: left; color: #6c757d; cursor: not-allowed;",
          disabled = TRUE
        )
      } else {
        NULL
      }
    })

    observeEvent(input$notify_new_results, {
      notification_clicked(TRUE)
      start_chat_request("Please review the new experiment results.")
    })

    # Debounced card click handler
    card_click_debounced <- debounce(reactive(input$experiment_card_click), 200)

    observeEvent(card_click_debounced(), ignoreInit = TRUE, {
      click_data <- card_click_debounced()
      if (is.null(click_data)) {
        return()
      }

      exp_name <- click_data$name
      exp <- the$experiments[[exp_name]]

      if (is.null(exp)) {
        return()
      }

      # Remove any existing modal before showing new one
      removeModal()

      formatted_script <- format_experiment_script(exp$script)

      modal_content <- list(
        h4("R Script"),
        HTML(paste0(
          "<pre style='background-color: #f8f9fa; padding: 15px; border-radius: 5px; overflow-x: auto; white-space: pre-wrap; margin: 0;'><code>",
          htmltools::htmlEscape(formatted_script),
          "</code></pre>"
        ))
      )

      if (!is.null(exp$error)) {
        modal_content <- append(
          modal_content,
          list(
            h4("Error", style = "color: #dc3545; margin-top: 20px;"),
            pre(
              style = "background-color: #f8d7da; color: #721c24; padding: 15px; border-radius: 5px; overflow-x: auto; white-space: pre-wrap;",
              exp$error
            )
          )
        )
      } else if (!is.null(exp$metrics)) {
        modal_content <- append(
          modal_content,
          list(
            h4("Metrics", style = "margin-top: 20px;"),
            HTML(create_metrics_table(exp$metrics))
          )
        )
      }

      if (!is.null(exp$started_at) && !is.null(exp$completed_at)) {
        duration <- round(as.numeric(difftime(
          exp$completed_at,
          exp$started_at,
          units = "secs"
        )))
        modal_content <- append(
          modal_content,
          list(
            p(
              strong("Duration: "),
              paste0(duration, "s"),
              style = "margin-top: 20px;"
            )
          )
        )
      }

      showModal(modalDialog(
        title = paste("Experiment:", exp_name),
        modal_content,
        size = "l",
        easyClose = TRUE,
        footer = modalButton("Close")
      ))
    })

    # Restore previous chat session, if applicable
    if (globals$ui_messages$size() > 0) {
      ui_msgs <- globals$ui_messages$as_list()
      if (identical(ui_msgs[[1]], list(role = "user", content = "Hello"))) {
        ui_msgs <- ui_msgs[-1]
      }
      for (msg in ui_msgs) {
        chat_append_message("chat", msg, chunk = FALSE)
      }
      restored_since_last_turn <- TRUE
    } else if (length(chat$get_turns()) > 0) {
      client_msgs <- shinychat::contents_shinychat(chat)
      if (length(client_msgs)) {
        for (msg in client_msgs) {
          chat_append_message("chat", msg, chunk = FALSE)
        }
        restored_since_last_turn <- TRUE
      }
    }
    start_chat_request <- function(user_input) {
      prefix <- if (restored_since_last_turn) {
        paste0(
          "(Continuing previous chat session. The R environment may have ",
          "changed since the last request/response.)\n\n"
        )
      } else {
        ""
      }
      restored_since_last_turn <<- FALSE

      experiment_results <- format_experiment_results()
      .last_experiment_results_shown <<- experiment_results

      new_async_exp_names <- new_async_experiments()
      for (name in new_async_exp_names) {
        the$experiments[[name]]$seen_by_model <- TRUE
      }

      if (length(new_async_exp_names) > 0) {
        notification_html <- sprintf(
          '<p class="shiny-experiment-notification">%s</p>',
          cli::format_inline(
            "Notified with experiment results {new_async_exp_names}."
          )
        )
        chat_append_message(
          "chat",
          list(role = "assistant", content = HTML(notification_html)),
          chunk = FALSE
        )
      }

      suggestion_content <- if (length(the$experiments) > 5) {
        selected_suggestion <- sample(suggestions, 1)
        paste0(
          "\n<suggestion_from_application>",
          selected_suggestion,
          "</suggestion_from_application>"
        )
      } else {
        ""
      }

      full_input <- paste0(
        prefix,
        user_input,
        suggestion_content,
        experiment_results
      )
      chat_stream_task$invoke(chat, full_input, user_input)
    }

    observeEvent(input$chat_user_input, {
      if (length(new_async_experiments()) > 0) {
        notification_clicked(TRUE)
      }
      start_chat_request(input$chat_user_input)
    })

    observeEvent(
      chat_stream_task$status(),
      {
        if (chat_stream_task$status() == "success") {
          # TODO: there's an issue with turns having a 2-length @token
          # slot rather than 3, causing `get_tokens()` to error out
          # tokens <- chat$get_tokens(include_system_prompt = FALSE)
          # input <- sum(tokens$tokens[tokens$role == "user"])
          # output <- sum(tokens$tokens[tokens$role == "assistant"])

          # cat("\n")
          # cat(rule("Turn ", nrow(tokens) / 2), "\n", sep = "")
          # cat("Total input tokens:  ", input, "\n", sep = "")
          # cat("Total output tokens: ", output, "\n", sep = "")
          # cat("Total tokens:        ", input + output, "\n", sep = "")
          # cat("\n")
          .last_chat <<- chat

          globals$turns <- chat$get_turns()
          save_messages(
            list(role = "user", content = chat_stream_task$result()$user_input),
            list(role = "assistant", content = take_pending_output())
          )
        }
      },
      ignoreInit = TRUE
    )

    # Kick start the chat session (unless we've restored a previous session)
    if (length(chat$get_turns()) == 0) {
      start_chat_request("Hello")
    }
  }

  print(shinyApp(ui, server))
}

globals <- new.env(parent = emptyenv())
globals$turns <- NULL
globals$ui_messages <- fastmap::fastqueue()
globals$pending_output <- fastmap::fastqueue()

reset_state <- function() {
  globals$turns <- NULL
  globals$ui_messages$reset()
  globals$pending_output$reset()
  invisible()
}

save_messages <- function(...) {
  for (msg in list(...)) {
    globals$ui_messages$add(msg)
  }
  invisible()
}

save_output_chunk <- function(chunk) {
  if (S7::S7_inherits(chunk, ellmer::Content)) {
    chunk <- shinychat::contents_shinychat(chunk)
  }
  globals$pending_output$add(chunk)
  invisible()
}

take_pending_output <- function() {
  chunks <- unlist(globals$pending_output$as_list())
  globals$pending_output$reset()
  paste(collapse = "", chunks)
}

# Stream decorator that saves each chunk to pending_output
save_stream_output <- function() {
  coro::async_generator(function(stream) {
    session <- getDefaultReactiveDomain()
    for (chunk in coro::await_each(stream)) {
      if (session$isClosed()) {
        req(FALSE)
      }
      save_output_chunk(chunk)
      coro::yield(chunk)
    }
  })
}
