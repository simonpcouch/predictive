## `naive_Bayes()`

Naive Bayes is a simple probabilistic classifier based on the "naive" assumption of feature independence. It is exceptionally fast to fit and works well as a baseline model, particularly for text classification and problems with categorical predictors.

Arguments:
* `smoothness`: A parameter controlling the flexibility of the decision boundary (for kernel-based models). It is recommended to tune this parameter.
* `Laplace`: A correction to handle features with zero counts in the training data. It is recommended to tune this parameter.

Engines:
* `klaR` (classification)
    - The default engine. A standard implementation suitable for general use. Supports the `smoothness` argument.
    - Requires the `discrim` extension package.
* `naivebayes` (classification)
    - A flexible and efficient engine that can handle different predictor types. Supports the `Laplace` argument.
    - Requires the `discrim` extension package.
* `h2o` (classification)
    - A scalable engine for very large datasets. Supports the `Laplace` argument.
    - Requires the `agua` extension package.

