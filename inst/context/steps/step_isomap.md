## `step_isomap()`

Reduces the number of variables by computing a non-linear Isomap embedding. This can be computationally intensive.

Arguments:
* `num_terms`: The number of Isomap components to retain. Tunable.
* `neighbors`: The number of neighbors used to create the embedding. The fit time is affected by this value. Tunable.
* `options`: A list of options passed to `dimRed::Isomap()`.
* `prefix`: A prefix for the new component variable names.
* `keep_original_cols`: A logical indicating whether to keep the original variables.
