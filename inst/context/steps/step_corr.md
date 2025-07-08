## `step_corr()`

Removes variables that have high absolute correlations with other variables.

Arguments:
* `threshold`: Threshold for absolute correlation values. Step removes minimum columns to keep all correlations below this value. Tunable.
* `use`: Method for handling missing values in `stats::cor()`.
* `method`: Correlation method for `stats::cor()`.
* `removals`: Names of columns removed (determined during `prep()`).
