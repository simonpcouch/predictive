## `discrim_flexible()`

Flexible discriminant analysis model using MARS (Multivariate Adaptive Regression Splines) for creating nonlinear features. Moderately fast fitting with good performance on nonlinear classification problems.

Arguments:
* `num_terms`: Number of features retained in final model (including intercept). tune.
* `prod_degree`: Highest possible interaction degree. tune.
* `prune_method`: Method used for pruning the model.

Engines:
* `earth` (classification)
  - Requires discrim extension.
