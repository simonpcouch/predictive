## `poisson_reg()`

Poisson regression models for count data that follow a Poisson distribution. Relatively fast to fit with standard engines.

Arguments:
* `penalty`: Non-negative regularization amount. tune.
* `mixture`: Value between 0 and 1 for proportion of L1 regularization (1 = lasso, 0 = ridge). tune.

Engines:
* `glm` (regression)
  - Requires poissonreg extension.
* `glmnet` (regression) 
  - Requires poissonreg extension.
  - Efficient for high-dimensional data with regularization.
* `gee` (regression)
  - Requires multilevelmod extension.
  - Useful for clustered or longitudinal data.
* `glmer` (regression)
  - Requires multilevelmod extension.
  - Supports random effects for hierarchical/nested data.
* `h2o` (regression)
  - Requires agua extension.
  - Efficient for large datasets, supports distributed computing.
