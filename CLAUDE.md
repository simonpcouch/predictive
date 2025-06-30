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
