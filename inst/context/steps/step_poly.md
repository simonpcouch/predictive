## `step_poly()`

Creates new columns that are orthogonal polynomial basis expansions of variables.

Arguments:
* `degree`: Integer. Polynomial degree. Default: 2. Tunable.
* `options`: List of options for `stats::poly()`. Setting `raw = TRUE` produces regular (non-orthogonalized) polynomials.
