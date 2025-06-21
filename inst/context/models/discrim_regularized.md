## `discrim_regularized()`

Regularized Discriminant Analysis (RDA) provides a compromise between LDA and QDA by regularizing the covariance matrix. This makes it a flexible and powerful classifier, especially when the assumptions of LDA or QDA are not fully met. It is very fast to fit.

Arguments:
* `frac_common_cov`: The fraction of the covariance matrix that is shared across classes, controlling the model between LDA (a value of 1) and QDA (a value of 0). It is recommended to tune this parameter.
* `frac_identity`: The fraction of the covariance matrix that is diagonal, providing shrinkage. It is recommended to tune this parameter.

Engines:
* `klaR` (classification)
    - A robust implementation of RDA, useful for finding a balance between the stability of LDA and the flexibility of QDA.
    - Requires the `discrim` extension package.

