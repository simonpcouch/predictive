## `step_impute_mode()`

Imputes missing values in nominal variables using the most common value (mode) from the training set.

Arguments:
* `...`: Selectors for variables to impute
* `modes`: Named character vector of modes (populated during `prep()`)
* `ptype`: Data frame prototype for casting new data
