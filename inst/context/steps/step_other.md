## `step_other()`

Collapses infrequent categorical levels into a new "other" level.

Arguments:
* threshold, A numeric value used to determine which levels to pool. If between 0 and 1, it's a proportion of the total samples. If >= 1, it's a frequency count. Tunable.
* other, A character string for the name of the new "other" category.

