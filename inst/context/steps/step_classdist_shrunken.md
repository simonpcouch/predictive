## `step_classdist_shrunken()`

Computes the distance from a data point to the regularized, class-specific centroid for each class. This creates new predictor variables.

Arguments:
* `class`: A categorical variable to use for calculating class-specific centroids.
* `threshold`: The amount of regularization (0-1) for shrinking centroids. Tunable.
* `sd_offset`: A quantile (0-1) used to stabilize the pooled standard deviation.
* `log`: A logical. If `TRUE`, the distances are log-transformed.
* `prefix`: A character prefix for the new distance columns.
* `keep_original_cols`: A logical. If `TRUE`, the original columns are retained.

