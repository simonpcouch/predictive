## `boost_tree()`

Boosted trees are powerful ensembles that build trees sequentially, where each new tree improves upon the last. They are highly performant but can be computationally expensive and require careful tuning to prevent overfitting.

Arguments:
* `mtry`: The number of predictors randomly sampled at each split. It is recommended to tune this.
* `trees`: The number of trees in the ensemble. It is recommended to tune this.
* `min_n`: The minimum number of data points required to split a node. It is recommended to tune this.
* `tree_depth`: The maximum depth of a tree. It is recommended to tune this.
* `learn_rate`: The rate at which the algorithm adapts. It is recommended to tune this.
* `loss_reduction`: The required reduction in loss to make a split. It is recommended to tune this.
* `sample_size`: The proportion of data used for training each tree. It is recommended to tune this.
* `stop_iter`: Number of iterations with no improvement before stopping. Useful for preventing overfitting.

Engines:
* `xgboost` (classification, regression): The default engine. A powerful and popular choice known for high performance. No parsnip extension package is required.
* `C5.0` (classification): A very fast algorithm for classification. Does not support many arguments, including `mtry`, `tree_depth`, `learn_rate`, `loss_reduction`, or `stop_iter`. No parsnip extension package is required.
* `h2o` (classification, regression): A fast, scalable engine for large datasets. Requires the `agua` extension package.
* `lightgbm` (classification, regression): A very fast and memory-efficient engine, great for large datasets. Requires the `bonsai` extension package.
* `mboost` (censored regression): A flexible, model-based boosting framework. Requires the `censored` package.

