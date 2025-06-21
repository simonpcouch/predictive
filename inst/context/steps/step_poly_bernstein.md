## `step_poly_bernstein()`

`step_poly_bernstein()` creates a specification of a recipe step that generates Bernstein polynomial features from a numeric variable. This is useful for estimating non-linear trends.

Arguments:
* `degree`: The integer degree of the polynomial. This argument is tunable.
* `complete_set`: A logical. If `TRUE`, the complete basis matrix is returned; otherwise, the first basis is excluded.
* `options`: A list of options for `splines2::bernsteinPoly()`.
* `keep_original_cols`: A logical indicating whether to keep the original variables in the output.
