## `step_spline_natural()`

Creates natural spline features from a numeric variable to estimate non-linear trends.

Arguments:
* `deg_free`: The degrees of freedom for the natural spline. Higher values lead to more flexible curves. This argument is tunable.
* `complete_set`: A logical. If `TRUE`, the complete basis matrix is returned. If `FALSE`, the first basis column is excluded.
* `options`: A list of options to pass to `splines2::naturalSpline()`.
* `keep_original_cols`: A logical. If `TRUE`, the original columns are kept in the data set.
