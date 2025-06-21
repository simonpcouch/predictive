## `step_relu()`

Applies a rectified linear (ReLu or hinge) transformation to numeric data. This transformation takes the form `max(0, x - c)`.

Arguments:
* `shift`: A numeric value for the translation `c` in the formula. Not tunable.
* `reverse`: A logical. If `TRUE`, the transformation is `max(0, c - x)`. Not tunable.
* `smooth`: A logical. If `TRUE`, a smooth approximation (the softplus function) is used instead. Not tunable.
* `prefix`: A character string prefix for the resulting new variables. Not tunable.
