## `rule_fit()`

RuleFit models derive simple feature rules from tree ensembles and use them as features in a regularized model. Moderately fast to fit, with better interpretability than pure tree ensembles.

Arguments:
* `mtry`: Number/proportion of predictors randomly sampled at each split. tune.
* `trees`: Number of trees in the ensemble. tune.
* `min_n`: Minimum number of data points required for a node to split further. tune.
* `tree_depth`: Maximum depth of trees. tune.
* `learn_rate`: Rate at which boosting algorithm adapts between iterations. tune.
* `loss_reduction`: Reduction in loss function required to split further. tune.
* `sample_size`: Number/proportion of data exposed to fitting routine. tune.
* `stop_iter`: Number of iterations without improvement before stopping. tune.
* `penalty`: L1 regularization parameter. tune.

Engines:
* `xrf` (classification, regression)
  - Default engine
  - Requires rules extension
* `h2o` (classification, regression)
  - Requires agua extension
