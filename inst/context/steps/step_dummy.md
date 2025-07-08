## `step_dummy()`

Converts nominal data (e.g., factors) into one or more binary dummy variables.

Arguments:
* `one_hot`: Logical. Create C dummy variables for C levels rather than C-1?
* `contrasts`: Named vector/list of contrast function names. Default: `list(unordered = "contr.treatment", ordered = "contr.poly")`
* `naming`: Function defining naming convention for new dummy columns
* `levels`: List containing information needed to create dummy variables. `NULL` until step is trained
* `sparse`: String ("yes", "no", "auto"). Should columns be sparse vectors?
