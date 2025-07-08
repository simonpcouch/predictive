## `step_spline_b()`

Creates B-spline features from numeric predictors for modeling non-linear relationships.

Arguments:
* `deg_free`: Integer. Degrees of freedom (default: 10). Higher values create more flexible curves. Tunable.
* `degree`: Integer. Degree of polynomial (default: 3). Zero allowed for piecewise constant basis functions. Tunable.
* `complete_set`: Logical. If TRUE, returns complete basis matrix; if FALSE, excludes first basis.
* `options`: List of options for `splines2::bSpline()` (excluding `x`, `df`, `degree`, and `intercept`). Setting `periodic = TRUE` creates periodic splines.
