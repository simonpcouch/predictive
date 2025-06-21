## `rule_fit()`

RuleFit creates a model by first generating a large set of "if-then" rules from a tree-based ensemble and then fitting a regularized linear model (lasso) on these rules. This produces a model that is both highly accurate and interpretable, but the two-stage process makes it slow to fit.

Arguments:
* `trees`: The number of trees in the initial ensemble. It is recommended to tune this parameter.
* `mtry`: The number of predictors randomly sampled at each split. It is recommended to tune this parameter.
* `tree_depth`: The maximum depth of the trees in the ensemble. It is recommended to tune this parameter.
* `learn_rate`: The learning rate for the boosting algorithm used to generate rules. It is recommended to tune this parameter.
* `penalty`: The L1 regularization penalty used to select the final set of rules. It is essential to tune this parameter.

Engines:
* `xrf` (classification, regression)
    - The default engine, providing an implementation of the original RuleFit algorithm.
    - Requires the `rules` extension package.
* `h2o` (classification, regression)
    - A scalable engine for large datasets.
    - Requires the `agua` extension package.

