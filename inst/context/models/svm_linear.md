## `svm_linear()`

Linear Support Vector Machines (SVMs) find a hyperplane that optimally separates classes (for classification) or fits the data with a margin of tolerance (for regression). They are highly effective for high-dimensional data and are very fast to fit.

Arguments:
* `cost`: The cost of misclassification (`C` parameter), controlling the trade-off between margin width and errors. It is recommended to tune this parameter.
* `margin`: The epsilon in the insensitive loss function (for regression only). It is recommended to tune this parameter.

Engines:
* `LiblineaR` (classification, regression)
    - The default engine. Highly optimized for linear SVMs and very fast, especially for large or wide datasets.
    - No parsnip extension package is required.
* `kernlab` (classification, regression)
    - A versatile SVM engine that provides a solid implementation for linear SVMs.
    - No parsnip extension package is required.

