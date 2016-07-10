This directory contains R5RS sources to support rapid-scheme runtime.

- `case-lambda.scm` - Case lambda macro/expander. Since `case-lambda` is also
  used to implement R7RS procedures, we have both macro and expander.

- `record-GPL3.scm` - Record procedures which ported from the original
  rapid-scheme.

- `values-utils.scm` - `let-values` and `set!-values` expander.

Expanders will be used on `%%expand-input` procedure of `r7/eval.scm`.
  
