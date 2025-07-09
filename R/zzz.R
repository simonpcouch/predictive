.onLoad <- function(libname, pkgname) {
  if (
    !is.null(getOption("predictive.use_default_turns")) &&
      basename(getwd()) == "predictive"
  ) {
    load("inst/sandbox/starter_turns.rda")
    globals$turns <- starter_turns
    library(tidymodels)
    library(modeldata)
    assign(
      "so_folds",
      vfold_cv(stackoverflow, strata = Salary),
      envir = .GlobalEnv
    )
  }
}
