#' @keywords internal
"_PACKAGE"

silence_imports <- function() {
  R6::R6Class
  httr2::request
}

## usethis namespace: start
#' @import rlang
## usethis namespace: end
NULL

globalVariables(c(
  ".Last.tune.result",
  "Salary",
  "capture.output",
  "head",
  "sessionInfo",
  "show_notes",
  "stackoverflow",
  "starter_turns",
  "tail",
  "vfold_cv"
))
