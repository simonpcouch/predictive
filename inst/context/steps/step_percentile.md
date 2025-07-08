## `step_percentile()`

Transforms variable values to their percentiles from the training set.

Arguments:
* `...`: Variables to transform
* `ref_dist`: The computed percentiles stored after training
* `options`: List of options passed to `stats::quantile()`, default: `list(probs = (0:100)/100)`
* `outside`: How to handle values outside `[min(x), max(x)]`. Options: `"none"` (NA), `"lower"` (0), `"upper"` (1), or `"both"`. Default: `"none"`
