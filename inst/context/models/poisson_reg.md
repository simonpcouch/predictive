## `poisson_reg()`

Poisson regression for modeling count data. Generally fast to fit.

Arguments:
* `penalty`: Regularization amount. Tune.
* `mixture`: L1 vs. L2 regularization ratio. Tune.

Engines:
* `glm` (regression)
    - Default engine for a standard Poisson GLM.
    - Doesn't support regularization.
    - Requires `poissonreg` package.
* `glmnet` (regression)
    - Good for high-dimensional data or when regularization is needed.
    - Requires `poissonreg` package.
* `h2o` (regression)
    - A powerful, scalable engine for large datasets.
    - Doesn't support regularization in this interface.
    - Requires `agua` package.
* `gee` (regression)
    - For correlated count data via Generalized Estimating Equations.
    - Doesn't support regularization.
    - Requires the `multilevelmod` package.
* `glmer` (regression)
    - For multilevel/hierarchical count data.
    - Doesn't support regularization.
    - Requires the `multilevelmod` package.

