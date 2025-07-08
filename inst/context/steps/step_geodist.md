## `step_geodist()`

Calculates the distance between geographic points and a reference location.

Arguments:
* `lat`, `lon`: Selectors for latitude and longitude variables
* `ref_lat`, `ref_lon`: Numeric values for the reference location
* `is_lat_lon`: Logical. If TRUE, uses Haversine formula (returns meters). If FALSE, uses Pythagorean formula
* `log`: Logical. Transform distance with natural log?
* `name`: Character. Name for the new distance column, defaults to "geo_dist"
* `columns`: Character. Selected variable names (populated by `prep()`)
