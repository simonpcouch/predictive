## `boost_tree()`

Boosted tree models create sequential decision trees where each tree corrects errors from previous trees. Fast to moderate fitting speed, highly accurate for many problems, and can handle complex nonlinear relationships.

Arguments:
* `mtry`: # or proportion of predictors randomly sampled at each split. tune.
* `trees`: # of trees in the ensemble. tune.
* `min_n`: Minimum # of data points required in a node for further splitting. tune.
* `tree_depth`: Maximum depth of trees. tune.
* `learn_rate`: Rate of adaptation between iterations (shrinkage parameter). tune.
* `loss_reduction`: Reduction in loss function required to split further. tune.
* `sample_size`: # or proportion of data exposed to fitting routine. tune.
* `stop_iter`: # of iterations without improvement before stopping. tune.

Engines:
* `xgboost` (classification, regression) 
  - Fast, highly efficient implementation.
* `C5.0` (classification)
  - Specialized for classification problems.
* `h2o` (classification, regression)
  - Distributed computation for large datasets.
  - Requires agua extension.
* `lightgbm` (classification, regression)
  - Faster than xgboost for large datasets.
  - Requires bonsai extension.
* `mboost` (censored regression, classification, regression)
  - Specialized for statistical boosting.
  - Requires censored extension for censored regression.
* `spark` (classification, regression)
  - Distributed computing for massive datasets.
