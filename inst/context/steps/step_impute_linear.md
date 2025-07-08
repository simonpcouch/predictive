## `step_impute_linear()`

Imputes missing data in numeric variables using linear regression models.

Arguments:
* `...`: Numeric variables to be imputed
* `impute_with`: Variables used as predictors in the imputation models
* `models`: Storage for fitted linear models (populated by `prep()`)
