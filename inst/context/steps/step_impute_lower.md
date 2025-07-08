## `step_impute_lower()`

Imputes numeric data below the threshold of measurement by simulating random uniform values between zero and the minimum.

Arguments:
* `threshold`: Named numeric vector of lower bounds. `NULL` until computed by `prep()`.
