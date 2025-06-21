## `step_holiday()`

Creates binary indicator variables for specific holidays from `Date` or `POSIXct` columns.

Arguments:
* `holidays`: A character vector of holidays supported by the `timeDate` package.
* `sparse`: Whether to create sparse columns (`"yes"`, `"no"`, or `"auto"`).
* `keep_original_cols`: A logical indicating whether to keep the original date columns.

