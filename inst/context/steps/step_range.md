## `step_range()`

Scales numeric data to a specific range (e.g., [0, 1]).

Arguments:
* `min`, `max`: The minimum and maximum value of the scaled data.
* `clipping`: A logical. If `TRUE` (the default), new data is truncated to stay within the `min` and `max` range.
* `ranges`: A character vector of variables that will be normalized.
