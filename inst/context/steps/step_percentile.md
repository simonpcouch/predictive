## `step_percentile()`

Replaces a variable's numeric values with their percentile from the training set.

Arguments:
* `options`: A list of options for `stats::quantile()`, such as `probs`. Not tunable.
* `outside`: Specifies how to handle new data points that fall outside the training set's range (`"none"`, `"lower"`, `"upper"`, or `"both"`). Not tunable.

