## `step_ratio()`

Calculates the ratio of numeric variables.

Arguments:
* `...`, One or more selector functions to choose which variables will be used in the numerator of the ratio. Not tunable.
* `denom`, A bare name or selector for the denominator variables. Not tunable.
* `naming`, A function that defines the naming convention for new ratio columns. Not tunable.
* `keep_original_cols`, A logical to keep the original variables in the output. Not tunable.
