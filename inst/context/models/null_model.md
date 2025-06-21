## `null_model()`

The null model is a non-informative model that ignores all predictors and simply predicts the average value of the training data (the mean for regression, the most common class for classification). It is used as a simple baseline to ensure any other model is performing better than chance. Fitting is instantaneous.

Arguments:
* This model has no tunable arguments.

Engines:
* `parsnip` (classification, regression)
    - The default and only engine.
    - No parsnip extension package is required.

