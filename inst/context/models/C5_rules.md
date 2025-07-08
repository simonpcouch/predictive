## `C5_rules()`

Rule-based classification model derived from C5.0 trees. Fast to fit and produces interpretable rules. Each rule set includes conditions for prediction.

Arguments:
* `trees`: # of ensemble members (max 100). tune.
* `min_n`: Minimum # of data points required for node splitting (0-9). tune.

Engines:
* `C5.0` (classification)
  - Requires rules extension.
