## `step_spline_natural()`

Creates natural spline (restricted cubic spline) features from numeric predictors.

Arguments:
* `deg_free`: Degrees of freedom for the natural spline. Controls flexibility of curves (higher = more complex). Minimum of 2. Tunable.
* `complete_set`: Logical. If TRUE, returns complete basis matrix. If FALSE, excludes first basis.
* `options`: List of options for `splines2::naturalSpline()` (excluding `x`, `df`, and `intercept`).
* `results`: List of objects created after step training.
