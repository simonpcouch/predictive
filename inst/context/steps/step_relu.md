## `step_relu()`

Applies rectified linear (ReLU) transformation to variables (max(0, x - shift) or smooth approximation).

Arguments:
* `shift`: Numeric value for translation (default: 0)
* `reverse`: Logical. Use left hinge (max(0, shift - x)) instead of right hinge?
* `smooth`: Logical. Use softplus function (ln(1 + e^(x - shift))) instead of ReLU?
* `prefix`: Character. Prefix for new column names
* `columns`: Character vector of selected variables (populated by `prep()`)
