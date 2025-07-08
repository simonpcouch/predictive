## `step_log()`

Applies a logarithmic transformation to numeric data.

Arguments:
* `base`: Numeric value for the logarithm base (default: exp(1))
* `offset`: Value to add to data prior to logging (to avoid log(0))
* `columns`: Character vector of column names to transform
* `signed`: Logical. If TRUE, takes the signed log (sign(x) * log(abs(x)) when |x| ≥ 1, 0 when |x| < 1). Ignores `offset` if TRUE
