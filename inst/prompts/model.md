R code that returns a parsnip model specification. For example, to specify a linear regression:

```r
linear_reg()
```

Or, to use a different engine and set some arguments:

```r
linear_reg(penalty = .1) |>
  set_engine("glmnet")
```

To tune argument values, set their value to `tune()`:

```r
linear_reg(penalty = tune()) |>
  set_engine("glmnet")
```

When using a model type with an ambiguous mode, be sure to set it explicitly:

```r
decision_tree() |>
  set_mode("regression")
```

In all of the above cases, the triple backticks are for example only and should not be included in the argument specification.

Possible options are shown below.
