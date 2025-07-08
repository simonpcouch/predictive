## `bag_tree()`

Bagged decision trees are ensembles of decision trees that improve prediction accuracy through averaging. Moderately fast to fit.

Arguments:
* `cost_complexity`: Positive number for CART cost/complexity parameter. tune.
* `tree_depth`: Integer for maximum depth of tree. tune.
* `min_n`: Integer for minimum data points in a node required for splitting. tune.
* `class_cost`: Non-negative scalar for class costs. tune.

Engines:
* `rpart` (classification, regression, censored regression)
  - Classification and regression require baguette extension.
  - Censored regression requires censored extension.
* `C5.0` (classification)
  - Requires baguette extension.
