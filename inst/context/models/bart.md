## `bart()`

Bayesian Additive Regression Trees (BART) are powerful for capturing non-linear relationships and interactions. They are computationally intensive, making them one of the slower modeling methods.

Arguments:
* `trees`: The number of trees in the ensemble. It is recommended to tune this parameter.
* `prior_terminal_node_coef`: A coefficient for the prior probability of a terminal node, affecting the baseline probability. It is recommended to tune this parameter.
* `prior_terminal_node_expo`: An exponent in the prior probability of a terminal node, affecting how probability decreases with depth. It is recommended to tune this parameter.
* `prior_outcome_range`: The width of the prior for the predicted outcome. It is recommended to tune this parameter.

Engines:
* `dbarts` (classification, regression)
    - The default engine for BART models. It is a robust and well-established implementation.
    - No parsnip extension package is required.

