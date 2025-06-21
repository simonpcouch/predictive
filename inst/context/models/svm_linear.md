## `svm_linear()`

Support Vector Machine with a linear kernel. A powerful model for high-dimensional data, with moderate fitting speed.

Arguments:
* `cost`: The cost of misclassification (C). Tune.
* `margin`: The epsilon-insensitive loss tube width (regression only). Tune.

Engines:
* `LiblineaR` (classification, regression)
    - Default engine. Very fast, especially for large, sparse datasets.
    - No extension package needed.
* `kernlab` (classification, regression)
    - A solid, general-purpose SVM implementation.
    - Doesn't support the `margin` argument directly through parsnip.
    - No extension package needed.

