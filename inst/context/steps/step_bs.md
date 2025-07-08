## `step_bs()`

Creates B-spline basis expansion of variables to model nonlinear relationships.

Arguments:
* `...`: Variables to transform
* `deg_free`: Integer. Degrees of freedom for the spline. Higher values create more flexible curves. Single degree = rescaled original data
* `degree`: Integer. Degree of polynomial spline. Default is 3
* `options`: List. Additional options for `splines::bs()` excluding `x`, `degree`, or `df`
