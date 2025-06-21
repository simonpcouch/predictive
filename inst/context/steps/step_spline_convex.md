## `step_spline_convex()`

Generates convex spline features from a numeric variable to capture nonlinear trends.

Arguments:
* `deg_free`: The degrees of freedom for the spline. Higher values create more flexible curves. Tunable.
* `degree`: The degree of the C-spline. Tunable.
* `complete_set`: If `TRUE`, returns the complete basis matrix.
* `keep_original_cols`: If `TRUE`, the original columns are retained.
