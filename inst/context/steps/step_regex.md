## `step_regex()`

Creates a new dummy variable based on a regular expression match.

Arguments:
* `pattern`: Character string containing a regular expression to be matched
* `options`: List of options to pass to `grepl()` (excluding `x` or `pattern`)
* `result`: Name for the new variable (defaults to `make.names(pattern)`)
* `input`: Name of variable being searched (computed by `prep()`)
* `sparse`: Should output be sparse? "yes", "no", or "auto"
