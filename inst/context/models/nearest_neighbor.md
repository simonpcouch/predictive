## `nearest_neighbor()`

K-nearest neighbor models use the K most similar training points to make predictions. Fast to define but can be slow to predict with large datasets.

Arguments:
* `neighbors`: Number of neighbors to consider (k). tune.
* `weight_func`: Kernel function to weight distances. Options: "rectangular", "triangular", "epanechnikov", "biweight", "triweight", "cos", "inv", "gaussian", "rank", "optimal".
* `dist_power`: Parameter for Minkowski distance calculation.

Engines:
* `kknn` (classification, regression)
  - Fast implementation with various weighting schemes.
  - No additional packages required.
