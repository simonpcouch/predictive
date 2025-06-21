chat_bot <- function(system_prompt = NULL, default_turns = list()) {
  system_prompt <- system_prompt %||% modelbot_prompt()

  api_key <- Sys.getenv("modelbot_API_KEY", Sys.getenv("ANTHROPIC_API_KEY", ""))
  if (api_key == "") {
    abort(paste(
      "No API key found;",
      "please set modelbot_API_KEY or ANTHROPIC_API_KEY env var"
    ))
  }

  chat <- chat_claude(
    system_prompt,
    model = "claude-3-5-sonnet-latest",
    turns = default_turns,
    echo = FALSE,
    api_key = api_key
  )
  chat$register_tool(tool(
    run_r_code,
    "Executes R code in the current session",
    code = type_string("R code to execute")
  ))
  chat
}
