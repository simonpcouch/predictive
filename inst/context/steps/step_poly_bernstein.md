## `step_poly_bernstein()`

Creates Bernstein polynomial features from numeric predictors.

Arguments:
* `degree`: Integer. Polynomial degree controlling curve complexity. Default is 10. Tunable.
* `complete_set`: Logical. If `TRUE`, returns complete basis matrix; if `FALSE`, excludes first basis. Default is `FALSE`.
* `options`: List of options to pass to `splines2::bernsteinPoly()` (excluding `x` and `degree`).
