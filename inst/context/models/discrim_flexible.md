## `discrim_flexible()`

Flexible discriminant analysis uses MARS (Multivariate Adaptive Regression Splines) to create non-linear features, allowing for non-linear decision boundaries. The fitting speed is moderate, faster than many non-linear methods but slower than linear discriminant analysis.

Arguments:
* `num_terms`: The number of features to retain in the final model. It is recommended to tune this parameter.
* `prod_degree`: The highest degree of interaction between variables. It is recommended to tune this parameter.
* `prune_method`: The method used to prune the model. It is recommended to tune this parameter.

Engines:
* `earth` (classification)
    - A good choice when decision boundaries are suspected to be non-linear.
    - Requires the `discrim` extension package.

