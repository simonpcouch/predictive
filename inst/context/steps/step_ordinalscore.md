## `step_ordinalscore()`

Converts ordinal factor variables into numeric scores.

Arguments:
* `...`: Variables to score. See `selections()`.
* `columns`: Selected variable names (populated by `prep()`).
* `convert`: Function that takes an ordinal factor vector and outputs numeric values. Default: `as.numeric`.
