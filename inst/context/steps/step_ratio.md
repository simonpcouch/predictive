## `step_ratio()`

Creates one or more ratios from selected numeric variables.

Arguments:
* `...`: Numeric variables to use as numerators in the ratio calculation.
* `denom`: Variables to use as denominators, specified using `denom_vars()`.
* `naming`: Function that defines the naming convention for new ratio columns. Default uses `{numerator}_o_{denominator}`.
* `columns`: Character string of selected variable names (populated by `prep()`).
