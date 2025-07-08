## `step_impute_roll()`

Imputes missing values in numeric variables using a rolling window statistic.

Arguments:
* `columns`: Character vector of column names to impute
* `statistic`: Function to compute imputation value (e.g., median, mean). Tunable.
* `window`: Size of the window around a point to be imputed. Should be odd integer >1. Tunable.

Notes:
* On tails, window shifts toward ends
* When window contains all NA, returns NA
* Imputation is based on original values only; previous imputations aren't used
* Case weights not supported
