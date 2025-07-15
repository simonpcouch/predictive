test_that("run_experiment returns ContentToolResult with expected structure", {
  skip_if_not_installed("parsnip")
  skip_if_not_installed("recipes")
  skip_if_not_installed("rsample")
  skip_if_not_installed("tune")

  data(mtcars)
  cv_folds <- rsample::vfold_cv(mtcars, v = 3)
  assign("cv_folds", cv_folds, envir = .GlobalEnv)
  withr::defer(rm("cv_folds", envir = .GlobalEnv))

  result <- run_experiment(
    .folds = "cv_folds",
    recipe = "recipes::recipe(mpg ~ ., data = mtcars)",
    model = "parsnip::null_model() %>% parsnip::set_engine('parsnip') %>% parsnip::set_mode('regression')",
    resampling_fn = "fit_resamples",
    name = "null_model_test",
    purpose = "test"
  )

  expect_s3_class(result, "ellmer::ContentToolResult")
  expect_true(grepl("Experiment null_model_test running", result@value))

  Sys.sleep(.5)

  # experiment should be tracked immediately
  expect_true("null_model_test" %in% names(the$experiments))
  expect_equal(the$experiments$null_model_test$status, "running")
  expect_true("script" %in% names(the$experiments$null_model_test))
  expect_false(the$experiments$null_model_test$seen_by_model)

  # wait a bit and check if experiment completes
  Sys.sleep(2)

  if (the$experiments$null_model_test$status == "completed") {
    expect_true("metrics" %in% names(the$experiments$null_model_test))
    expect_s3_class(the$experiments$null_model_test$metrics, "data.frame")
    expect_true(nrow(the$experiments$null_model_test$metrics) > 0)
    expect_null(the$experiments$null_model_test$error)
  }
})


test_that("run_experiment_safely handles errors gracefully", {
  skip_if_not_installed("parsnip")

  result <- run_experiment_safely(
    folds = "nonexistent_folds",
    recipe = "invalid_recipe",
    model = "parsnip::null_model()",
    resampling_fn = "fit_resamples",
    name = "error_test",
    purpose = "test"
  )

  expect_s3_class(result, "ellmer::ContentToolResult")
  expect_true(!is.null(result@error))
  expect_true("script" %in% names(result@extra))
})

test_that("run_experiment validates resampling_fn argument", {
  expect_snapshot(
    error = TRUE,
    run_experiment(
      .folds = "cv_folds",
      recipe = "recipe(mpg ~ ., data = mtcars)",
      model = "null_model()",
      resampling_fn = "invalid_function",
      name = "test_exp",
      purpose = "test"
    )
  )
})
