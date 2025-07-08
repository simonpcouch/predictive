## `step_BoxCox()`

Applies the Box-Cox transformation to make numeric data more normally distributed. Requires strictly positive variables.

Arguments:
* `...`: Variables to transform
* `lambdas`: Transformation parameters, computed during `prep()`
* `limits`: Numeric vector of length 2 defining the range for lambda parameter optimization. Default: c(-5, 5)
* `num_unique`: Minimum required unique values to evaluate for transformation. Default: 5
