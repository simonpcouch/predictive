## `rand_forest()`

Random forest models create many decision trees and combine their predictions. Moderate fitting time that increases with more trees.

Arguments:
* `mtry`: Number of predictors randomly sampled at each split. tune.
* `trees`: Number of trees in the ensemble. More trees = better performance but slower fit.
* `min_n`: Minimum data points required in a node for further splitting. tune.

Engines:
* `ranger` (classification, regression, censored regression)
  - Fast implementation, good for large datasets.
* `randomForest` (classification, regression)
  - Original R implementation, good for moderate datasets.
* `spark` (classification, regression)
  - Distributed implementation for very large datasets.
* `aorsf` (classification, censored regression)
  - Requires bonsai extension for classification.
  - Requires censored extension for censored regression.
  - Optimized for survival data.
* `h2o` (classification, regression)
  - Requires agua extension.
  - Scales well to large datasets.
* `partykit` (classification, censored regression)
  - Requires bonsai extension for classification.
  - Requires censored extension for censored regression.
  - Provides conditional inference trees with statistical stopping criteria.
