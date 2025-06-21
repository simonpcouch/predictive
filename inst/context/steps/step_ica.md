## `step_ica()`

Extracts independent components from numeric data to isolate distinct, non-Gaussian signals. This is a computationally intensive step.

Arguments:
* `num_comp`: The number of components to retain as new predictors. This argument is tunable.
* `options`: A list of options to pass to `fastICA::fastICA()`.
* `seed`: An integer to set the random number stream for reproducibility.
* `prefix`: A character string for the prefix of the new component variable names.
* `keep_original_cols`: A logical indicating whether to keep the original variables in the output.
