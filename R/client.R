predictive_client <- function(
  chat = getOption(
    "predictive.chat",
    default = chat_anthropic(model = "claude-sonnet-4-20250514")
  ),
  default_turns = list()
) {
  # TODO: add more context on data splitting and some notes on when
  # to use something other than `vfold_cv()`
  chat$set_system_prompt(predictive_prompt())
  chat$set_turns(default_turns)

  chat$register_tool(tool_run_r_code)
  chat$register_tool(tool_run_experiment)
  chat$set_tools(c(chat$get_tools(), btw::btw_tools(tools = "docs")))

  chat
}
