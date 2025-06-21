## `multinom_reg()`

Multinomial regression for multi-class classification. A fast, interpretable baseline model.

Arguments:
* `penalty`: Regularization amount. Tune.
* `mixture`: L1 vs. L2 regularization ratio. Tune.

Engines:
* `nnet` (classification)
    - Default engine.
    - Doesn't support regularization.
    - No extension package needed.
* `glmnet` (classification)
    - Good for high-dimensional data or when regularization is needed.
    - No extension package needed.
* `keras` (classification)
    - A powerful and flexible neural network backend.
    - No extension package needed.
* `h2o` (classification)
    - Highly scalable for large datasets.
    - Requires the `agua` package.
* `brulee` (classification)
    - Torch-based engine, can leverage GPUs for speed.
    - No extension package needed.

