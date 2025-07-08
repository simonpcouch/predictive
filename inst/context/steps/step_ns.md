## `step_ns()`

Creates basis expansions of variables using natural splines, enabling nonlinear modeling.

Arguments:
* `...`: Variables to transform
* `deg_free`: Integer. Degrees of freedom for spline flexibility (default: 2). Tunable.
* `objects`: List of `splines::ns()` objects created after training
* `options`: List of options for `splines::ns()` (should not include `x` or `df`)
