## `step_holiday()`

Creates binary indicator variables for common holidays from date data.

Arguments:
* `holidays`: Character vector of holiday names supported by the `timeDate` package (default: `c("LaborDay", "NewYearsDay", "ChristmasDay")`)
* `columns`: Character string of selected variable names (populated by `prep()`)
* `sparse`: Should columns be sparse vectors? Options: "yes", "no", "auto" (default: "auto")
