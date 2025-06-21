## `step_kpca()`

Extracts kernel principal components from numeric variables. This is a computationally intensive step.

Arguments:
* `num_comp`, the number of components to retain. This is tunable.
* `options`, a list of options for `kernlab::kpca()`. The `kernel` and its parameters (`kpar`) are specified here. The choice of kernel and its parameters can significantly affect model performance and fit time. This is tunable.
* `prefix`, a character prefix for the new component variables.
* `keep_original_cols`, a logical to keep the original variables.
