## `step_interact()`

Creates new features that are interaction terms between variables. This step is intended for numeric data. Categorical predictors should be converted to dummy variables before creating interactions.

Arguments:
* `terms`: A formula that contains the interaction terms (e.g., `~ var1:var2`). Selectors like `tidyselect::starts_with()` can be used. This argument is not tunable.
* `sep`: A character string to separate the column names (e.g., `_x_`). This argument is not tunable.
* `keep_original_cols`: A logical indicating whether to keep the original variables in the output. This argument is not tunable.
