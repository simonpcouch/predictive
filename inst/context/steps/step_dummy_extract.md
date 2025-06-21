## `step_dummy_extract()`

Extracts substrings from nominal data based on a separator or pattern and creates multiple binary or count indicator variables.

Arguments:
* `sep`: A regular expression used to split the strings.
* `pattern`: A regular expression used to extract substrings. `sep` is used if both are provided.
* `threshold`: A numeric threshold (proportion if < 1, count if >= 1) for pooling infrequent results into an `other` category. Tunable.
* `other`: The name of the category for pooled levels.
* `naming`: A function to name the new dummy variables.
* `levels`: A list of the levels that will be used for the new variables. This is determined when the recipe is prepared.
* `sparse`: A character value (`"yes"`, `"no"`, or `"auto"`) to determine if sparse columns should be created.
* `keep_original_cols`: A logical indicating whether to keep the original columns.
