# predictive - Asynchronous Tidymodels Assistant

## Overview

predictive is a Shiny application that provides an AI-powered chat interface for building tidymodels workflows. The core innovation is asynchronous experiment execution using mirai, allowing multiple model experiments to run in parallel without blocking the UI.

## Key Components

### Asynchronous Experiment System

The `run_experiment()` tool allows models to be fitted asynchronously:

- **Immediate Response**: Returns "Experiment {name} running" immediately
- **Background Execution**: Actual model fitting happens in mirai workers  
- **State Tracking**: Comprehensive experiment state management in `the$experiments`
- **Auto-Notification**: Shiny app automatically notifies when experiments complete
- **Result Integration**: Experiment results are seamlessly appended to chat context

### Experiment State Management

Each experiment in `the$experiments` (read `aaa.R` ) contains slots that track experiment progress.

## Key Files to Understand

For future AI assistants working on this project, read these help pages via btw tools:

* `mirai::mirai()`
* `mirai::promises()`
* `ellmer::Chat()`
* `ellmer::tool()`
* `shinychat::chat_ui()`
* `shiny::ExtendedTask`

Also, web fetch for this: https://mirai.r-lib.org/articles/mirai-promises.html

## Architecture Notes

- **Event-Driven**: Uses mirai's promise system for true async behavior
- **State Management**: Centralized in `the` environment with comprehensive tracking
- **UI Integration**: Seamless notifications and result presentation
- **Error Handling**: Graceful handling of failed experiments
- **Session Management**: Proper cleanup and state restoration

## ExtendedTask and Async Framework

### Purpose of ExtendedTask in This App

The app uses `shiny::ExtendedTask` for the chat streaming process to keep the UI responsive while the model generates responses. The ExtendedTask wraps the entire streaming pipeline from tool execution through text generation. The streaming of text from the model is itself the ExtendedTask; while the LLM responds to the user, the app is able to respond to other reactives while tokens stream in.

### Documentation to Read

Future AI assistants working on ExtendedTask issues should read:

1. **Shiny ExtendedTask**: https://shiny.posit.co/r/articles/improve/nonblocking/
   - Understanding when ExtendedTask blocks vs. yields control
   - Promise-based patterns for responsiveness

2. **mirai-promises integration**: https://mirai.r-lib.org/articles/mirai-promises.html#shiny-extendedtask-introduction
   - How mirai provides event-driven promises
   - Patterns for ExtendedTask with mirai

## Experiment Notification System

The app includes a "Notify with new results" button above the chat input when there are completed async experiments that haven't been seen by the model yet.

Key implementation details:
- Button appears when `new_async_experiments()` returns non-empty list
- Uses `notification_clicked` reactive value to track button state for immediate visual feedback
- Uses `notification_state_hash` to detect actual changes and prevent flickering from frequent timer invalidations
- Click handler sets `notification_clicked(TRUE)` immediately, then calls `start_chat_request()` which handles notification display

Problems to watch for:
- Flickering without proper state hash tracking
- Timing issues if experiments are marked as seen before `start_chat_request()` captures them
- Button persistence without proper click state tracking
