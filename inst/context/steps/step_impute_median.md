## `step_impute_median()`

Imputes missing numeric data using the median value from the training set.

Arguments:
* `...`: Selector functions to choose which variables to impute
* `medians`: Named numeric vector of medians (NULL until computed by `prep()`)
