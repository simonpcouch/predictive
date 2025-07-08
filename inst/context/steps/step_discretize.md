## `step_discretize()`

Converts numeric data into factors with bins containing approximately equal numbers of data points.

Arguments:
* `...`: Variables to discretize
* `num_breaks`: Integer. Number of cut points. Tunable.
* `min_unique`: Integer. Minimum threshold of (unique values)/(cuts+1) required to perform binning. Tunable.
* `options`: List of options passed to `discretize()`. Default: `list(prefix = "bin")`

Note: Missing values become a separate level named `prefix_missing`.
