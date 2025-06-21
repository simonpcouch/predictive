## `step_num2factor()`

Converts numeric variables to factors. This is useful when categories are encoded as integers.

Arguments:
* `transform`: A function to modify the numeric values before they are converted to factor levels. The output of the function should be an integer that corresponds to an index in `levels`.
* `levels`: A character vector of factor levels.
* `ordered`: A logical indicating if the resulting factor should be ordered.
