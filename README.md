# A frontend for predictive modeling with tidymodels

predictive is an agentic frontend for predictive modeling with tidymodels. It's a fork of [databot](https://github.com/jcheng5/databot), an exploratory data analysis agent, with two important modifications:

* Ensuring models have the right "stance"—not touched the testing data prematurely and repeating experiments with shared resampled metrics—requires substantial prompting and tooling.
* It is typical for modeling code to take a long time to run, requiring asynchronous execution and new UI.

After walking you through data splitting, resampling, and EDA, predictive will collaborate with you to launch modeling experiments that iteratively drive down error rates.

![Demo of predictive.](https://github.com/user-attachments/assets/b16de421-e984-481b-a957-eb85cb8d6c93)

## Installation

```r
pak::pak("simonpcouch/predictive")
```

## Running

- Open a (new or existing) project in RStudio or Positron.
- Run `predictive::predictive()` to launch the app.
