## `step_count()`

Creates a variable that counts instances of a regular expression pattern in text.

Arguments:
* `...`: Selector for the variable to search
* `pattern`: Regular expression to match in the text
* `normalize`: Logical. Divide counts by total characters?
* `options`: List of options to pass to `gregexpr()`
* `result`: Name for the new column
* `input`: Name of the variable being searched (computed by `prep()`)
* `sparse`: Should columns be sparse vectors? "yes", "no", or "auto"
