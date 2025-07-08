## `bag_mlp()`

Bagged multilayer perceptron (MLP) models are ensembles of single-layer neural networks. Powerful for capturing complex non-linear patterns but slow to fit.

Arguments:
* `hidden_units`: # of units in the hidden layer. tune.
* `penalty`: The L2 regularization penalty. tune.
* `epochs`: # of training iterations. tune.

Engines:
* `nnet` (classification, regression)
  - Requires baguette extension.
