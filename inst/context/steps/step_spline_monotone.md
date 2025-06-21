## `step_spline_monotone()`

Creates monotone spline features from a numeric variable to estimate non-linear trends.

Arguments:
* `deg_free`, the degrees of freedom for the spline. Tunable.
* `degree`, the degree of the I-spline. Tunable.
* `complete_set`, if `TRUE`, the complete basis matrix is returned.
* `options`, a list of options for `splines2::iSpline()`.
* `keep_original_cols`, if `TRUE`, the original variables are kept.

