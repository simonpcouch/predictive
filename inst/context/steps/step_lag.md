## `step_lag()`

Lags variables, creating new columns with data from previous rows. This step assumes that the data are already in the proper sequential order.

Arguments:
* `lag`: An integer vector of lags to apply.
* `prefix`: A character prefix for the new lagged column names.
* `default`: Value to use for padding the new observations created by lagging (defaults to NA).
* `keep_original_cols`: A logical indicating whether to keep the original variables in the output.
