## `logistic_reg()`

Logistic regression for binary classification. Fast, interpretable, and a good baseline model.

Arguments:
* `penalty`: Regularization amount. Tune.
* `mixture`: L1 vs. L2 regularization ratio. Tune.

Engines:
* `glm` (classification)
    - Default engine.
    - Doesn't support regularization.
    - No extension package needed.
* `glmnet` (classification)
    - Good for high-dimensional data or when regularization is needed.
    - No extension package needed.
* `LiblineaR` (classification)
    - Fast for large, sparse datasets. `mixture` must be 0 (L2) or 1 (L1).
    - No extension package needed.
* `brulee` (classification)
    - Torch-based engine, can use GPUs for speed.
    - No extension package needed.
* `gee` (classification)
    - For correlated data via Generalized Estimating Equations.
    - Doesn't support regularization.
    - Requires the `multilevelmod` package.
* `glmer` (classification)
    - For multilevel/hierarchical models.
    - Doesn't support regularization.
    - Requires the `multilevelmod` package.

