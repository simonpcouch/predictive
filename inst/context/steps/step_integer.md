## `step_integer()`

Converts categorical variables to integers based on the factor levels or alphabetical order of values observed in the training set. Also known as integer encoding.

Arguments:
* `strict`: A logical. If `TRUE` (the default), the new column is an integer. If `FALSE`, it's a numeric (double). Not tunable.
* `zero_based`: A logical. If `TRUE`, the integer mapping starts at 0. If `FALSE` (the default), the mapping starts at 1, and any new levels not seen during training are mapped to 0. Not tunable.
