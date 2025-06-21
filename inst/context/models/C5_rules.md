## `C5_rules()`

C5.0 rule-based models generate a set of "if-then" rules from a decision tree, creating a highly interpretable model. They are extremely fast to fit, even when boosted.

Arguments:
* `trees`: The number of boosting iterations. It is recommended to tune this parameter.
* `min_n`: The minimum number of data points in a node to be split further. It is recommended to tune this parameter.

Engines:
* `C5.0` (classification)
    - A fast and memory-efficient engine that produces an interpretable, rule-based model.
    - Requires the `rules` extension package.

