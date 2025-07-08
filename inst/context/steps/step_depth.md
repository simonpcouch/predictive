## `step_depth()`

Converts numeric data into class-specific data depth measurements (proximity to center of distribution).

Arguments:
* `class`: Specifies the single categorical variable used as class
* `metric`: Character. Depth metric ("halfspace", "potential", "Mahalanobis", "simplicialVolume", "spatial", "zonoid")
* `options`: List of options for the underlying depth functions
* `prefix`: Character prefix for new columns (default "depth_")
* `data`: Training data (automatically stored after `prep()`)
