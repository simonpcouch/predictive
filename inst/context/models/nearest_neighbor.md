## `nearest_neighbor()`

K-Nearest Neighbors (KNN) is a non-parametric model that makes predictions based on the 'k' most similar training examples. There is no traditional "fitting" process, making it instantaneous to train, but prediction can be slow on large datasets as it requires computing distances to all training points.

Arguments:
* `neighbors`: The number of neighbors (k) to consider. It is essential to tune this parameter.
* `weight_func`: The kernel function used to weight distances between samples. It is recommended to tune this parameter.
* `dist_power`: The power for the Minkowski distance (e.g., p=2 for Euclidean, p=1 for Manhattan). It is recommended to tune this parameter.

Engines:
* `kknn` (classification, regression)
    - The default and only engine. It is a feature-rich and flexible implementation of KNN.
    - No parsnip extension package is required.

