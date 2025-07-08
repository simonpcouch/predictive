## `step_impute_bag()`

Creates bagged tree models to impute missing data. Works with both numeric and categorical variables.

Arguments:
* `...`: Variables to be imputed
* `impute_with`: Variables used to predict missing data. Default: all predictors
* `trees`: Number of bagged trees for each model. Tunable
* `options`: List of options to `ipred::ipredbagg()`. Default sets `keepX = FALSE`
* `seed_val`: Integer for reproducible models. Same seed used for all imputation models
