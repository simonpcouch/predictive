## `step_window()`

Applies a function to a moving window of numeric data.

Arguments:
* `size`: An odd integer (>= 3) for the window size. Tunable.
* `na_rm`: A logical indicating whether to remove `NA` values within each window.
* `statistic`: The statistic to compute. Can be 'max', 'mean', 'median', 'min', 'prod', 'sd', 'sum', or 'var'. Tunable.
* `names`: Optional character vector of names for the new columns.
* `keep_original_cols`: A logical to keep the original variables.
