## `mars()`

Multivariate Adaptive Regression Splines (MARS). Models non-linearities and interactions; faster than many non-linear methods.

Arguments:
* `num_terms`: # features in the final model. Tune.
* `prod_degree`: Max interaction degree. Tune.
* `prune_method`: Pruning method. Tune.

Engines:
* `earth` (classification, regression)
    - The only engine, useful for a wide range of problems.
    - No extension package needed.

