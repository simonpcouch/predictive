## `bag_mars()`

Bagged MARS for non-linear models. Slower fit than a single model, but more robust.

Arguments:
* `num_terms`: Number of features retained. Tune.
* `prod_degree`: Highest interaction degree. Tune.
* `prune_method`: Pruning method. Tune.

Engines:
* `earth` (classification, regression)
    - Useful for data with non-linear relationships.
    - Requires the `baguette` package.

