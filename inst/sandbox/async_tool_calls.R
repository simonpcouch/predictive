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
