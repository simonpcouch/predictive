## `step_impute_bag()`

Imputes missing values in one or more variables using bagged tree models. This can be computationally intensive.

Arguments:
* `impute_with`, Predictor variables used to impute the missing data.
* `trees`, The number of bagging iterations. This argument is tunable.
* `options`, A list of options to pass to `ipred::ipredbagg()`.
* `seed_val`, An integer for random number generation to ensure reproducibility.

