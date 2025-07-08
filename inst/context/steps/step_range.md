## `step_range()`

Normalizes numeric data to be within a specific range.

Arguments:
* `min`: Single numeric value for the smallest value in the transformed data. Default is 0.
* `max`: Single numeric value for the largest value in the transformed data. Default is 1.
* `clipping`: Logical. Should values in new data be forced inside `min` and `max`? Default is TRUE.
* `ranges`: Character vector of variables that will be normalized (automatically determined by `prep()`).
