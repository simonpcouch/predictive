## `linear_reg()`

A standard linear regression model. Very fast to fit and serves as a good baseline.

Arguments:
* `penalty`: The total amount of regularization. Tune.
* `mixture`: The proportion of L1 (lasso) vs. L2 (ridge) regularization. Tune.

Engines:
* `lm` (regression)
    - The default engine, using ordinary least squares.
    - Does not support `penalty` or `mixture`.
    - No extension package needed.
* `glm` (regression)
    - Fits a generalized linear model without regularization.
    - Does not support `penalty` or `mixture`.
    - No extension package needed.
* `brulee` (regression)
    - A Torch-based engine that can leverage GPUs for speed.
    - Supports `penalty` and `mixture`.
    - No extension package needed.
* `glmnet` (regression)
    - Fits a regularized generalized linear model.
    - Supports `penalty` and `mixture`.
    - No extension package needed.
* `quantreg` (quantile regression)
    - Models the conditional quantiles of the outcome, not the mean.
    - Does not support `penalty` or `mixture`.
    - No extension package needed.
* `gee` (regression)
    - For correlated data using Generalized Estimating Equations.
    - Does not support `penalty` or `mixture`.
    - Requires the `multilevelmod` package.
* `glmer` (regression)
    - For multilevel/hierarchical models.
    - Does not support `penalty` or `mixture`.
    - Requires the `multilevelmod` package.
