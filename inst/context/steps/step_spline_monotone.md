## `step_spline_monotone()`

Creates monotone spline features for numeric predictors. These are integrated forms of M-splines that are non-negative and monotonic.

Arguments:
* `deg_free`: Integer. Degrees of freedom for b-spline (higher values = more flexible curves). Default: 10. Tunable.
* `degree`: Integer. Degree of I-spline defined as degree of associated M-spline. Default: 3. Tunable.
* `complete_set`: Logical. If TRUE, returns complete basis matrix; otherwise excludes first basis. Default: TRUE.
* `options`: List. Additional options passed to `splines2::iSpline()` (excluding `x`, `df`, `degree`, `periodic`, or `intercept`).
* `results`: List of objects created during training.
