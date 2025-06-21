## `nearest_neighbor()`

K-Nearest Neighbors (KNN). A non-parametric model that is simple and fast, but can be slow at prediction time for large data.

Arguments:
* `neighbors`: # of neighbors (k). Tune.
* `weight_func`: Kernel for weighting distances. Tune.
* `dist_power`: Power for Minkowski distance. Tune.

Engines:
* `kknn` (classification, regression)
    - The only engine, a good general-purpose choice.
    - No extension package needed.

