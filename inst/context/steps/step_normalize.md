## `step_normalize()`

Centers and scales numeric data to have mean 0 and standard deviation 1.

Arguments:
* `...`: Variables to normalize
* `means`: Named numeric vector of means (computed by `prep()`)
* `sds`: Named numeric vector of standard deviations (computed by `prep()`)
* `na_rm`: Logical. Remove NA values when computing means and standard deviations?
