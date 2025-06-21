## `svm_rbf()`

Support Vector Machine with a Radial Basis Function (RBF) kernel. A powerful and flexible model for complex non-linear problems. Can be slow to fit, especially on large datasets.

Arguments:
* `cost`: Cost of misclassification (C). Tune.
* `rbf_sigma`: RBF kernel parameter (sigma). Tune.
* `margin`: Epsilon-insensitive tube width (regression only). Tune.

Engines:
* `kernlab` (classification, regression)
    - Default engine. A robust, standard choice.
    - No extension package needed.
* `liquidSVM` (classification, regression)
    - Designed for very large datasets, often faster than `kernlab`.
    - No extension package needed.

