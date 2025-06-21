databot_prompt <- function(has_project = TRUE, llms_txt = NULL) {
  llms_txt <- NULL
  if (file.exists(here::here("llms.txt"))) {
    llms_txt <- paste(
      readLines(here::here("llms.txt"), encoding = "UTF-8", warn = FALSE),
      collapse = "\n"
    )
  }

  template <- databot_prompt_template()

  whisker::whisker.render(
    template,
    data = list(
      has_project = TRUE, # TODO: Make this dynamic
      has_llms_txt = TRUE,
      llms_txt = llms_txt
    )
  )
}

databot_prompt_template <- function() {
  paste(
    readLines(
      system.file("prompt/prompt.md", package = "databot"),
      encoding = "UTF-8",
      warn = FALSE
    ),
    collapse = "\n"
  )
}
