## `mars()`

Multivariate adaptive regression splines (MARS) creates segmented regression models with automatic feature selection. Moderately fast to fit.

Arguments:
* `num_terms`: # of features to retain in final model (including intercept). tune.
* `prod_degree`: Highest possible interaction degree. tune.
* `prune_method`: The pruning method.

Engines:
* `earth` (classification, regression)
  - Creates segmented models by generating hinge functions for predictors.
  - No additional packages required.
