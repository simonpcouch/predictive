## `step_impute_knn()`

Imputes missing values using a k-nearest neighbor model. This can be computationally intensive.

Arguments:
* `neighbors`: The number of nearest neighbors to use for imputation. (tunable)
* `impute_with`: The columns used to predict the imputed values.
* `options`: A list of options for the underlying Gower distance calculation, such as the number of threads to use (`nthread`).
