## `step_YeoJohnson()`

Applies Yeo-Johnson transformations to make variable distributions more symmetric. Similar to Box-Cox but works with negative values.

Arguments:
* `lambdas`: Numeric vector of transformation values. `NULL` until computed by `prep()`.
* `limits`: Numeric vector of length 2 defining the range for lambda parameter calculation. Default: `c(-5, 5)`.
* `num_unique`: Integer. Variables with fewer unique values than this will not be transformed. Default: 5.
* `na_rm`: Logical. Remove NA values during computation? Default: `TRUE`.
