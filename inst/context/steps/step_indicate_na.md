## `step_indicate_na()`

Creates binary columns that indicate which observations are missing in the specified variables.

Arguments:
* `...`: Selectors for variables for which to create missing value indicators
* `columns`: Character vector of selected variable names (populated by `prep()`)
* `prefix`: Character string prefix for new column names (default: "na_ind")
* `sparse`: Whether columns should be sparse vectors ("yes", "no", or "auto", default: "auto")
