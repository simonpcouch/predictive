## `step_nnmf_sparse()`

Performs a non-negative matrix factorization of numeric predictors with a lasso penalty to create new components. This step can be computationally intensive.

Arguments:
* `num_comp`: The number of components to retain. Tunable.
* `penalty`: A non-negative penalization factor for the loadings. Tunable.
* `options`: A list of options to pass to `RcppML::nmf()`.
* `prefix`: A character string for the prefix of the new component variables.
* `seed`: An integer to seed the factorization computation for reproducibility.
* `keep_original_cols`: A logical indicating whether to keep the original variables.
