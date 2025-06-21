## `decision_tree()`

A single decision tree. Fast to fit and very interpretable, but often less accurate than ensembles.

Arguments:
* `cost_complexity`: Cost-complexity pruning parameter. Tune.
* `tree_depth`: Maximum tree depth. Tune.
* `min_n`: Minimum node size for a split. Tune.

Engines:
* `rpart` (classification, regression, censored regression)
    - Default engine. A good, general-purpose choice.
    - No extension package needed for classification/regression.
    - Requires `censored` package for censored regression.
* `C5.0` (classification)
    - Fast and often more accurate for classification.
    - Doesn't support `cost_complexity`.
    - No extension package needed.
* `partykit` (classification, regression, censored regression)
    - Uses statistical tests for splitting (conditional inference).
    - Requires `bonsai` for classification, `censored` for censored regression.

