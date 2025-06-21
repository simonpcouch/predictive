## `mars()`

Multivariate Adaptive Regression Splines (MARS) models create flexible, non-linear models by fitting piecewise linear functions (hinges). They are useful for capturing non-linearities and interactions while maintaining some interpretability. Fitting speed is generally fast.

Arguments:
* `num_terms`: The number of model terms (hinge functions). It is recommended to tune this parameter to control model complexity.
* `prod_degree`: The highest degree of interaction between variables. It is recommended to tune this parameter.
* `prune_method`: The method used to prune the model and prevent overfitting. It is recommended to tune this parameter.

Engines:
* `earth` (classification, regression)
    - The default and only engine. It is a robust and well-established implementation of MARS.
    - No parsnip extension package is required.

