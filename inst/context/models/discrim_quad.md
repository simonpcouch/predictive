## `discrim_quad()`

Quadratic Discriminant Analysis (QDA) creates non-linear (quadratic) decision boundaries, making it more flexible than LDA. It is very fast to fit but can be prone to overfitting with many predictors.

Arguments:
* `regularization_method`: The type of regularization to use. Should be tuned when using the `sparsediscrim` engine, especially with high-dimensional data.

Engines:
* `MASS` (classification)
    - The default, standard implementation of QDA.
    - Requires the `discrim` extension package.
* `sparsediscrim` (classification)
    - Provides regularized versions of QDA, which are useful for high-dimensional datasets to improve stability.
    - Requires the `discrim` extension package.

