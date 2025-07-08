## `step_ica()`

Converts numeric data into independent components using FastICA.

Arguments:
* `num_comp`: Number of components to retain. If greater than possible components, a smaller value is used. If 0, no transformation occurs. Tunable.
* `options`: List of options passed to `fastICA::fastICA()` (don't pass `X` or `n.comp`).
* `seed`: Integer to set random number stream before running ICA.
* `prefix`: Character string prefix for new variables.
