the <- rlang::new_environment()

# Each experiment is a list with slots:
# - status: "running" or "completed"
# - script: R code string (always available)
# - metrics: data.frame (NULL until completed successfully)
# - error: character string (NULL if no error)
# - started_at: POSIXct timestamp
# - completed_at: POSIXct timestamp (NULL until finished)
# - seen_by_model: logical (whether model has been told about results)
# - synchronous: logical (whether experiment was run synchronously)
the$experiments <- list()

running_experiments <- function() {
  names(Filter(function(exp) exp$status == "running", the$experiments))
}

new_experiments <- function() {
  names(Filter(
    function(exp) exp$status == "completed" && !exp$seen_by_model,
    the$experiments
  ))
}

new_async_experiments <- function() {
  names(Filter(
    function(exp) exp$status == "completed" && !exp$seen_by_model && !exp$synchronous,
    the$experiments
  ))
}

ordered_experiments <- function() {
  if (length(the$experiments) == 0) return(character(0))

  start_times <- sapply(the$experiments, function(exp) exp$started_at)
  names(the$experiments)[order(start_times, decreasing = TRUE)]
}
