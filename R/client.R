modelbot_client <- function(
  chat = getOption(
    "modelbot.chat",
    default = chat_google_gemini(model = "gemini-2.5-pro")
  ),
  default_turns = list()
) {
  # TODO: add more context on data splitting and some notes on when
  # to use something other than `vfold_cv()`
  chat$set_system_prompt(modelbot_prompt())
  chat$set_turns(default_turns)

  chat$register_tool(tool_run_r_code)
  chat$register_tool(tool_run_experiment)
  chat$set_tools(c(chat$get_tools(), btw::btw_tools(tools = "docs")))

  chat
}
