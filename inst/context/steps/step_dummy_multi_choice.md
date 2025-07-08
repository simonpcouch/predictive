## `step_dummy_multi_choice()`

Creates binary indicator variables from multiple categorical predictors, handling levels across all predictors together.

Arguments:
* `threshold`: Numeric. When < 1: pools levels with occurrence rate below threshold to "other". When ≥ 1: pools levels occurring fewer than threshold times.
* `other`: Character. Value for the pooled category. Default: "other".
* `naming`: Function. Defines naming convention for new dummy columns.
* `prefix`: Character. Prefix for new variable names. Default: first selected column name.
* `sparse`: Character ("yes", "no", "auto"). Should dummy columns be sparse vectors?
