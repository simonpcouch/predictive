## `step_num2factor()`

Converts numeric variables to factors (ordered or unordered).

Arguments:
* `transform`: Function to modify numeric values before determining factor levels. Should return integers corresponding to level positions.
* `levels`: Character vector of values to use as factor levels. Modified during `prep()`.
* `ordered`: Logical. Should factors be ordered?
