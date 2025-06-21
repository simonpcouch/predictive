## `boost_tree()`

Boosted trees for high-performance modeling. Slower than bagging, but often more accurate.

Arguments:
* `mtry`: # predictors to sample at each split. Tune.
* `trees`: # trees in the ensemble. Tune.
* `min_n`: Minimum node size. Tune.
* `tree_depth`: Max tree depth. Tune.
* `learn_rate`: Learning rate or shrinkage. Tune.
* `loss_reduction`: Min loss reduction to split. Tune.
* `sample_size`: % of data to sample. Tune.
* `stop_iter`: # iterations for early stopping. Tune.

Engines:
* `xgboost` (classification, regression)
    - The default engine. Powerful and widely used.
    - No extension package needed.
* `C5.0` (classification)
    - Fast and memory-efficient.
    - Doesn't support `mtry`, `tree_depth`, `learn_rate`, `loss_reduction`, or `stop_iter`.
    - No extension package needed.
* `h2o` (classification, regression)
    - Highly scalable for large datasets.
    - Requires `agua` package.
* `lightgbm` (classification, regression)
    - Very fast, memory-efficient implementation.
    - Requires `bonsai` package.
* `mboost` (censored regression)
    - Specialized for censored regression outcomes.
    - Requires `censored` package.

