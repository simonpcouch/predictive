## `step_lincomb()`

Removes numeric variables that have exact linear combinations between them.

Arguments:
* `...`: Selectors for variables to check for linear combinations
* `max_steps`: Number of times to apply the algorithm
* `removals`: Character string of columns that should be removed (determined during `prep()`)
