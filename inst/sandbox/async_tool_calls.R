btw::btw(
  "I'd like to make tool calls to `run_experiment()` asynchronous.",
  "Essentially, when a model tool calls `run_experiment()`, I want it to return
  immediately, saying 'Experiment {name} running.' Then, the experiment will be 
  sent off to a mirai worker to be evaluated outside of the main R session.",
  "There should _only_ be an asynchronous version--no need to support both sync
  and async.",
  "{mirai}", "{ellmer}",
  vignette("streaming-async", package = "ellmer"),
  "Also, here's some context on event-driven promises in mirai: ",
  readLines("https://raw.githubusercontent.com/r-lib/mirai/refs/heads/release/vignettes/mirai-promises.Rmd"),
  "The hard part might be, once the experiment finishes, automatically passing
  its results to the model. Don't worry about that at first.",
  "Read any documentation with acquaint you may need; you can assume 
  needed packages are installed when reading help pages."
)

# Once that bit was set up:
#
# Now, we need to actually return the results to the 
# model. When an experiment finishes running, drop an alert in the shiny app 
# reading "New experiment results available! Send any message to notify the model."
#  At each user turn, append all of the collected metrics from all of the 
# experiments (including the old one) to the user turn. The experiment results 
# should be in order and should be ephemeral (meaning that they shouldn't be 
# attached to the master chat object or visible in the UI). The return value of 
# the mirai should modify some sort of the$newly_completed_experiments internal 
# state with c(current value, ...). The shiny app should have a reactive based 
# on that.
