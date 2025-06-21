## `bag_tree()`

An ensemble of decision trees (bagging). Slower than a single tree, but more stable and accurate.

Arguments:
* `cost_complexity`: Cost-complexity parameter (`rpart` only). Tune.
* `tree_depth`: Maximum tree depth (`rpart` only). Tune.
* `min_n`: Minimum node size for a split. Tune.
* `class_cost`: Cost of misclassifying minority class (`C5.0` only). Tune.

Engines:
* `rpart` (classification, regression, censored regression)
    - General purpose, but can be less accurate than `C5.0`.
    - Requires `baguette` for classification/regression, `censored` for censored regression.
* `C5.0` (classification)
    - Often more accurate for classification.
    - Doesn't support `cost_complexity` or `tree_depth`.
    - Requires `baguette`.

