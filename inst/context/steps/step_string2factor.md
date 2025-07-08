## `step_string2factor()`

Converts character vectors to factors (ordered or unordered).

**Note:** Use only in special cases. Prefer converting strings to factors before using any tidymodels functions.

Arguments:
* `levels`: Optional specification of levels for the new factor. If NULL, sorted unique values when `bake()` is called will be used
* `ordered`: Logical. Should the factor(s) be ordered?
