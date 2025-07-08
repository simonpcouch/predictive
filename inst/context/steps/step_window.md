## `step_window()`

Creates new columns with rolling window statistics (mean, median, min, max, etc.).

Arguments:
* `size`: Odd integer ≥ 3 for window size. Tunable.
* `na_rm`: Logical. Remove NAs in each window?
* `statistic`: Character. Type of statistic to calculate ("max", "mean", "median", "min", "prod", "sd", "sum", "var"). Tunable.
* `columns`: Character. Selected variable names (populated by `prep()`).
* `names`: Optional character vector for naming new columns.
