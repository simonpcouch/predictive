## `surv_reg()`

**Deprecated in favor of `survival_reg()`**. A parametric model for censored, time-to-event data. Fitting is generally fast.

Arguments:
* `dist`: Assumed probability distribution for the outcome. Tune.

Engines:
* `survival` (regression)
    - The standard engine for survival analysis in R.
    - No extension package needed.
* `flexsurv` (regression)
    - Allows for a wider variety of parametric survival distributions.
    - No extension package needed.

