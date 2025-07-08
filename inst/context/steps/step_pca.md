## `step_pca()`

Converts numeric variables into principal components. Computationally intensive for large datasets.

Arguments:
* `num_comp`: Number of components to retain. If greater than possible components, a smaller value is used. If 0, no transformation occurs. Tunable.
* `threshold`: Fraction of total variance to be covered by components. Overrides `num_comp`. Tunable.
* `options`: List of options for `stats::prcomp()`. Defaults: `retx = FALSE`, `center = FALSE`, `scale. = FALSE`, `tol = NULL`.
* `prefix`: Character string for prefix of new variables (default: "PC").
