## `surv_reg()`

**Note:** This function is deprecated in favor of `survival_reg()` with `mode = "censored regression"`.

Parametric survival models are used for time-to-event (censored regression) data. They assume the survival time follows a specific probability distribution. These models are highly interpretable and very fast to fit.

Arguments:
* `dist`: The probability distribution for the survival time (e.g., `"weibull"`, `"lognormal"`). This is a fundamental model specification choice.

Engines:
* `survival` (regression)
    - The default engine. Provides standard and robust parametric survival models.
    - No parsnip extension package is required.
* `flexsurv` (regression)
    - A more flexible engine that supports a wider range of distributions.
    - No parsnip extension package is required.

