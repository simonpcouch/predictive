## `step_bs()`

Generates B-spline basis functions for variables to model non-linear trends. This can be computationally intensive.

Arguments:
* `deg_free`, the degrees of freedom for the spline. Higher values create more flexible curves and increase fit time. Tunable.
* `degree`, the degree of the polynomial spline. Tunable.
* `options`, a list of options for `splines::bs()`.
* `keep_original_cols`, a logical to keep the original variables.
