## `step_kpca()`

Converts numeric data into principal components using a kernel basis expansion.

Arguments:
* `num_comp`: Number of components to retain (default: 5). If greater than available columns, a smaller value is used. If 0, no transformation occurs.
* `options`: List of options to `kernlab::kpca()`. Defaults: `kernel = "rbfdot"`, `kpar = list(sigma = 0.2)`.
* `prefix`: Character string for the prefix of new variables (default: "kPC").
* `res`: Storage location for trained kernlab::kpca() object (populated by prep()).
* `columns`: Character vector of selected variables (populated by prep()).
