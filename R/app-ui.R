card_render_experiment <- function(name, exp) {
  status_icon <- if (exp$status == "running") {
    tags$i(class = "fa fa-spinner fa-spin", style = "color: #6c757d;")
  } else if (!is.null(exp$error)) {
    HTML("<span style=\"color: #dc3545;\">✖</span>")
  } else {
    HTML("<span style=\"color: #28a745;\">✔</span>")
  }
  
  duration <- card_duration(exp)
  best_label <- card_best_label(name, exp)
  baseline_label <- if (grepl("null", name, ignore.case = TRUE)) "baseline" else ""
  metrics_display <- card_metrics_display(exp)
  
  div(
    class = "experiment-card",
    style = "background: white; border-radius: 8px; padding: 12px; margin-bottom: 8px; box-shadow: 0 1px 3px rgba(0,0,0,0.1);",
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
        if (best_label != "") span(best_label, style = "color: #28a745; font-weight: bold;")
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
    if (metrics_display != "") div(
      style = "font-size: 12px; color: #666; text-align: right;",
      HTML(metrics_display)
    )
  )
}

card_duration <- function(exp) {
  if (exp$status == "running") {
    "..."
  } else if (!is.null(exp$started_at) && !is.null(exp$completed_at)) {
    paste0(round(as.numeric(difftime(exp$completed_at, exp$started_at, units = "secs"))), "s")
  } else {
    ""
  }
}

card_best_label <- function(name, exp) {
  if (exp$status != "completed" || !is.null(exp$error) || is.null(exp$metrics)) {
    return("")
  }

  other_exps <- the$experiments
  other_exps[[name]] <- NULL
  other_exps <- Filter(function(e) e$status == "completed" && is.null(e$error) && !is.null(e$metrics), other_exps)

  metric_info <- list(
    rmse = list(higher_is_better = FALSE),
    rsq = list(higher_is_better = TRUE),
    roc_auc = list(higher_is_better = TRUE),
    accuracy = list(higher_is_better = TRUE)
  )

  for (metric_name in exp$metrics$.metric) {
    if (!metric_name %in% names(metric_info)) {
      next
    }

    current_value <- exp$metrics[exp$metrics$.metric == metric_name, ]$mean[1]

    if (is.na(current_value)) {
      next
    }

    higher_is_better <- metric_info[[metric_name]]$higher_is_better
    is_best_for_this_metric <- TRUE

    for (other_exp in other_exps) {
      if (metric_name %in% other_exp$metrics$.metric) {
        other_value <- other_exp$metrics[other_exp$metrics$.metric == metric_name, ]$mean[1]

        if (is.na(other_value)) {
          next
        }

        if (higher_is_better && other_value > current_value) {
          is_best_for_this_metric <- FALSE
          break
        } else if (!higher_is_better && other_value < current_value) {
          is_best_for_this_metric <- FALSE
          break
        }
      }
    }

    if (is_best_for_this_metric) {
      return("New best!")
    }
  }

  return("")
}

card_metrics_display <- function(exp) {
  if (exp$status != "completed" || is.null(exp$metrics) || !is.null(exp$error)) {
    return("")
  }
  
  metrics <- exp$metrics
  parts <- character(0)
  
  display_metrics <- c("rmse", "rsq", "roc_auc", "accuracy")
  metrics_to_display <- metrics[metrics$.metric %in% display_metrics, ]

  if (nrow(metrics_to_display) == 0) {
    return("")
  }

  for (i in 1:nrow(metrics_to_display)) {
    metric_row <- metrics_to_display[i, ]
    metric_name <- metric_row$.metric
    value <- round(metric_row$mean, 3)
    
    label <- switch(metric_name,
      "rmse" = "RMSE",
      "rsq" = "R²",
      "roc_auc" = "ROC AUC",
      "accuracy" = "Accuracy",
      metric_name
    )
    parts <- c(parts, paste0(label, ": ", value))
  }

  paste(parts, collapse = "<br>")
}