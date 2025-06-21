modelbot_client <- function(
  chat = chat_google_gemini(model = "gemini-2.5-pro"),
  default_turns = list()
) {
  chat$set_system_prompt(modelbot_prompt())

  chat$register_tool(tool(
    run_r_code,
    "Executes R code in the current session",
    code = type_string("R code to execute")
  ))
  chat$set_tools(c(chat$get_tools(), btw::btw_tools(tools = "docs")))

  chat
}
