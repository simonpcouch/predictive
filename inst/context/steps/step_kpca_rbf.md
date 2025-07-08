## `step_kpca_rbf()`

Performs radial basis function kernel PCA to extract nonlinear components from numeric data.

Arguments:
* `num_comp`: Number of components to retain (integer, default: 5). Tunable.
* `sigma`: Parameter for the radial basis function (numeric, default: 0.2). Tunable.
* `prefix`: Character string for the prefix of the resulting new variables (default: "kPC").
* `columns`: Character vector of variable names selected for the transformation.
* `res`: Storage for the kernel PCA results after training (populated by `prep()`).
