modelbot_client <- function(
  chat = chat_google_gemini(model = "gemini-2.5-pro"),
  default_turns = list()
) {
  chat$set_system_prompt(modelbot_prompt())
  chat$set_turns(default_turns)

  chat$register_tool(tool_run_r_code)
  chat$register_tool(tool_run_experiment)
  chat$set_tools(c(chat$get_tools(), btw::btw_tools(tools = "docs")))

  chat
}
