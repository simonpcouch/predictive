## `bart()`

Bayesian Additive Regression Trees (BART) is a Bayesian ensemble of decision trees. Moderately fast to fit with strong predictive performance, especially for complex non-linear patterns.

Arguments:
* `trees`: # of trees in the ensemble. tune.
* `prior_terminal_node_coef`: Coefficient for terminal node prior probability (0-1, default 0.95). Controls baseline probability; smaller values make terminal nodes more likely.
* `prior_terminal_node_expo`: Exponent for terminal node prior (≥0, default 2). Controls depth penalty; larger values discourage deep trees.
* `prior_outcome_range`: Width of outcome prior. For regression, related to observed data range; for classification, defined on logit scale.

Engines:
* `dbarts` (classification, regression)
  - Implements full Bayesian posterior inference via MCMC.
  - No additional packages needed beyond what parsnip loads.
