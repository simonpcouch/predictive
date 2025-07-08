## `multinom_reg()`

Multinomial regression models for multiclass classification problems. Fits relatively quickly for small to medium datasets.

Arguments:
* `penalty`: Amount of regularization. tune.
* `mixture`: Proportion of L1 regularization (1=lasso, 0=ridge). tune.

Engines:
* `nnet` (classification)
  - Simple implementation, moderate performance, good default choice.
* `brulee` (classification)
  - GPU-accelerated implementation, faster for larger datasets.
* `glmnet` (classification)
  - Efficient regularized implementation, best for high-dimensional data.
* `h2o` (classification)
  - Distributed computing capabilities, good for large datasets.
  - Requires agua extension.
* `keras` (classification)
  - Highly customizable, supports deep learning extensions.
  - For `keras`, `penalty` applies only L2 regularization.
