## `step_corr()`

Removes numeric variables that have high absolute correlations with other variables.

Arguments:
* `threshold`: The absolute correlation threshold for removal. This argument is tunable.
* `use`: A character string for how to handle missing data in the correlation calculation (e.g., "pairwise.complete.obs").
* `method`: A character string for the correlation method (e.g., "pearson", "spearman").
