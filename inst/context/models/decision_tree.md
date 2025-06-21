## `decision_tree()`

Decision trees create a model of `if/then` rules, resulting in a tree-like structure that is highly interpretable. They are very fast to fit and are often used as a baseline model or for their explanatory power.

Arguments:
* `cost_complexity`: A penalty for adding splits to the tree. It is recommended to tune this parameter.
* `tree_depth`: The maximum depth of the tree. It is recommended to tune this parameter.
* `min_n`: The minimum number of data points in a node required for it to be split further. It is recommended to tune this parameter.

Engines:
* `rpart` (classification, censored regression)
    - The default engine. A good, solid choice for CART-style trees.
    - For censored regression, the `censored` package is required. No extension package is needed for classification.
* `C5.0` (classification)
    - Does not support the `cost_complexity` argument.
    - A very fast and memory-efficient engine, often a good choice for classification.
    - No parsnip extension package is required.
* `partykit` (classification, censored regression)
    - Implements conditional inference trees, which use statistical tests for splitting.
    - Requires the `bonsai` package for classification and the `censored` package for censored regression.

