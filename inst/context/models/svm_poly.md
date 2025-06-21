## `svm_poly()`

Support Vector Machine with a polynomial kernel for non-linear relationships. Can be slow to fit, especially with higher-degree polynomials.

Arguments:
* `cost`: Cost of misclassification (C). Tune.
* `degree`: Polynomial degree. Tune.
* `scale_factor`: Kernel scaling factor. Tune.
* `margin`: Epsilon-insensitive tube width (regression only). Tune.

Engines:
* `kernlab` (classification, regression)
    - The standard engine for kernel-based SVMs in R.
    - No extension package needed.

