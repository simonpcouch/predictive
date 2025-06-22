run_experiment <- function(
  folds,
  recipe,
  model,
  resampling_fn,
  name
) {
  preprocessor <- eval(parse(text = recipe))
  spec <- eval(parse(text = model))
  rlang::arg_match(resampling_fn, resampling_fns)

  cl <- rlang::call2(
    resampling_fn,
    # TODO: maybe this needs to be cached and retrieved from somewhere.
    # should this be its own tool call?
    object = spec,
    preprocessor = preprocessor,
    resamples = get(folds),
    .ns = if (resampling_fn %in% c("tune_race_anova", "tune_sim_anneal")) {
      "finetune"
    } else {
      "tune"
    }
  )

  # TODO: should this just run_r_code with mock_script() so that
  # we get the same streaming "for free"?
  resampling_result <- rlang::eval_bare(cl)
  metrics <- tune::collect_metrics(resampling_result)
  script <- mock_script(
    folds = folds,
    recipe = recipe,
    model = model,
    resampling_fn = resampling_fn
  )

  rlang::env_bind(
    the,
    !!name := list(script = script, metrics = metrics)
  )

  ellmer::ContentToolResult(
    value = btw::btw_this(metrics, format = "json"),
    extra = list(script = script)
  )
}

run_experiment_safely <- function(
 folds,
 recipe,
 model,
 resampling_fn,
 name
) {
 tryCatch({
   run_experiment(folds, recipe, model, resampling_fn, name)
 }, error = function(e) {
   error_msg <- conditionMessage(e)
   if (exists(".Last.tune.result")) {
     # TODO: this may not actually be surfacing the right information
     # if an experiment failed but did so outside of a tuning process
     error_msg <- c(
      error_msg,
      capture.output(show_notes(.Last.tune.result))
     )
   }
   
   ellmer::ContentToolResult(
     error = paste0(error_msg, collapse = "\n"),
     extra = list(
       script = mock_script(
         recipe = recipe,
         model = model,
         resampling_fn = resampling_fn,
         folds = folds
       )
     )
   )
 })
}

resampling_fns <- c(
  "fit_resamples",
  "tune_grid",
  "tune_bayes",
  "tune_race_anova",
  "tune_sim_anneal"
)

mock_script <- function(recipe, model, resampling_fn, folds) {
  glue::glue(
"{resampling_fn}(
  resamples = {folds},
  object = {model},
  preprocessor = {recipe}
)"
  )
}

concatenate_directory <- function(dir) {
  files <- list.files(
    system.file(paste0("context/", dir), package = "modelbot"),
    full.names = TRUE
  )
  paste0(
    purrr::map_chr(files, ~paste0(readLines(.x), collapse = "\n"), warn = FALSE),
    collapse = "\n"
  )
}

tool_run_experiment <- 
  tool(
    run_experiment_safely,
    "Carries out a modeling experiment with tidymodels. This should be the
     _only_ mechanism by which the assistant actually fits models.",
    folds = type_string("The name of the resamples object."),
    recipe = type_string(paste0(c(
      readLines(system.file("prompts/recipe.md", package = "modelbot")),
      concatenate_directory("steps")
    ), collapse = "\n")),
    model = type_string(paste0(c(
      readLines(system.file("prompts/model.md", package = "modelbot")),
      concatenate_directory("models")
    ), collapse = "\n")),
    resampling_fn = type_string(paste0(c(
      cli::format_inline("One of {.or resampling_fns}."),
      "When there are no parameters to tune, use fit_resamples.",
      "When there are parameters to tune, tune_race_anova is usually your best
       bet, as it is a more performant version of tune_grid.",
      "Do not include parantheses after the function name."
    ), collapse = "\n")),
    name = type_string("A unique name for the experiment, composed only of alphanumerics and underscores. The name should be less than 20 characters and, if possible, describe the model/recipe/resampling_fn. e.g. linear_reg_pca_race."),
    .convert = FALSE,
    .name = "run_experiment"
  )
