## `step_depth()`

Calculates the data depth of numeric predictors relative to a categorical class variable. A new column is created for each class.

Arguments:
* `class`: A single categorical variable to use as the class.
* `metric`: The method for calculating depth (e.g., `"halfspace"`, `"Mahalanobis"`).
* `options`: A list of options for the underlying depth functions.
* `prefix`: A prefix for the names of the new columns.
* `keep_original_cols`: Whether to retain the original predictors.
