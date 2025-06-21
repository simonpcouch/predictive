## `step_geodist()`

Calculates the geographic distance from a set of coordinates to a reference point. By default, it uses the Haversine formula to calculate the great-circle distance.

Arguments:
* `lat`, `lon`: The latitude and longitude columns.
* `ref_lat`, `ref_lon`: The latitude and longitude for the reference point.
* `is_lat_lon`: A logical. If `TRUE` (the default), uses the Haversine formula (meters). If `FALSE`, uses the Pythagorean theorem.
* `log`: A logical. If `TRUE`, the returned distance is natural-log transformed.
* `name`: The name for the new distance column.
* `keep_original_cols`: A logical. If `TRUE`, the original `lat` and `lon` columns are retained.
