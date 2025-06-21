## `mlp()`

Multilayer Perceptrons (MLPs) are neural networks that are very effective for modeling complex, non-linear relationships. They are computationally intensive and can be slow to fit, requiring careful tuning.

Arguments:
* `hidden_units`: The number of units in the hidden layer(s). It is recommended to tune this parameter.
* `penalty`: The L2 regularization penalty. It is recommended to tune this parameter.
* `dropout`: The proportion of nodes to randomly drop out during training. It is recommended to tune this parameter.
* `epochs`: The number of training iterations. It is recommended to tune this parameter.
* `activation`: The activation function for the hidden layer. It is recommended to tune this parameter.
* `learn_rate`: The learning rate for the optimizer. It is recommended to tune this parameter.

Engines:
* `nnet` (classification, regression)
    - The default engine. A simple and fast implementation for a single hidden layer.
    - Does not support `dropout`, `activation`, or `learn_rate`.
    - No parsnip extension package is required.
* `brulee` (classification, regression)
    - A fast, Torch-based engine for a single hidden layer, good for GPU acceleration.
    - Does not support `activation`.
    - No parsnip extension package is required.
* `brulee_two_layer` (classification, regression)
    - Same as `brulee`, but for two hidden layers.
    - No parsnip extension package is required.
* `h2o` (classification, regression)
    - A scalable engine for large datasets.
    - Requires the `agua` extension package.
* `keras` (classification, regression)
    - A highly flexible engine offering extensive customization.
    - No parsnip extension package is required.

