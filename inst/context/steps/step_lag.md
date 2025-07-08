## `step_lag()`

Creates new columns of lagged data based on numeric or date values.

Arguments:
* `lag`: Vector of positive integers. Each column will be lagged by each value.
* `prefix`: Prefix for generated column names. Default: "lag_".
* `default`: Value to fill empty rows left by lagging. Default: NA.
* `columns`: Variables to lag. Automatically populated by `prep()`.
