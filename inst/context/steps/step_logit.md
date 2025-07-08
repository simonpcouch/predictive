## `step_logit()`

Logit transforms data using f(p) = log(p/(1-p)). Takes values between 0 and 1 and maps them to the real line.

Arguments:
* `offset`: Numeric value to modify values that are one (to `1-offset`) or zero (to `offset`).
* `columns`: Character vector of column names to transform.
