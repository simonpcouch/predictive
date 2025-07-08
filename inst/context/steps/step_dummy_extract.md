## `step_dummy_extract()`

Creates count variables by extracting patterns from nominal data.

Arguments:
* `sep`: Regular expression for splitting strings. Takes priority over `pattern`.
* `pattern`: Regular expression for extracting patterns using `gregexpr()` with `perl = TRUE`.
* `threshold`: Numeric. If < 1: pools levels with occurrence rate below threshold. If >= 1: pools levels occurring fewer than threshold times.
* `other`: Character value for pooled category. Default: "other".
* `naming`: Function defining naming convention for new columns.
* `sparse`: String ("yes", "no", "auto"). Should columns be sparse vectors?
* `levels`: Information needed to create dummy variables (NULL until trained).
