## `svm_rbf()`

The Support Vector Machine with a Radial Basis Function (RBF) kernel is a powerful and popular model for creating highly complex, non-linear decision boundaries. It is one of the most flexible "off-the-shelf" classifiers, but it can be computationally intensive and slow to fit on large datasets.

Arguments:
* `cost`: The cost of misclassification (`C` parameter), which controls model complexity. It is essential to tune this parameter.
* `rbf_sigma`: The `sigma` (or `gamma`) parameter in the RBF kernel, controlling the flexibility of the boundary. It is essential to tune this parameter.
* `margin`: The epsilon in the insensitive loss function (for regression only). It is recommended to tune this parameter.

Engines:
* `kernlab` (classification, regression)
    - The default engine. A standard, robust implementation for kernel-based SVMs.
    - No parsnip extension package is required.
* `liquidSVM` (classification, regression)
    - An engine designed for speed and scalability, particularly effective for large datasets.
    - No parsnip extension package is required.

