## `step_count()`

Counts the occurrences of a regular expression pattern in a string variable.

Arguments:
* `pattern`: The regular expression to match. (tunable)
* `normalize`: A logical indicating whether to divide the counts by the total number of characters in the string. (tunable)
* `options`: A list of options to pass to `gregexpr()`.
* `result`: A character string for the name of the new variable.
* `sparse`: A string indicating whether to create a sparse column (`"yes"`, `"no"`, or `"auto"`).
* `keep_original_cols`: A logical indicating whether to keep the original variable.

