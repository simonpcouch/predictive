## `step_nzv()`

Removes variables with near-zero variance (highly sparse and unbalanced).

Arguments:
* `...`: Selectors for variables to potentially remove
* `freq_cut`: Numeric. Threshold for ratio of most common to second most common value. Default: 95/5
* `unique_cut`: Numeric. Maximum percent of unique values allowed. Default: 10
* `options`: List. Alternative way to pass filtering parameters
* `removals`: Character. Column names that should be removed (determined by `prep()`)
