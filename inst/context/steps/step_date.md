## `step_date()`

Converts date variables into one or more factor or numeric variables.

Arguments:
* `features`: A character vector of which date features to extract. Common options: "year", "doy" (day of year), "month", and "dow" (day of week).
* `abbr`: For `month` or `dow` features, should abbreviated names be used (e.g., "Sun")?
* `label`: For `month` or `dow` features, `TRUE` returns a character/factor. `FALSE` returns a number.
* `ordinal`: For `month` or `dow` features, should the created factor be ordered?
* `locale`: The locale used for month and day names, e.g. "en_US".
* `keep_original_cols`: Set to `FALSE` to remove the original date variable.
