## `bag_tree()`

Bagged decision trees are ensembles that improve stability by averaging many models. They are effective for a variety of problems and are relatively fast to fit, though slower than a single tree.

Arguments:
* `cost_complexity`: A penalty for model complexity. It is recommended to tune this parameter.
* `tree_depth`: The maximum depth of any tree in the ensemble. It is recommended to tune this parameter.
* `min_n`: The minimum number of data points in a node to be split further. It is recommended to tune this parameter.
* `class_cost`: A cost value for misclassifying the minority class. Useful for imbalanced datasets and should be tuned.

Engines:
* `rpart` (classification, regression, censored regression)
    - A good default engine that supports all model modes.
    - Requires the `baguette` package for classification and regression, and the `censored` package for censored regression.
* `C5.0` (classification)
    - Does not support the `cost_complexity` argument.
    - Often a faster and more memory-efficient option for classification.
    - Requires the `baguette` extension package.

