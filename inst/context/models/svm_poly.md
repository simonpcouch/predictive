## `svm_poly()`

Polynomial Support Vector Machines (SVMs) create complex, non-linear decision boundaries using a polynomial kernel. They are powerful for problems where the relationship between features and the outcome is non-linear, but they can be slow to fit, especially with a high polynomial degree.

Arguments:
* `cost`: The cost of misclassification (`C` parameter), controlling model complexity. It is essential to tune this parameter.
* `degree`: The degree of the polynomial kernel. It is a key parameter to tune for controlling flexibility.
* `scale_factor`: The scaling factor (`gamma`) in the polynomial kernel. It is recommended to tune this parameter.
* `margin`: The epsilon in the insensitive loss function (for regression only). It is recommended to tune this parameter.

Engines:
* `kernlab` (classification, regression)
    - The default and only engine. A versatile and standard implementation for kernel-based SVMs.
    - No parsnip extension package is required.

