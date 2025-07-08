## `step_spline_nonnegative()`

Creates non-negative spline features using M-splines.

Arguments:
* `deg_free`: Degrees of freedom for the b-spline (default: 10, tunable). Higher values create more flexible curves.
* `degree`: Degree of piecewise polynomial (default: 3, tunable). Zero creates piecewise constant basis functions.
* `complete_set`: Logical. If TRUE, returns complete basis matrix; if FALSE, excludes first basis.
* `options`: List of options for `splines2::mSpline()`. Can include `periodic = TRUE` for periodic splines.
* `results`: List of objects created after training.
