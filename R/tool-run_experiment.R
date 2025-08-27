run_experiment <- function(
  .folds,
  recipe,
  model,
  resampling_fn,
  name,
  purpose,
  synchronous = FALSE
) {
  rlang::arg_match(resampling_fn, resampling_fns)

  script <- mock_script(
    folds = .folds,
    recipe = recipe,
    model = model,
    resampling_fn = resampling_fn
  )
  folds_obj <- get(.folds)

  the$experiments[[name]] <- list(
    status = "running",
    script = script,
    metrics = NULL,
    workflow = NULL,
    error = NULL,
    started_at = Sys.time(),
    completed_at = NULL,
    seen_by_model = FALSE,
    purpose = purpose,
    synchronous = synchronous
  )
  currently_loaded <- names(sessionInfo()$otherPkgs)
  m <- mirai::mirai(
    {
      load_required_packages(currently_loaded)

      preprocessor <- eval(parse(text = recipe))
      spec <- eval(parse(text = model))

      .ns <- switch(
        resampling_fn,
        tune_race_anova = ,
        tune_sim_anneal = "finetune",
        "tune"
      )

      cl <- rlang::call2(
        resampling_fn,
        object = spec,
        preprocessor = preprocessor,
        resamples = folds_obj,
        .ns = .ns
      )

      # If the resampling fails in every fit, the tuning function will still
      # return without error but the metric collection will fail and ask the
      # user to `show_notes()`; by the time the mirai has exited, the object
      # it references is no longer around
      resampling_result <- rlang::eval_bare(cl)
      tryCatch(
        {
          metrics <- tune::collect_metrics(resampling_result)
        },
        error = function(e) {
          error_msg <- conditionMessage(e)
          if (grepl("All models failed", error_msg)) {
            cli::cli_abort(
              paste0(
                capture.output(show_notes(resampling_result)),
                collapse = "\n"
              ),
              parent = e
            )
          }
          # otherwise, just raise it as-is
          rlang::cnd_signal(e)
        }
      )

      wflow <- workflows::workflow() %>%
        workflows::add_recipe(preprocessor) %>%
        workflows::add_model(spec)
      
      if (resampling_fn %in% c("tune_grid", "tune_bayes", "tune_race_anova", "tune_sim_anneal")) {
        best_params <- tune::select_best(resampling_result)
        wflow <- tune::finalize_workflow(wflow, best_params)
      }

      list(metrics = metrics, workflow = wflow)
    },
    list2env(
      c(
        as.list(environment()),
        list(
          load_required_packages = load_required_packages,
          currently_loaded = currently_loaded
        )
      ),
      global_env()
    )
  )

  promises::then(
    m,
    onFulfilled = function(result) {
      the$experiments[[name]]$status <- "completed"
      the$experiments[[name]]$metrics <- result$metrics
      the$experiments[[name]]$workflow <- result$workflow
      the$experiments[[name]]$completed_at <- Sys.time()
    },
    onRejected = function(error) {
      the$experiments[[name]]$status <- "completed"
      the$experiments[[name]]$error <- conditionMessage(error)
      the$experiments[[name]]$completed_at <- Sys.time()
    }
  )

  if (in_vitals_eval()) {
    synchronous <- TRUE
  }

  if (synchronous) {
    res <- mirai::collect_mirai(m)
    if (mirai::is_error_value(res)) {
      cat_on_eval("- Experiment {name} completed with error {res}.")
      the$experiments[[name]]$status <- "completed"
      the$experiments[[name]]$error <- res
      the$experiments[[name]]$completed_at <- Sys.time()
      return(ellmer::ContentToolResult(
        error = res,
        extra = list(
          display_tool_request = FALSE,
          display = list(
            html = shiny::HTML(sprintf(
              '<p class="shiny-tool-request">Experiment launched (%s, %s)</p>',
              name,
              "sync"
            ))
          )
        )
      ))
    }
    cat_on_eval("- Experiment {name} finished successfully.")
    the$experiments[[name]]$status <- "completed"
    the$experiments[[name]]$metrics <- res$metrics
    the$experiments[[name]]$workflow <- res$workflow
    the$experiments[[name]]$completed_at <- Sys.time()
    return(ellmer::ContentToolResult(
      value = btw::btw_this(res$metrics),
      extra = list(
        display_tool_request = FALSE,
        display = list(
          html = shiny::HTML(sprintf(
            '<p class="shiny-tool-request">Experiment launched (%s, %s)</p>',
            name,
            "sync"
          ))
        )
      )
    ))
  }

  ellmer::ContentToolResult(
    value = paste0(
      c(
        "Experiment ",
        name,
        " running.\n\n",
        "This is not a notification that the experiment finished; you will be 
      notified of experimental results whenever the user replies to you. You 
      cannot access experimental results by running R code. The user can
      see when experiments finish; if you've launched a few experiments and
      want to learn how they went, hand over control to the user."
      ),
      collapse = ""
    ),
    extra = list(
      display_tool_request = FALSE,
      display = list(
        html = shiny::HTML(sprintf(
          '<p class="shiny-tool-request">Experiment launched (%s, %s)</p>',
          name,
          if (synchronous) "sync" else "async"
        ))
      )
    )
  )
}

