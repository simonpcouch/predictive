## `cubist_rules()`

Cubist is a rule-based regression model that creates "if-then" rules and fits a linear regression model within each rule. It is highly interpretable and generally very fast to fit.

Arguments:
* `committees`: The number of boosting iterations (or committees). It is recommended to tune this parameter.
* `neighbors`: The number of nearest neighbors to use for prediction adjustment. It is recommended to tune this parameter.
* `max_rules`: The maximum number of rules to create. It is recommended to tune this parameter.

Engines:
* `Cubist` (regression)
    - A fast and powerful engine that creates an interpretable, rule-based model with internal linear models.
    - Requires the `rules` extension package.

