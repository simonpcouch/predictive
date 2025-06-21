## `pls()`

Partial Least Squares (PLS). A powerful method for dimensionality reduction and regression/classification, especially with collinear predictors. Fitting speed is moderate.

Arguments:
* `num_comp`: Number of PLS components to retain. Tune.
* `predictor_prop`: Max proportion of non-zero predictor coefficients per component. Tune.

Engines:
* `mixOmics` (classification, regression)
    - A versatile engine for PLS and related methods.
    - Requires the `plsmod` package.

