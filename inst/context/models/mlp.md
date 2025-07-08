## `mlp()`

Multilayer perceptron (MLP) models are single-layer, feed-forward neural networks for capturing non-linear patterns. Moderate fitting speed.

Arguments:
* `hidden_units`: # of units in hidden layer. tune.
* `penalty`: L2 regularization/weight decay. tune.
* `dropout`: Proportion of parameters randomly set to zero during training (0-1).
* `epochs`: # of training iterations. tune.
* `activation`: Relationship between predictors and hidden layer units.
* `learn_rate`: Rate of algorithm adaptation between iterations (for specific engines).

Engines:
* `nnet` (classification, regression)
  - Simple implementation, good for moderate datasets.
* `brulee` (classification)
  - GPU-accelerated implementation for faster training.
* `brulee_two_layer` (classification)
  - GPU-accelerated two-layer network for more complex problems.
* `h2o` (classification)
  - Distributed computing for large datasets.
  - Requires agua extension.
* `keras` (classification)
  - Most flexible implementation with advanced architectures.
  - Best for complex, large-scale problems.
