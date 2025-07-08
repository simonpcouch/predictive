## `step_kpca_poly()`

Converts numeric data into principal components using a polynomial kernel basis expansion.

Arguments:
* `num_comp`: Number of components to retain. If greater than possible components, a smaller value is used. If 0, no transformation occurs. Tunable.
* `degree`: Polynomial degree for kernel function. Default is 2. Tunable.
* `scale_factor`: Scale factor for polynomial kernel function. Default is 1. Tunable.
* `offset`: Offset for polynomial kernel function. Default is 1. Tunable.
* `prefix`: Prefix for new variable names. Default is "kPC".
* `columns`: Character vector of selected variables (populated by `prep()`).
* `res`: Stores the `kernlab::kpca()` object after training.
