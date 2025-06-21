## `step_pca()`

Converts numeric variables into one or more principal components. This can be a computationally intensive step.

Arguments:
* `num_comp`: The number of principal components to retain. Tunable.
* `threshold`: The fraction of total variance to be covered by the components. Overrides `num_comp`. Tunable.
* `options`: A list of options for `stats::prcomp()`.
* `prefix`: A character string for the prefix of the new component variables.
* `keep_original_cols`: A logical indicating whether to keep the original variables.

