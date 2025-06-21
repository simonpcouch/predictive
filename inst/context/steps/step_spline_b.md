## `step_spline_b()`

Generates a B-spline basis expansion of a numeric variable.

Arguments:
* `deg_free`: The degrees of freedom for the spline. Tunable.
* `degree`: The polynomial degree for the spline. Tunable.
* `complete_set`: If `TRUE`, returns the complete basis matrix.
* `options`: A list of options for `splines2::bSpline()`.
* `keep_original_cols`: If `TRUE`, keeps the original variable.
