## `logistic_reg()`

Logistic regression models the log odds of a binary event using a linear combination of predictors. Fast to fit with standard engines, scales well to large datasets.

Arguments:
* `penalty`: Amount of regularization. tune.
* `mixture`: Proportion of L1 regularization (lasso) vs L2 (ridge). tune.

Engines:
* `glm` (classification)
  - Doesn't support regularization arguments
  - Basic implementation using standard generalized linear model
* `LiblineaR` (classification)
  - Fast implementation for linear models
  - `mixture` must be exactly 0 or 1
* `brulee` (classification)
  - GPU-accelerated implementation
* `gee` (classification)
  - Generalized estimating equations for correlated data
  - Requires multilevelmod extension
* `glmer` (classification)
  - Fits mixed effects logistic regression models
  - Requires multilevelmod extension
