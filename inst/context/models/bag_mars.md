## `bag_mars()`

Bagged MARS (Multivariate Adaptive Regression Splines) models are ensembles that can effectively model non-linear relationships and interactions between variables. Fitting speed is moderate, slower than a single MARS model but generally faster than random forests.

Arguments:
* `num_terms`: The number of terms to retain in the final model. It is recommended to tune this parameter.
* `prod_degree`: The highest degree of interaction between variables. It is recommended to tune this parameter.
* `prune_method`: The method used to prune the model. It is recommended to tune this parameter.

Engines:
* `earth` (classification, regression)
    - A good default choice for bagged MARS models.
    - Requires the `baguette` extension package.

