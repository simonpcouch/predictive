## `step_spline_convex()`

Creates convex spline features for numeric variables.

Arguments:
* `deg_free`: Degrees of freedom for the b-spline. Higher values create more flexible curves. Default is 10. Tunable.
* `degree`: Degree of C-spline (defined as degree of associated M-spline). Default is 3. Tunable.
* `complete_set`: Logical. If TRUE, returns complete basis matrix; if FALSE, excludes first basis. Default is TRUE.
* `options`: List of options for `splines2::cSpline()` (cannot include `x`, `df`, `degree`, or `intercept`).
* `results`: List of objects created after training.
