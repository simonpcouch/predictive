## `step_isomap()`

Creates new features using Isomap embedding, a form of multidimensional scaling that preserves geometric distances between data points using nearest neighbors. Computationally intensive.

Arguments:
* `num_terms`: Number of Isomap dimensions to retain. Tunable.
* `neighbors`: Number of nearest neighbors to use. Tunable.
* `options`: List of options passed to `dimRed::Isomap()`.
* `prefix`: Character string for the prefix of the new variables. Default is "Isomap".

Requires packages: dimRed, RSpectra, igraph, and RANN. Center and scale variables prior to running Isomap for best results.
