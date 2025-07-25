library(recipes)

steps <-
  ls("package:recipes") |>
  stringr::str_subset("^step_") |>
  sort()

ch <- chat_google_gemini(model = "gemini-2.5-pro")
ch$set_tools(btw::btw_tools("btw_tool_files_write_text_file"))

for (step in steps) {
  cat(c(
    "Step:",
    step,
    "(",
    which(step == steps),
    "/",
    length(steps),
    ")"
  ))

  ch_ <- ch$clone()
  ch_$chat(
    paste0(
      "Your task is to write the most succint documentation possible for the 
     tidymodels preprocessing step ",
      step,
      ", unless the step is deprecated."
    ),
    "",
    "Provide the documentation in this format:

----
## `step_fn()`

[What the step does] [If it's especially computationally intensive, like PCA, note it.]

Arguments:
* arg 1, description of what it does and whether it's tunable
* ...
----  

Exclude the '----' from the actual resulting file. Those are just for clear separation here.

The arguments `recipe`, `...`, `role`, `trained`, `skip`, `keep_original_cols` and `id` are common to all steps and should be excluded from the documentation.
",
    paste0(
      "Write the documentation to the file path ",
      file.path("inst", "context", "steps", paste0(step, ".md")),
      " with the provided tool."
    ),
    "If the step is deprecated, just note this to the user and **don't write to file**. ",
    "If an argument is internal, developer-facing, or not relevant to typical usage, **don't note that argument in the documentation**.",
    "Be succinct—terse, even—in the documentation you write. Information-richness is the goal. ",
    "For example, rather than: '`na_rm`: A logical indicating whether to remove `NA` values within each window.',",
    " you might write `na_rm`: Logical. Remove `NA`s in each window?`",
    "This is relatively uncommon, but if the fit time for a step is greatly affected by an argument value, note it in the description of the argument. ",
    do.call(
      btw::btw,
      list(
        paste0("?", "recipes::", step)
      )
    )
  )
}
