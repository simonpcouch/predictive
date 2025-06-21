## `multinom_reg()`

Multinomial regression extends logistic regression to handle multi-class classification problems (with more than two outcomes). It's a fast and interpretable linear model, making it an excellent baseline for classification.

Arguments:
* `penalty`: The total amount of regularization. It is recommended to tune this parameter when using regularized engines like `glmnet` or `brulee`.
* `mixture`: The proportion of L1 (lasso) vs. L2 (ridge) regularization. It is recommended to tune this parameter when using regularized engines.

Engines:
* `nnet` (classification)
    - The default engine. A fast and reliable implementation. Does not support the `mixture` argument.
    - No parsnip extension package is required.
* `glmnet` (classification)
    - Excellent for regularized regression (lasso, ridge, elastic net), useful for high-dimensional data and feature selection. Supports both `penalty` and `mixture`.
    - No parsnip extension package is required.
* `brulee` (classification)
    - A fast, Torch-based engine suitable for GPU acceleration. Supports `penalty` and `mixture`.
    - No parsnip extension package is required.
* `h2o` (classification)
    - A scalable engine designed for very large datasets.
    - Requires the `agua` extension package.
* `keras` (classification)
    - A flexible deep learning engine. Does not support the `mixture` argument.
    - No parsnip extension package is required.

