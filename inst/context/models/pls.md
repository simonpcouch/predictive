## `pls()`

Partial least squares (PLS) creates supervised latent variables that model relationships between predictors and outcome. Fast to fit and works well with high-dimensional data.

Arguments:
* `predictor_prop`: Maximum proportion of predictors with non-zero coefficients per component. tune.
* `num_comp`: Number of PLS components to retain. tune.

Engines:
* `mixOmics` (classification, regression)
  - Requires plsmod extension.
