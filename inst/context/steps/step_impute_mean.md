## `step_impute_mean()`

Imputes missing values in numeric variables using the mean value from the training set.

Arguments:
* `...`: Variables to impute. Use tidy selection.
* `means`: Named numeric vector of means. `NULL` until `prep()` is called.
* `trim`: Fraction (0 to 0.5) of observations to trim from each end before computing the mean.
