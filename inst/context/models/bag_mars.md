## `bag_mars()`

Bagged multivariate adaptive regression splines (MARS) models create ensembles of segmented regression models. Effective for capturing non-linear relationships and moderately fast to fit.

Arguments:
* `num_terms`: Number of features retained in final model, including intercept. tune.
* `prod_degree`: Highest possible interaction degree. tune.
* `prune_method`: Method used for pruning.

Engines:
* `earth` (classification, regression)
  - Requires baguette extension.
