## `step_poly()`

Creates new features from a variable using orthogonal polynomials to model non-linear relationships.

Arguments:
* `degree`: The polynomial degree. Tunable.
* `options`: A list of options for `stats::poly()`, such as `raw = TRUE` to use regular (non-orthogonal) polynomials.
* `keep_original_cols`: A logical to keep the original variables in the output.
