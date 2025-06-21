## `step_cut()`

Converts a numeric variable into a factor by cutting it at specified break points.

Arguments:
* `breaks`: A numeric vector of cut points.
* `include_outside_range`: A logical. If `TRUE`, values outside the specified `breaks` in new data are assigned to the first or last bin. If `FALSE`, they become `NA`.
