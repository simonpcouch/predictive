## `step_regex()`

Creates a binary variable indicating if a character variable matches a regular expression.

Arguments:
* `pattern`: The regular expression to match.
* `options`: A list of options to pass to `grepl()`.
* `result`: Name for the new binary variable. Defaults to a sanitized version of the pattern.
* `sparse`: Whether to create a sparse column. Can be `"yes"`, `"no"`, or `"auto"`.
* `keep_original_cols`: Should the original character variable be kept? Defaults to `TRUE`.
