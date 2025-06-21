## `pls()`

Partial Least Squares (PLS) is a dimension reduction method that creates components to explain both predictor and outcome variation. It is highly effective for datasets with many correlated predictors (e.g., "wide" data) and is very fast to fit.

Arguments:
* `num_comp`: The number of PLS components to retain. This is the primary tuning parameter and it is recommended to tune it.
* `predictor_prop`: The proportion of predictors to keep in each component (for sparse PLS). It is recommended to tune this parameter for built-in feature selection.

Engines:
* `mixOmics` (classification, regression)
    - A powerful and flexible engine for PLS and its variants.
    - Requires the `plsmod` extension package.

