## `svm_rbf()`

Radial basis function support vector machines. Effective for nonlinear relationships with moderate training times. Can handle high-dimensional data well but performance degrades with very large datasets.

Arguments:
* `cost`: Controls the trade-off between model complexity and training error. tune.
* `rbf_sigma`: Controls the influence radius of training examples (kernel width). tune.
* `margin`: Epsilon in SVM insensitive loss function (regression only). tune.

Engines:
* `kernlab` (classification, regression)
  - Fast for small to medium datasets, handles class imbalance well.
* `liquidSVM` (classification, regression)
  - Optimized for large datasets, includes automatic parameter selection.
