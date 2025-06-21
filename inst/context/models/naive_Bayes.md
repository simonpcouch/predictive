## `naive_Bayes()`

Naive Bayes for classification. Very fast, works well with categorical predictors, and is a good baseline.

Arguments:
* `smoothness`: Boundary smoothness. Tune.
* `Laplace`: Laplace correction for low-frequency counts. Tune.

Engines:
* `klaR` (classification)
    - Default engine.
    - Requires `discrim` package.
* `naivebayes` (classification)
    - Another good general-purpose engine.
    - Requires `discrim` package.
* `h2o` (classification)
    - Scalable for large datasets.
    - Doesn't support `smoothness` or `Laplace`.
    - Requires `agua` package.

