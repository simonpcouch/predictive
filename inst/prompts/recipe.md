R code that returns a recipe object. 

A recipe is a description of the steps to be applied to a data set in order to prepare it for modeling.

## Usage

``` R
## S3 method for class 'data.frame'
recipe(
  x,
  formula = NULL,
  ...,
  vars = NULL,
  roles = NULL,
  strings_as_factors = NULL
)

## S3 method for class 'formula'
recipe(formula, data, ...)
```

## Arguments

|  |  |
|----|----|
| `x`, `data` | A data frame, tibble, or sparse matrix from the `Matrix` package of the *template* data set. See sparse\_data for more information about use of sparse data. (see below). |
| `...` | Further arguments passed to or from other methods (not currently used). |
| `formula` | A model formula. No in-line functions should be used here (e.g. `log(x)`, `x:y`, etc.) and minus signs are not allowed. These types of transformations should be enacted using `step` functions in this package. Dots are allowed as are simple multivariate outcome terms (i.e. no need for `cbind()`; see Examples). A model formula may not be the best choice for high-dimensional data with many columns, because of problems with memory. |
| `vars` | A character string of column names corresponding to variables that will be used in any context (see below) |
| `roles` | A character string (the same length of `vars`) that describes a single role that the variable will take. This value could be anything but common roles are `"outcome"`, `"predictor"`, `"case_weight"`, or `"ID"`. |
| `strings_as_factors` | A logical, should character columns be converted to factors? See Details below. |

## Defining recipes

Creating a recipe comes in two parts:

1.  Specifying which variables are used and what roles they should have.

2.  Specifying what transformations should be applied to which
    variables.

The first part is done with `recipe()` and optionally `update_role()`,
`add_role()`, and `remove_role()`. A `recipe` object can be created in
several ways. If an analysis only contains outcomes and predictors, the
simplest way to create one is to use a formula (e.g. `y ~ x1 + x2`) that
does not contain inline functions such as `log(x3)`.

    recipe(data, formula)
    recipe(formula, data)

Variables in recipes can have any type of *role*, including outcome,
predictor, observation ID, case weights, stratification variables, etc.
You can instead use the `vars` and `roles` argument to specify the
variables and roles. `vars` must be a character vector of names and
`roles` must the the corresponding roles.

    recipe(data, vars = vars, roles = roles)

Lastly you can use `update_role()`, `add_role()`, and `remove_role()`.
These functions will alter, add, or eliminate roles from the selections.
These can be used in combination with the above ways, or by themselves
since `recipe(data)` will consume all the data as undeclared roles. Note
that `update_role()`, `add_role()`, and `remove_role()` are applied
before steps and checks, regardless of where they are in the pipeline.

    recipe(data) %>%
      update_role(class, new_role = "outcome") %>%
      update_role(starts_with("x"), new_role = "predictor")

**Steps** can include operations like scaling a variable, creating
dummy variables or interactions, and so on. More computationally
complex actions such as dimension reduction or imputation can also
be specified.

## Strings and Factors

The primary purpose of a recipe is to facilitate visualization,
modeling, and analysis. Because of this, most qualitative data should be
encoded as factors instead of character strings (with exceptions for
text analysis and related tasks). It is preferred that quantitative data
be converted to factors prior to passing the data to the recipe since
the number of levels is usually required for steps (e.g., for making
dummy indicator columns).

Although it is advisable to create factors before calling `recipe()`,
that function has a `strings_as_factors` argument that can do the
conversion. This affects the preprocessed training set (when
`retain = TRUE`) as well as the results of both `prep.recipe()` and
`bake.recipe()`. This will only affect variables with roles `"outcome"`
and `"predictor"`

In 1.2.1 and prior versions of the recipes package, this argument was
provided via `prep()`. Code that only provides it via `prep()` will
continue to work with a once-per-session warning, and in a future
version, it will become an error. If provided in both `prep()` and
`recipe()`, the value in `recipe()` will take precedence. Default to
`⁠NULL,⁠` which will be taken as `TRUE`.

## Examples

``` R
# formula example with single outcome:
data(biomass, package = "modeldata")

# split data
biomass_tr <- biomass[biomass$dataset == "Training", ]
biomass_te <- biomass[biomass$dataset == "Testing", ]

# With only predictors and outcomes, use a formula
rec <- recipe(
  HHV ~ carbon + hydrogen + oxygen + nitrogen + sulfur,
  data = biomass_tr
)

# Now add preprocessing steps to the recipe
sp_signed <- rec %>%
  step_normalize(all_numeric_predictors()) %>%
  step_spatialsign(all_numeric_predictors())
sp_signed

# formula multivariate example:
# no need for `cbind(carbon, hydrogen)` for left-hand side

multi_y <- recipe(carbon + hydrogen ~ oxygen + nitrogen + sulfur,
  data = biomass_tr
)
multi_y <- multi_y %>%
  step_center(all_numeric_predictors()) %>%
  step_scale(all_numeric_predictors())

# example using `update_role` instead of formula:
# best choice for high-dimensional data

rec <- recipe(biomass_tr) %>%
  update_role(carbon, hydrogen, oxygen, nitrogen, sulfur,
    new_role = "predictor"
  ) %>%
  update_role(HHV, new_role = "outcome") %>%
  update_role(sample, new_role = "id variable") %>%
  update_role(dataset, new_role = "splitting indicator")
rec
```

The following are possible steps one might apply.
