## `bag_mlp()`

Bagged multilayer perceptron (MLP) models are ensembles of single-layer neural networks. They are powerful for capturing complex non-linear patterns but are computationally intensive and slow to fit.

Arguments:
* `hidden_units`: The number of units in the hidden layer. It is recommended to tune this parameter.
* `penalty`: The L2 regularization (weight decay) penalty. It is recommended to tune this parameter.
* `epochs`: The number of training iterations. It is recommended to tune this parameter.

Engines:
* `nnet` (classification, regression)
    - A reliable engine for fitting bagged MLPs.
    - Requires the `baguette` extension package.

