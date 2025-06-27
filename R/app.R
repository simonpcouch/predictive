#' @import shiny
#' @import bslib
#' @import ellmer
#' @import shinychat
NULL

html_deps <- function() {
  list(
    htmltools::htmlDependency(
      "modelbot",
      utils::packageVersion("modelbot"),
      src = "www",
      package = "modelbot",
      stylesheet = "style.css"
    ),
    # Tool calling UI dependencies from shinychat
    htmltools::htmlDependency(
      "shinychat-tools",
      utils::packageVersion("shinychat"),
      src = "tools",
      package = "shinychat",
      stylesheet = "tool-request.css",
      script = "tool-request.js"
    )
  )
}

latest_session <- reactiveVal()

#' Runs modelbot
#'
#' @param new_session Logical. If `TRUE`, starts a new chat session. If `FALSE`
#'   (the default), restores the previous chat session (only within the current
#'   R process).
#'
#' @export
model_bot <- function(new_session = FALSE) {
  withr::local_envvar(NO_COLOR = "1")

  if (isTRUE(new_session)) {
    reset_state()
  }

  ui <- page_fillable(
    html_deps(),
    chat_ui("chat", fill = TRUE, height = "100%", width = "100%")
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

    chat <- modelbot_client(default_turns = globals$turns)
    restored_since_last_turn <- FALSE

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

      # Set up tool result callback to hide tool requests when complete
      clear_on_tool_result <- chat$on_tool_result(function(result) {
        session <- shiny::getDefaultReactiveDomain()
        if (is.null(session)) return()
        session$sendCustomMessage(
          "shinychat-hide-tool-request",
          result@request@id
        )
      })

      stream <- save_stream_output()(
        chat$stream_async(paste0(prefix, user_input), stream = "content")
      )
      
      p <- chat_append("chat", stream)
      p <- promises::then(p, function(x) {
        if (session$isClosed()) {
          req(FALSE)
        }

        # After each successful turn, save everything in case we need to
        # restore (i.e. user stops the app and restarts it)
        globals$turns <- chat$get_turns()
        save_messages(
          list(role = "user", content = user_input),
          list(role = "assistant", content = take_pending_output())
        )
      })
      promises::finally(p, function(...) {
        clear_on_tool_result()
        
        tokens <- chat$get_tokens(include_system_prompt = FALSE)
        input <- sum(tokens$tokens[tokens$role == "user"])
        output <- sum(tokens$tokens[tokens$role == "assistant"])

        cat("\n")
        cat(rule("Turn ", nrow(tokens) / 2), "\n", sep = "")
        cat("Total input tokens:  ", input, "\n", sep = "")
        cat("Total output tokens: ", output, "\n", sep = "")
        cat("Total tokens:        ", input + output, "\n", sep = "")
        cat("\n")
        .last_chat <<- chat
      })
    }

    observeEvent(input$chat_user_input, {
      start_chat_request(input$chat_user_input)
    })

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
