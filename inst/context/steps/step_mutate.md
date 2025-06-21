## `step_mutate()`

Adds new variables, similar to `dplyr::mutate()`. Be cautious of data leakage when creating new variables based on global properties of the data, like the mean.

Arguments:
* `.pkgs`: A character vector of R package names that should be loaded when the recipe is baked.
