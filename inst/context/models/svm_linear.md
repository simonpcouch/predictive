## `svm_linear()`

Linear support vector machines for classification and regression. Reasonably fast to fit, with efficient implementations for linear boundaries.

Arguments:
* `cost`: Cost of predicting a sample within or on wrong side of margin. tune.
* `margin`: Epsilon in SVM insensitive loss function (regression only). tune.

Engines:
* `LiblineaR` (classification, regression)
  - Default engine.
  - Efficient implementation optimized for linear SVMs.
* `kernlab` (classification, regression)
  - More flexible implementation with broader SVM functionality.
