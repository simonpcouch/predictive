## `step_time()`

Converts date-time data into factor or numeric variables representing time components.

Arguments:
* `features`: Character vector of time features to extract. Options: `am` (is AM), `hour`, `hour12`, `minute`, `second`, `decimal_day`. Default: `c("hour", "minute", "second")`
* `columns`: Character vector of variable names to operate on (populated by `prep()`)
