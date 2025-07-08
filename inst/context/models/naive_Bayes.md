## `naive_Bayes()`

Naive Bayes models use Bayes' theorem to compute class probabilities based on predictors, assuming independence between features. Fast to train and effective for high-dimensional data, especially text classification.

Arguments:
* `smoothness`: Non-negative number controlling class boundary flexibility. Smaller values create more flexible boundaries. tune.
* `Laplace`: Non-negative value for Laplace correction to smooth low-frequency counts. tune.

Engines:
* `klaR` (classification)
  - Simple implementation good for general use cases.
  - Requires discrim extension.
* `naivebayes` (classification)
  - More efficient implementation with better handling of continuous predictors.
  - Requires discrim extension.
* `h2o` (classification)
  - Scalable implementation for larger datasets.
  - Requires agua extension.
