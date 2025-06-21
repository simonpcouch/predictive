## `step_discretize()`

Converts numeric variables into a factor with bins of approximately equal size.

Arguments:
* num_breaks: The number of cuts to make for the bins. Tunable.
* min_unique: The minimum number of unique values required to discretize a variable. Tunable.
* options: A list of options for the underlying `discretize()` function (e.g., `list(prefix = "bin")`).

