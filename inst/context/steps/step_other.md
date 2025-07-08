## `step_other()`

Collapses infrequent categorical levels into an "other" category.

Arguments:
* `threshold`: Numeric. If < 1: levels with occurrence rate below this are pooled. If >= 1: levels occurring fewer times than this are pooled. Tunable.
* `other`: Character. Value for the pooled category. Default: "other".
* `objects`: List containing information about levels to pool (created by `prep()`).
