## `linear_reg()`

Linear regression models fit a linear relationship between predictors and a numeric outcome. Fast to fit and interpret.

Arguments:
* `penalty`: Amount of regularization. tune.
* `mixture`: Proportion of L1 regularization (0=ridge, 1=lasso). tune.

Engines:
* `lm` (regression)
  - Standard OLS implementation. Fast and interpretable.
* `brulee` (regression)
  - Efficient GPU-accelerated implementation.
* `gee` (regression)
  - For correlated data. Requires multilevelmod extension.
* `glm` (regression)
  - Similar to lm but with flexibility for non-gaussian distributions.
* `glmer` (regression)
  - For mixed effects models with grouped data. Requires multilevelmod extension.
* `glmnet` (regression)
  - Best for high-dimensional data with many predictors.
* `quantreg` (quantile regression)
  - For modeling conditional quantiles rather than means.
* `spark` (regression)
  - For big data that doesn't fit in memory.
* `stan` (regression)
  - Bayesian implementation with uncertainty estimates.
