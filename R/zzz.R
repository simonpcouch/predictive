.onLoad <- function(libname, pkgname) {
  if (
    !is.null(getOption("predictive.use_default_turns")) &&
      basename(getwd()) == "predictive"
  ) {
    load("inst/sandbox/starter_turns.rda")
    globals$turns <- starter_turns
  }
}
