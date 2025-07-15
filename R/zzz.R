.onLoad <- function(libname, pkgname) {
  if (
    !is.null(getOption("predictive.use_default_turns")) &&
      basename(getwd()) == "predictive" &&
      interactive()
  ) {
    load("inst/sandbox/starter_turns.rda")
    globals$turns <- starter_turns

    do.call(require, list(package = "tidymodels", quietly = TRUE))
    assign(
      "so_folds",
      vfold_cv(stackoverflow, strata = Salary),
      envir = .GlobalEnv
    )
  }
}
