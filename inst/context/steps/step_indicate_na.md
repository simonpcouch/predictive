## `step_indicate_na()`

Creates new binary columns to indicate where `NA` values exist.

Arguments:
* `prefix`: A character prefix for the new indicator columns.
* `sparse`: Whether to create sparse indicator columns (`"yes"`, `"no"`, or `"auto"`).
* `keep_original_cols`: `TRUE` to keep the original columns that are being checked for missingness.

