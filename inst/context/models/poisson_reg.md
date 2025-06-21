## `poisson_reg()`

Poisson regression is a generalized linear model used for modeling count data. It is a fundamental statistical method that is very fast to fit and highly interpretable, making it an excellent baseline for count outcomes.

Arguments:
* `penalty`: The total amount of regularization. It is recommended to tune this parameter when using the `glmnet` engine.
* `mixture`: The proportion of L1 (lasso) vs. L2 (ridge) regularization. It is recommended to tune this parameter when using the `glmnet` engine.

Engines:
* `glm` (regression)
    - The default engine. A fast, standard implementation.
    - Requires the `poissonreg` extension package.
* `glmnet` (regression)
    - Implements regularized Poisson regression (lasso, ridge, elastic net), useful for high-dimensional data. Supports `penalty` and `mixture`.
    - Requires the `poissonreg` extension package.
* `h2o` (regression)
    - A scalable engine designed for very large datasets.
    - Requires the `agua` extension package.
* `gee` (regression)
    - For modeling correlated or clustered count data (e.g., longitudinal studies).
    - Requires the `multilevelmod` extension package.
* `glmer` (regression)
    - For multilevel/hierarchical models with random effects.
    - Requires the `multilevelmod` extension package.

