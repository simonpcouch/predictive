## `cubist_rules()`

Rule-based regression model that creates linear regression models within rules derived from a tree ensemble. Fast to fit and effective for numerical prediction.

Arguments:
* `committees`: Number of ensemble members (max 100). tune.
* `neighbors`: Number of neighbors (0-9) used to adjust predictions. tune.
* `max_rules`: Maximum number of rules to create. tune.

Engines:
* `Cubist` (regression)
  - Requires rules extension.
