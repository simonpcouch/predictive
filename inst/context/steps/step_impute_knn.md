## `step_impute_knn()`

Imputes missing data using k-nearest neighbors based on Gower's distance (works with both numeric and nominal data).

Arguments:
* `neighbors`: Number of nearest neighbors to use for imputation. Tunable.
* `impute_with`: Variables used to impute. Default: `all_predictors()`.
* `options`: List of options to pass to `gower::gower_topn()`. Available options: `nthread` and `eps`.
* `ref_data`: Tibble of preprocessed data. Populated during training.
* `columns`: Character vector of selected variables. Populated during training.
