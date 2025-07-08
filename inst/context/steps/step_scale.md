## `step_scale()`

Standardizes numeric variables to have a standard deviation of one.

Arguments:
* `...`: Variables to scale
* `sds`: Named numeric vector of standard deviations (computed by `prep()`)
* `factor`: Numeric (1 or 2). Scale by one or two standard deviations. Using 2 makes continuous coefficients comparable to binary ones. Default: 1
* `na_rm`: Logical. Remove NAs when computing standard deviation?
