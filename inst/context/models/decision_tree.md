## `decision_tree()`

Decision trees create a model based on if/then statements that form a tree-like structure. Fast to fit and highly interpretable.

Arguments:
* `cost_complexity`: Positive number for pruning control. tune.
* `tree_depth`: Maximum depth of the tree. tune.
* `min_n`: Minimum number of data points required for a node to split. tune.

Engines:
* `rpart` (classification, censored regression)
  - Fast and interpretable.
  - Default engine.
  - Requires censored extension for censored regression.
* `C5.0` (classification)
  - Specialized for classification problems.
  - Often produces more accurate trees than rpart.
* `partykit` (classification, censored regression)
  - Statistical approach to tree construction.
  - Requires bonsai extension for classification.
  - Requires censored extension for censored regression.
* `spark` (mode not specified in context)
  - Distributed computing for large datasets.
