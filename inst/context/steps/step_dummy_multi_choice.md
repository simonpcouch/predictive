## `step_dummy_multi_choice()`

Converts multiple character or factor columns into a set of binary indicator variables. All levels from all selected columns are treated as a single group for creating the new variables.

Arguments:
* `threshold`: A numeric value (0-1 for proportion, >=1 for frequency) to pool infrequent levels into an "other" category. Tunable.
* `other`: A character string for the name of the "other" category.
* `naming`: A function to define the naming convention for the new dummy columns.
* `prefix`: A character string to prefix the new variable names. Defaults to the name of the first variable selected.
* `sparse`: Whether to create sparse columns. Can be `"yes"`, `"no"`, or `"auto"`.
* `keep_original_cols`: Logical to retain the original columns in the output.
