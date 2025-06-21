## `bag_mlp()`

Bagged MLP for non-linear models. Slow to fit, but can be very accurate.

Arguments:
* `hidden_units`: Number of hidden units. Tune.
* `penalty`: L2 regularization. Tune.
* `epochs`: Number of training iterations. Tune.

Engines:
* `nnet` (classification, regression)
    - Good for complex, non-linear data.
    - Requires the `baguette` package.

