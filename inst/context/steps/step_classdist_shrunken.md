## `step_classdist_shrunken()`

Converts numeric data into Euclidean distances to regularized class centroids for classification models.

Arguments:
* `...`: Variables to use in the computation
* `class`: Bare name of a single categorical variable to use as the class
* `threshold`: Regularization parameter (0-1). 0 means no regularization, 1 means full shrinkage to global centroid
* `sd_offset`: Value (0-1) for quantile used to stabilize pooled standard deviation
* `log`: Logical. Transform distances using natural log?
* `prefix`: Prefix for new variable names
