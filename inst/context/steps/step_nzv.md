## `step_nzv()`

Removes predictors with near-zero variance. These predictors have very few unique values and a large ratio of the most common value to the second most common value.

Arguments:
* `freq_cut`: The ratio of the frequency of the most common value to the second most common value, used to flag predictors for removal. Tunable.
* `unique_cut`: The percentage of unique values out of the total number of samples, used to flag predictors for removal. Tunable.
