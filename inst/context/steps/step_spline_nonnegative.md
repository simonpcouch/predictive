## `step_spline_nonnegative()`

Creates non-negative M-spline features from a numeric variable to estimate non-linear trends.

Arguments:
* `deg_free`: An integer for the degrees of freedom for the spline. Higher values create more flexible curves. (tunable)
* `degree`: A non-negative integer for the degree of the piecewise polynomial (e.g., 3 for cubic splines). (tunable)
* `complete_set`: A logical. If `TRUE`, the complete basis matrix is returned.
* `options`: A list of options for `splines2::mSpline()`.
* `keep_original_cols`: A logical to keep the original variables in the output.

