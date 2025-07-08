## `step_date()`

Converts date data into factor or numeric variables.

Arguments:
* `features`: Which date elements to extract. Options: "month", "dow" (day of week), "mday" (day of month), "doy" (day of year), "week", "decimal", "quarter", "semester", "year".
* `abbr`: Logical. For "month"/"dow", use abbreviated names?
* `label`: Logical. For "month"/"dow", use names instead of numbers?
* `ordinal`: Logical. Should factors be ordered?
* `locale`: Locale for "month"/"dow". String or `clock::clock_labels()` object.
* `columns`: Selected column names (populated by `prep()`).
