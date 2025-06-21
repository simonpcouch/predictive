## `step_dummy()`

Converts nominal variables (factors) into one or more numeric binary variables.

Arguments:
* `one_hot`: A logical. If `TRUE`, creates C dummy variables for C factor levels, rather than the default C-1. Tunable.
* `contrasts`: A named list of contrast functions to use for unordered and ordered factors. Tunable.
* `naming`: A function that specifies the naming convention for the new columns.
* `sparse`: A string ('yes', 'no', or 'auto') indicating whether to create sparse columns. The 'auto' option lets a workflow decide. Tunable.
* `keep_original_cols`: A logical. If `TRUE`, the original columns are retained after the transformation.

