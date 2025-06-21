## `step_profile()`

Creates a data grid where one variable is varied across a range of values, while all other variables are held constant. Useful for partial dependence plots.

Arguments:
* `profile`: A single variable to vary across its range.
* `pct`: The percentile (0-1) at which to fix continuous variables.
* `index`: The index of the level at which to fix categorical variables.
* `grid`: A list with `pctl` (logical) and `len` (integer) specifying how to create the grid for the `profile` variable. If `pctl = TRUE`, `len` percentiles are used. If `pctl = FALSE`, `len` evenly spaced points are used.
* `columns`: A character string of the selected variable names. This field is a placeholder and will be populated once `prep()` is used.
