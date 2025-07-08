## `step_sample()`

Samples rows from the data using dplyr's sampling functions.

Arguments:
* `size`: Integer or fraction. If within (0, 1), uses `sample_frac()`. If ≥1, uses `sample_n()`. Default (`NULL`) uses `sample_n()` with training set size.
* `replace`: Logical. Sample with replacement?
