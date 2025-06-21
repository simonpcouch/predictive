## `bart()`

Bayesian Additive Regression Trees (BART). A slow-fitting but powerful tree ensemble model using Bayesian methods for non-linear relationships.

Arguments:
* `trees`: Number of trees in the ensemble. Tune.
* `prior_terminal_node_coef`: Terminal node prior coefficient. Tune.
* `prior_terminal_node_expo`: Terminal node prior exponent. Tune.
* `prior_outcome_range`: Outcome prior range. Tune.

Engines:
* `dbarts` (classification, regression)
    - Good for complex data, provides uncertainty estimates.
    - No extension package needed.

