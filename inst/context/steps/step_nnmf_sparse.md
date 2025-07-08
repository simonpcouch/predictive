## `step_nnmf_sparse()`

Converts numeric data into non-negative components using non-negative matrix factorization with lasso penalization.

Arguments:
* `num_comp`: Number of components to retain (integer). Tunable. If greater than the number of columns or possible components, a smaller value is used. If 0, no transformation occurs.
* `penalty`: Non-negative regularization factor for loadings (usually between 0 and 1). Tunable.
* `options`: List of options passed to `nmf()` in the RcppML package. Note that `A`, `k`, `L1`, and `seed` should not be passed here.
* `prefix`: Character string prefix for the resulting new variables. Default is "NNMF".
* `seed`: Integer used to set the seed when computing the factorization.
