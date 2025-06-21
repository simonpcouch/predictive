## `step_kpca_poly()`

Computes a polynomial kernel principal component analysis. This is computationally intensive.

Arguments:
* `num_comp`: The number of components to retain. (tunable)
* `degree`: The polynomial degree. (tunable)
* `scale_factor`: The scaling factor for the polynomial kernel. (tunable)
* `offset`: The offset for the polynomial kernel. (tunable)
* `prefix`: A prefix for the new component variable names.
* `keep_original_cols`: Whether to keep the original variables.
