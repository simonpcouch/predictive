## `logistic_reg()`

Logistic regression is a fundamental, highly interpretable statistical method for binary classification. It is extremely fast to fit and serves as an excellent baseline model.

Arguments:
* `penalty`: The total amount of regularization. It is recommended to tune this parameter when using regularized engines (e.g., `glmnet`, `LiblineaR`, `brulee`).
* `mixture`: The proportion of L1 (lasso) vs. L2 (ridge) regularization. It is recommended to tune this parameter when using regularized engines.

Engines:
* `glm` (classification)
    - The default engine. A fast, standard implementation.
    - No parsnip extension package is required.
* `glmnet` (classification)
    - Supports regularized regression (lasso, ridge, and elastic net), which is useful for high-dimensional data and feature selection. Supports `penalty` and `mixture`.
    - No parsnip extension package is required.
* `LiblineaR` (classification)
    - A fast engine for large-scale linear classification. Supports `penalty` and `mixture` (must be 0 or 1).
    - No parsnip extension package is required.
* `brulee` (classification)
    - A fast, Torch-based engine suitable for GPU acceleration. Supports `penalty` and `mixture`.
    - No parsnip extension package is required.
* `gee` (classification)
    - For correlated or clustered data (e.g., longitudinal studies).
    - Requires the `multilevelmod` extension package.
* `glmer` (classification)
    - For multilevel/hierarchical models with random effects.
    - Requires the `multilevelmod` extension package.

