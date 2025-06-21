## `rand_forest()`

Random forests are powerful ensemble models that build many independent decision trees and average their predictions. They are highly accurate, handle non-linear relationships well, and are resistant to overfitting. Fitting speed is moderate, slower than single trees but often faster than boosting.

Arguments:
* `mtry`: The number of predictors randomly sampled at each split. It is a key parameter to tune for performance.
* `trees`: The number of trees in the forest. Generally, more is better, but this increases computation time.
* `min_n`: The minimum number of data points in a node to be split further. It is a key parameter to tune to control tree complexity.

Engines:
* `ranger` (classification, regression): The default engine. A very fast and memory-efficient implementation, making it a great general-purpose choice. No parsnip extension package is required.
* `randomForest` (classification, regression): The original R implementation. Solid, but generally slower than `ranger`. No parsnip extension package is required.
* `aorsf` (classification, censored regression): An engine optimized for speed, particularly for survival analysis. Requires the `bonsai` package for classification and `censored` for censored regression.
* `partykit` (classification, censored regression): Implements conditional inference forests, which can reduce variable selection bias. Can be slower than other engines. Requires the `bonsai` package for classification and `censored` for censored regression.
* `h2o` (classification, regression): A scalable engine designed for very large datasets. Requires the `agua` extension package.