run_experiment_safely <- function(
  folds,
  recipe,
  model,
  resampling_fn,
  name,
  purpose,
  synchronous = FALSE
) {
  cat_on_eval("\n\nRunning experiment {name}.")
  if (name %in% names(the$experiments)) {
    ellmer::ContentToolResult(
      value = NULL,
      error = glue::glue(
        "`name` '{name}' is the name of an experiment that exists already. ",
        "Please choose a unique name."
      )
    )
  }
  tryCatch(
    {
      run_experiment(
        .folds = folds,
        recipe = recipe,
        model = model,
        resampling_fn = resampling_fn,
        name = name,
        purpose = purpose,
        synchronous = synchronous
      )
    },
    error = function(e) {
      error_msg <- conditionMessage(e)
      cat_on_eval("- Experiment failed with '{error_msg}'.")
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
          display_tool_request = FALSE,
          display = list(
            html = shiny::HTML(sprintf(
              '<p class="shiny-tool-request">Experiment failed (%s, %s)</p>',
              name,
              if (synchronous) "sync" else "async"
            ))
          ),
          script = mock_script(
            recipe = recipe,
            model = model,
            resampling_fn = resampling_fn,
            folds = folds
          )
        )
      )
    }
  )
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

load_required_packages <- function(
  currently_loaded = names(sessionInfo()$otherPkgs)
) {
  loaded_packages <- c(
    "tidymodels",
    parsnip:::extensions(),
    setdiff(
      currently_loaded,
      c(tidymodels::tidymodels_packages(), "predictive")
    )
  )

  for (pkg in loaded_packages) {
    tryCatch(
      suppressPackageStartupMessages(
        library(pkg, character.only = TRUE, quietly = TRUE)
      ),
      error = function(e) {}
    )
  }
}

tool_run_experiment <-
  tool(
    run_experiment_safely,
    "Carries out a modeling experiment with tidymodels. This should be the
     _only_ mechanism by which the assistant actually fits models.
     Be sure to namespace any functions you use from tidymodels in the recipe
     and model specifications.",
    arguments = list(
      folds = type_string("The name of the resamples object."),
      recipe = type_string(paste0(
        c(
          readLines(system.file("prompts/recipe.md", package = "predictive"))
        ),
        collapse = "\n"
      )),
      model = type_string(paste0(
        c(
          readLines(system.file("prompts/model.md", package = "predictive"))
        ),
        collapse = "\n"
      )),
      resampling_fn = type_string(paste0(
        c(
          cli::format_inline("One of {.or resampling_fns}."),
          "When there are no parameters to tune, use fit_resamples.",
          "When there are parameters to tune, tune_race_anova is usually your best
       bet, as it is a more performant version of tune_grid.",
          "Do not include parantheses after the function name."
        ),
        collapse = "\n"
      )),
      name = type_string(
        "A unique name for the experiment, composed only of alphanumerics and underscores. The name should be less than 20 characters and, if possible, describe the model/recipe/resampling_fn. e.g. linear_reg_pca_race."
      ),
      purpose = type_string(
        "A 5-word-or-less description of what's being newly explored in the experiment. This will be shown to the user alongside the name; using words that aren't redundant with the name is preferred."
      ),
      synchronous = type_boolean(paste0(
        c(
          "Whether the experiment should be run synchronously or not.",
          "The first experiments, with a null model and baseline fit, should ",
          "likely be run synchronously. Experiments after the first two should likely ",
          "be run asynchronously so you can run multiple at a time without freezing ",
          "the user's interface. Defaults to false, as in asynchronous."
        ),
        collapse = ""
      ))
    ),
    convert = FALSE,
    name = "run_experiment"
  )
