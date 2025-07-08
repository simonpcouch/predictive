## `svm_poly()`

Support vector machine with polynomial kernel. Effective for non-linear boundaries. Moderate fitting time that increases with dataset size.

Arguments:
* `cost`: Cost of predicting a sample within or on wrong side of margin. tune.
* `degree`: Polynomial degree. Higher values create more flexible boundaries. tune.
* `scale_factor`: Polynomial scaling factor. tune.
* `margin`: Epsilon in SVM insensitive loss function (regression only). tune.

Engines:
* `kernlab` (classification, regression)
  - Efficient implementation with good defaults
  - No extension package required
