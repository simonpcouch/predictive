card_render_experiment <- function(name, exp) {
  status_icon <- if (exp$status == "running") {
    tags$i(class = "fa fa-spinner fa-spin", style = "color: #6c757d;")
  } else if (!is.null(exp$error)) {
    tags$i(class = "fa fa-times", style = "color: #dc3545;")
  } else {
    tags$i(class = "fa fa-check", style = "color: #28a745;")
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
  
  completed_exps <- Filter(function(e) e$status == "completed" && is.null(e$error) && !is.null(e$metrics), the$experiments)
  if (length(completed_exps) <= 1) return("")
  
  metric_col <- if ("rmse" %in% names(exp$metrics)) {
    "rmse"
  } else if ("roc_auc" %in% names(exp$metrics)) {
    "roc_auc"
  } else {
    return("")
  }
  
  current_value <- exp$metrics[[metric_col]][1]
  
  for (other_exp in completed_exps) {
    if (identical(other_exp, exp)) next
    other_value <- other_exp$metrics[[metric_col]][1]
    
    is_worse <- switch(metric_col,
      "rmse" = other_value < current_value,
      "roc_auc" = other_value > current_value,
      FALSE
    )
    
    if (is_worse) return("")
  }
  
  "Current best!"
}

card_metrics_display <- function(exp) {
  if (exp$status != "completed" || is.null(exp$metrics) || !is.null(exp$error)) {
    return("")
  }
  
  metrics <- exp$metrics
  parts <- character(0)
  
  for (metric in c("rmse", "rsq", "roc_auc", "accuracy")) {
    if (metric %in% names(metrics)) {
      value <- round(metrics[[metric]][1], 3)
      label <- switch(metric,
        "rmse" = "RMSE",
        "rsq" = "R²",
        "roc_auc" = "ROC AUC",
        "accuracy" = "Accuracy"
      )
      parts <- c(parts, paste0(label, ": ", value))
    }
  }
  
  paste(parts, collapse = "<br>")
}