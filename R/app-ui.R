card_render_experiment <- function(name, exp) {
  status_icon <- if (exp$status == "running") {
    tags$i(class = "fa fa-spinner fa-spin", style = "color: #6c757d;")
  } else if (!is.null(exp$error)) {
    HTML(paste0(
      "<span style=\"color: #dc3545;\">",
      cli::symbol$cross,
      "</span>"
    ))
  } else {
    HTML(paste0(
      "<span style=\"color: #28a745;\">",
      cli::symbol$tick,
      "</span>"
    ))
  }

  duration <- card_duration(exp)
  best_label <- card_best_label(name, exp)
  baseline_label <- if (grepl("null", name, ignore.case = TRUE)) {
    "baseline"
  } else {
    ""
  }
  metrics_display <- card_metrics_display(exp)

  div(
    class = "experiment-card",
    id = paste0("card-", name),
    style = "background: white; border-radius: 8px; padding: 12px; margin-bottom: 8px; box-shadow: 0 1px 3px rgba(0,0,0,0.1); cursor: pointer; transition: box-shadow 0.2s ease;",
    onmouseover = "this.style.boxShadow = '0 4px 8px rgba(0,0,0,0.15)'",
    onmouseout = "this.style.boxShadow = '0 1px 3px rgba(0,0,0,0.1)'",
    onclick = paste0(
      "var expName = this.getAttribute('data-experiment-name'); ",
      "Shiny.setInputValue('experiment_card_click', {name: expName, timestamp: Date.now()}, {priority: 'event'})"
    ),
    "data-experiment-name" = name,
    div(
      style = "display: flex; justify-content: space-between; align-items: center; margin-bottom: 8px;",
      div(
        style = "display: flex; align-items: center; gap: 8px;",
        status_icon,
        span(duration, style = "font-size: 12px; color: #666;")
      ),
      div(
        style = "display: flex; gap: 8px; font-size: 12px;",
        if (baseline_label != "") span(baseline_label, style = "color: #666;"),
        if (best_label != "") {
          span(best_label, style = "color: #28a745; font-weight: bold;")
        }
      )
    ),
    div(
      style = "font-weight: 500; margin-bottom: 8px;",
      name
    ),
    div(
      style = "font-style: italic; color: #666; margin-bottom: 8px;",
      exp$purpose
    ),
    if (metrics_display != "") {
      div(
        style = "font-size: 12px; color: #666; text-align: right;",
        HTML(metrics_display)
      )
    }
  )
}

card_duration <- function(exp) {
  if (exp$status == "running") {
    "..."
  } else if (!is.null(exp$started_at) && !is.null(exp$completed_at)) {
    paste0(
      round(as.numeric(difftime(
        exp$completed_at,
        exp$started_at,
        units = "secs"
      ))),
      "s"
    )
  } else {
    ""
  }
}

card_best_label <- function(name, experiment) {
  if (
    experiment$status != "completed" ||
      !is.null(experiment$error) ||
      is.null(experiment$metrics)
  ) {
    return("")
  }

  other_experiments <- the$experiments
  other_experiments[[name]] <- NULL
  other_experiments <- Filter(
    function(e) {
      e$status == "completed" && is.null(e$error) && !is.null(e$metrics)
    },
    other_experiments
  )

  other_metrics <- purrr::map(other_experiments, "metrics")
  other_metrics <- purrr::list_rbind(other_metrics)

  if ("rmse" %in% experiment$metrics$.metric) {
    if (min_rmse(experiment$metrics) < min_rmse(other_metrics)) {
      return("New best!")
    }
  }

  if ("roc_auc" %in% experiment$metrics$.metric) {
    if (max_roc_auc(experiment$metrics) > max_roc_auc(other_metrics)) {
      return("New best!")
    }
  }

  return("")
}

min_rmse <- function(metrics) {
  res <- metrics[metrics$.metric == "rmse", ]
  min(res$mean, na.rm = TRUE)
}

max_roc_auc <- function(metrics) {
  res <- metrics[metrics$.metric == "roc_auc", ]
  max(res$mean, na.rm = TRUE)
}

card_metrics_display <- function(experiment) {
  if (
    experiment$status != "completed" ||
      is.null(experiment$metrics) ||
      !is.null(experiment$error)
  ) {
    return("")
  }

  metrics <- experiment$metrics
  if (nrow(metrics) == 0) {
    return("")
  }

  # regression
  if ("rmse" %in% metrics$.metric) {
    min_rmse <- min_rmse(metrics)
    min_rmse_idx <- which(min_rmse == metrics$mean)[1]
    corresponding_rsq <- metrics[metrics$.metric == "rsq", ]
    corresponding_rsq <- corresponding_rsq$mean[
      corresponding_rsq$.config == metrics$.config[min_rmse_idx]
    ]
    return(
      paste0(
        "RMSE: ",
        round(min_rmse, 3),
        "\n\n",
        "R\u00B2: ",
        round(corresponding_rsq, 3),
        collapse = ""
      )
    )
  }

  # classification
  if ("roc_auc" %in% metrics$.metric) {
    max_roc_auc <- max_roc_auc(metrics)
    max_roc_auc_idx <- which(max_roc_auc == metrics$mean)[1]
    corresponding_brier <- metrics[metrics$.metric == "brier_class", ]
    corresponding_brier <- corresponding_brier$mean[
      corresponding_brier$.config == metrics$.config[max_roc_auc_idx]
    ]
    return(
      paste0(
        "ROC AUC: ",
        round(max_roc_auc, 3),
        "\n\n",
        "Brier score: ",
        round(corresponding_brier, 3),
        collapse = ""
      )
    )
  }

  return("")
}

format_experiment_script <- function(script) {
  if (is.null(script) || script == "") {
    return("No script available")
  }

  formatted_script <- tryCatch(
    {
      styler::style_text(script)
    },
    error = function(e) {
      script
    }
  )

  paste(formatted_script, collapse = "\n")
}

create_metrics_table <- function(metrics) {
  if (is.null(metrics) || nrow(metrics) == 0) {
    return("<p>No metrics available</p>")
  }

  # Convert metrics to HTML table
  table_html <- "<table class='table table-striped table-sm'>"
  table_html <- paste0(table_html, "<thead><tr>")

  for (col in names(metrics)) {
    table_html <- paste0(
      table_html,
      "<th>",
      htmltools::htmlEscape(col),
      "</th>"
    )
  }
  table_html <- paste0(table_html, "</tr></thead><tbody>")

  for (i in seq_len(nrow(metrics))) {
    table_html <- paste0(table_html, "<tr>")
    for (col in names(metrics)) {
      value <- metrics[[col]][i]
      if (is.numeric(value)) {
        value <- round(value, 4)
      }
      table_html <- paste0(
        table_html,
        "<td>",
        htmltools::htmlEscape(as.character(value)),
        "</td>"
      )
    }
    table_html <- paste0(table_html, "</tr>")
  }

  table_html <- paste0(table_html, "</tbody></table>")
  table_html
}
