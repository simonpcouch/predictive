# Executes R code in the current session
#
# @param code R code to execute
# @returns The results of the evaluation
# @noRd
run_r_code <- function(code) {
  if (in_shiny()) {
    out <- MarkdownStreamer$new(function(md_text) {
      save_output_chunk(md_text)
      chat_append_message(
        "chat",
        list(role = "assistant", content = md_text),
        chunk = TRUE,
        operation = "append"
      )
    })
  } else {
    out <- NullStreamer$new()
  }
  on.exit(out$close(), add = TRUE, after = FALSE)

  # What gets returned to the LLM
  result <- list()

  out_img <- function(media_type, b64data) {
    result <<- c(
      result,
      list(list(
        type = "image",
        source = list(
          type = "base64",
          media_type = media_type,
          data = b64data
        )
      ))
    )
    out$md(
      sprintf("![Plot](data:%s;base64,%s)\n\n", media_type, b64data),
      TRUE,
      FALSE
    )
  }

  out_df <- function(df) {
    ROWS_START <- 20
    ROWS_END <- 10

    # For the model
    df_json <- encode_df_for_model(
      df,
      max_rows = ROWS_START,
      show_end = ROWS_END
    )
    result <<- c(result, list(list(type = "text", text = df_json)))
    # For human
    # Make sure human sees same EXACT rows as model, this includes omitting the same rows
    split <- split_df(nrow(df), show_start = ROWS_START, show_end = ROWS_END)
    attrs <- "class=\"data-frame table table-sm table-striped\""
    md_tbl <- paste0(
      collapse = "\n",
      knitr::kable(head(df, split$head), format = "html", table.attr = attrs)
    )
    if (split$skip > 0) {
      md_tbl_skip <- sprintf("... %d rows omitted ...", split$skip)
      md_tbl_tail <- knitr::kable(
        tail(df, split$tail),
        format = "html",
        table.attr = attrs
      )
      md_tbl <- as_str(md_tbl, md_tbl_skip, md_tbl_tail)
    }
    out$md(md_tbl, TRUE, TRUE)
  }

  out_txt <- function(txt, end = NULL) {
    txt <- paste(txt, collapse = "\n")
    if (txt == "") {
      return()
    }
    if (!is.null(end)) {
      txt <- paste0(txt, end)
    }
    result <<- c(result, list(list(type = "text", text = txt)))
    out$code(txt)
  }

  out$code(code)
  # End the source code block so the outputs all appear in a separate block
  out$close()

  # Use the new evaluate_r_code function
  if (in_shiny()) {
    shiny::withLogErrors({
      evaluate_r_code(
        code,
        on_console_out = out_txt,
        on_console_err = out_txt,
        on_plot = out_img,
        on_dataframe = out_df
      )
    })
  } else {
    evaluate_r_code(
      code,
      on_console_out = out_txt,
      on_console_err = out_txt,
      on_plot = out_img,
      on_dataframe = out_df
    )
  }

  I(result)
}

in_shiny <- function() {
  !is.null(shiny::getDefaultReactiveDomain())
}

tool_run_r_code <-
  tool(
    run_r_code,
    "Executes R code in the current session",
    arguments = list(code = type_string("R code to execute"))
  )
