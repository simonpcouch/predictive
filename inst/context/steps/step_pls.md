## `step_pls()`

Extracts a set of new features from numeric predictors using partial least squares (PLS). As a supervised method, it requires an outcome. This step can be computationally intensive.

Arguments:
* `num_comp`: The number of PLS components to retain. (tunable)
* `predictor_prop`: The maximum proportion of original predictors with non-zero coefficients for each PLS component. (tunable)
* `outcome`: The bare name of the outcome variable.
* `options`: A list of options to pass to the underlying `mixOmics` functions.
* `prefix`: A character string for the prefix of the new component variables.
* `keep_original_cols`: A logical indicating whether to keep the original predictors.

