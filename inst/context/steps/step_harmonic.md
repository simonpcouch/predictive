## `step_harmonic()`

Adds sine and cosine terms for harmonic analysis of periodic signals.

Arguments:
* `frequency`: Numeric vector. Frequency values must be positive and finite. Tunable.
* `cycle_size`: Numeric vector. Size of a single cycle in same units as input variable.
* `starting_val`: Numeric, Date, or POSIXt. Reference point for sin/cos curves. Default is 0.
* `columns`: Character. Selected variable names (populated by `prep()`).
