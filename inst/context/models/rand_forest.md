## `rand_forest()`

Random Forest. A powerful and widely used ensemble model. Slower to fit than a single tree, but generally has high accuracy.

Arguments:
* `mtry`: # predictors to sample at each split. Tune.
* `trees`: # trees in the ensemble. Tune.
* `min_n`: Minimum node size for a split. Tune.

Engines:
* `ranger` (classification, regression)
    - Default engine. A fast C++ implementation.
    - No extension package needed.
* `randomForest` (classification, regression)
    - The original R implementation.
    - No extension package needed.
* `h2o` (classification, regression)
    - A powerful, scalable engine for large datasets.
    - Requires the `agua` package.
* `partykit` (classification, regression, censored regression)
    - Uses conditional inference trees, which can be less biased.
    - Requires `bonsai` for classification/regression or `censored` for censored regression.
* `aorsf` (classification, regression, censored regression)
    - Accelerated Oblique Random Forests, can find linear combinations of predictors.
    - Requires `bonsai` for classification/regression or `censored` for censored regression.

