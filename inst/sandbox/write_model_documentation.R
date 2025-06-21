ch <- chat_google_gemini(model = "gemini-2.5-pro")
ch$set_tools(btw::btw_tools())

library(parsnip)
library(tidyverse)
loaded <- lapply(parsnip:::extensions(), require, character.only = TRUE)

parsnip:::model_info_table

relevant_models <-
  parsnip:::model_info_table %>%
  filter(mode %in% c("classification", "regression")) %>%
  filter(!model %in% "auto_ml") %>%
  filter(!engine %in% c("agua", "liquidSVM", "glmer", "gee", "lmer", "lme", "spark", "stan_glmer", "mgcv"))

model_types <- sort(unique(relevant_models$model))

for (model_type in model_types) {
  cat(c(
    "Model type:",
    model_type,
    "(",
    which(model_type == model_types),
    "/",
    length(model_types),
    ")"
  ))

  ch$clone()$chat(
    paste0("Your task is to write the most succint documentation possible for the 
     tidymodels modeling function ", model_type, "."),
    "You will be provided some context on the modes, engines, and required extension
    packages for each model type. If the `pkg` is NA or `parsnip`, then no 
    additional packages are needed.",
    "",
    "Provide the documentation in this format:

----
## `model_type()`

[Generally, when the model type is useful and how quickly it fits.]

Arguments:
* arg 1, description of what it does and whether to tune it
* ...

Engines:
* engine 1 (modes it supports), 
    - any arguments it doesn't support, 
    - in what situations it's useful and any performance considerations, 
    - whether it requires a parsnip extension package to be loaded
* ...
----  

Exclude the '----' from the actual resulting file. Those are just for clear separation here.
",
    paste0("Write the documentation to the file path ", file.path("inst", "context", "models", paste0(model_type, ".md")), " with the provided tool."),
    "Be succinct in the documentation you write. Information-richness is the goal.",
    "Use your own knowledge to describe the speed of fitting. e.g. decision trees
    are generally fast-fitting, random forests less so.",
    do.call(
      btw::btw,
      list(
        paste0("?", "parsnip::", model_type),
        "Relevant modes, engines, and packages: ",
        btw::btw_this(
          filter(parsnip:::model_info_table, model == model_type),
          format = "json"
        )
      )
    )

  )
}
