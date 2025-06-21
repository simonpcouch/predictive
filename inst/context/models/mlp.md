## `mlp()`

Multi-layer perceptron (neural network). Flexible for complex non-linear data, but can be slow to train.

Arguments:
* `hidden_units`: Number of hidden units. Tune.
* `penalty`: L2 regularization amount. Tune.
* `dropout`: Proportion of parameters to drop out for regularization. Tune.
* `epochs`: Number of training epochs. Tune.
* `activation`: Activation function for hidden layers. Tune.
* `learn_rate`: Learning rate. Tune.

Engines:
* `nnet` (classification, regression)
    - Default. Single hidden layer.
    - Doesn't support `dropout`, `activation`, or `learn_rate`.
    - No extension package needed.
* `keras` (classification, regression)
    - A powerful and flexible engine.
    - No extension package needed.
* `h2o` (classification, regression)
    - Good for large datasets, highly scalable.
    - Requires `agua` package.
* `brulee` (classification, regression)
    - Torch-based engine, can leverage GPUs. `brulee_two_layer` is a two-layer variant.
    - No extension package needed.

