## `step_ns()`

Creates new features from a variable using natural splines, allowing models to capture non-linear relationships.

Arguments:
* `deg_free`: The degrees of freedom for the natural spline. Higher values create more flexible curves. This argument is tunable.
* `options`: A list of options for `splines::ns()`.
* `keep_original_cols`: A logical indicating whether to keep the original variables in the output.
