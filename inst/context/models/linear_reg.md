## `linear_reg()`

Linear regression is a fundamental, highly interpretable statistical method for predicting a numeric outcome. It is extremely fast to fit and serves as an excellent baseline model.

Arguments:
* `penalty`: The total amount of regularization. It is recommended to tune this parameter when using regularized engines (e.g., `glmnet`, `brulee`).
* `mixture`: The proportion of L1 (lasso) vs. L2 (ridge) regularization. It is recommended to tune this parameter when using regularized engines.

Engines:
* `lm` (regression)
    - The default engine. A fast, standard implementation using ordinary least squares.
    - No parsnip extension package is required.
* `glm` (regression)
    - A standard, fast engine for generalized linear models, which includes linear regression.
    - No parsnip extension package is required.
* `glmnet` (regression)
    - Supports regularized regression (lasso, ridge, and elastic net), which is useful for high-dimensional data and feature selection. Supports `penalty` and `mixture`.
    - No parsnip extension package is required.
* `brulee` (regression)
    - A fast, Torch-based engine suitable for GPU acceleration, especially with large datasets. Supports `penalty` and `mixture`.
    - No parsnip extension package is required.
* `gee` (regression)
    - For correlated or clustered data (e.g., longitudinal studies).
    - Requires the `multilevelmod` extension package.
* `glmer` (regression)
    - For multilevel/hierarchical models with random effects.
    - Requires the `multilevelmod` extension package.
* `quantreg` (quantile regression)
    - For modeling specific quantiles of the outcome, not just the mean.
    - No parsnip extension package is required.
* `h2o` (regression)
    - A fast, scalable engine for large datasets.
    - Requires the `agua` extension package.

