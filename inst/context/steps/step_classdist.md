## `step_classdist()`

Calculates the Mahalanobis distance from numeric predictors to the centroid for each class of a categorical variable. This can be computationally intensive.

Arguments:
* `class`: A single categorical variable for classification.
* `mean_func`: A function to compute the center of the distribution.
* `cov_func`: A function to compute the covariance matrix.
* `pool`: A logical; if `TRUE`, the covariance matrix is computed by pooling all classes.
* `log`: A logical; if `TRUE`, the distances are log-transformed.
* `prefix`: A character string prefix for the new distance columns.
* `keep_original_cols`: A logical to retain the original predictors.

