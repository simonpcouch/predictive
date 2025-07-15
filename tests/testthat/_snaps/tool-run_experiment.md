# run_experiment validates resampling_fn argument

    Code
      run_experiment(folds = "cv_folds", recipe = "recipe(mpg ~ ., data = mtcars)",
        model = "null_model()", resampling_fn = "invalid_function", name = "test_exp",
        purpose = "test")
    Condition
      Error in `run_experiment()`:
      ! unused argument (folds = "cv_folds")

