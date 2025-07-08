## `step_pls()`

Creates supervised PLS components from numeric predictors. Requires outcome data for computation. Requires the Bioconductor `mixOmics` package.

Arguments:
* `num_comp`: Number of PLS components to retain. Default is 2. Tunable.
* `predictor_prop`: Maximum proportion of predictors with non-zero coefficients per component (for sparsity). Default is 1. Tunable.
* `outcome`: Specifies outcome variable(s). Required.
* `options`: List of options passed to the underlying `mixOmics` functions.
* `prefix`: Character string for the prefix of resulting variables. Default is "PLS".
