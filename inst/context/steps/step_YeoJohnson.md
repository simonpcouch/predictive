## `step_YeoJohnson()`

Applies a Yeo-Johnson power transformation to numeric data, which can help normalize or symmetrize the data's distribution. It is similar to the Box-Cox transformation but accommodates non-positive values.

Arguments:
* `lambdas`: The transformation parameter. This is not tunable and is estimated by `prep()`.
* `limits`: A length-2 numeric vector defining the search range for the transformation parameter `lambda`.
* `num_unique`: An integer threshold for the minimum number of unique values a variable must have to be transformed. Tunable.
* `na_rm`: A logical indicating whether to remove `NA` values during computation. Tunable.

