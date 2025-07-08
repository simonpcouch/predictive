## `step_classdist()`

Creates features measuring the Mahalanobis distance from observations to class centroids.

Arguments:
* `class`: Bare name of a single categorical variable to use as the class.
* `mean_func`: Function to compute the center of the distribution. Default: `mean`.
* `cov_func`: Function to compute the covariance matrix. Default: `cov`.
* `pool`: Logical. Should covariance matrix be computed by pooling data for all classes? Default: `FALSE`.
* `log`: Logical. Should distances be transformed by natural log? Default: `TRUE`.
* `prefix`: Character string for prefix of new variables. Default: "classdist_".
