## `step_profile()`

Creates a profiling version of a dataset by fixing values of all variables except one, which is sequenced across its range.

Arguments:
* `profile`: Variable name to profile (all others will be fixed)
* `pct`: Value between 0 and 1 that determines percentile for fixing continuous variables
* `index`: Level at which qualitative variables will be fixed
* `grid`: List with `pctl` (logical) and `len` (integer) that controls how the profile grid is created
* `columns`: Character string of selected variable names (populated by `prep()`)
