## `discrim_linear()`

Linear Discriminant Analysis (LDA) is a fast, classic method for classification that creates linear boundaries between classes. It's a good baseline model and works well when the decision boundary is known to be linear.

Arguments:
* `penalty`: The amount of regularization to apply. It is recommended to tune this parameter, especially with a large number of predictors.
* `regularization_method`: The specific type of regularization to use. Should be tuned when using the `sparsediscrim` engine.

Engines:
* `MASS` (classification)
    - The default engine. A standard, robust LDA implementation.
    - Requires the `discrim` extension package.
* `mda` (classification)
    - A more flexible engine that allows for mixture discriminant analysis.
    - Requires the `discrim` extension package.
* `sda` (classification)
    - Implements shrinkage-based regularization, useful for high-dimensional data. Supports the `penalty` argument.
    - Requires the `discrim` extension package.
* `sparsediscrim` (classification)
    - Offers several methods for sparse regularization, ideal for high-dimensional problems where feature selection is important. Supports both `penalty` and `regularization_method`.
    - Requires the `discrim` extension package.

