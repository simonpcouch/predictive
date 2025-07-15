suggestions <- c(
  "It's sometimes helpful to revisit EDA to better understand how you might engineer features.",
  "Consider correlations between predictors.",
  "What's an underutilized model type that may be helpful here?",
  "What's an underutilized preprocessing workflow that may be helpful here?",
  "Remember that the goal is ultimately to drive down errors.",
  "Consider the distribution of the outcome variable and whether some transformation may be helpful in reducing error metrics.",
  "Consider exploring interaction terms between your strongest predictors.",
  "Try polynomial features to capture nonlinear relationships you might be missing.",
  "Look for outliers in your data that might benefit from robust preprocessing steps.",
  "Consider dimensionality reduction techniques like PCA to help with multicollinearity.",
  "Consider whether temporal patterns in your data that time-based features could capture.",
  "Consider preprocessing steps that might help handle skewed distributions in your predictors."
)

predictive_prompt <- function(has_project = TRUE, llms_txt = NULL) {
  llms_txt <- NULL
  if (file.exists(here::here("llms.txt"))) {
    llms_txt <- paste(
      readLines(here::here("llms.txt"), encoding = "UTF-8", warn = FALSE),
      collapse = "\n"
    )
  }

  template <- predictive_prompt_template()

  whisker::whisker.render(
    template,
    data = list(
      has_project = TRUE, # TODO: Make this dynamic
      has_llms_txt = TRUE,
      llms_txt = llms_txt
    )
  )
}

predictive_prompt_template <- function() {
  paste(
    readLines(
      system.file("prompts/main.md", package = "predictive"),
      encoding = "UTF-8",
      warn = FALSE
    ),
    collapse = "\n"
  )
}
