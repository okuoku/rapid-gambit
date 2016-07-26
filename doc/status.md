# Implementation status

- R7RS Coverage % (Incl. Not confirmed): 86.35014836795251
- Total: 337
- Implemented procedures: 49
- Implemented by Rapid-Scheme: 52
- Maybe implemented: 190
- Not yet implemented: 36
- Bad: 10

# Symbol status
|Symbol|status|library|R7RS Section|Remarks|
|:-----|:----:|:-----:|:-----------|:------|
|quote                         |rapid-scheme    |(scheme base)           |4.1.2. Literal expressions||
|lambda                        |rapid-scheme    |(scheme base)           |4.1.4. Procedures       ||
|if                            |rapid-scheme    |(scheme base)           |4.1.5. Conditionals     ||
|set!                          |rapid-scheme    |(scheme base)           |4.1.6. Assignments      ||
|include                       |rapid-scheme    |(scheme base)           |4.1.7. Inclusion        ||
|include-ci                    |rapid-scheme    |(scheme base)           |4.1.7. Inclusion        ||
|cond                          |rapid-scheme    |(scheme base)           |4.2.1. Conditionals     ||
|else                          |BAD             |(scheme base)           |4.2.1. Conditionals     ||
|=>                            |rapid-scheme    |(scheme base)           |4.2.1. Conditionals     ||
|case                          |rapid-scheme    |(scheme base)           |4.2.1. Conditionals     ||
|and                           |rapid-scheme    |(scheme base)           |4.2.1. Conditionals     ||
|or                            |rapid-scheme    |(scheme base)           |4.2.1. Conditionals     ||
|when                          |rapid-scheme    |(scheme base)           |4.2.1. Conditionals     ||
|unless                        |rapid-scheme    |(scheme base)           |4.2.1. Conditionals     ||
|cond-expand                   |rapid-scheme    |(scheme base)           |4.2.1. Conditionals     ||
|let                           |rapid-scheme    |(scheme base)           |4.2.2. Binding constructs||
|let*                          |rapid-scheme    |(scheme base)           |4.2.2. Binding constructs||
|letrec                        |rapid-scheme    |(scheme base)           |4.2.2. Binding constructs||
|letrec*                       |rapid-scheme    |(scheme base)           |4.2.2. Binding constructs||
|let-values                    |rapid-scheme    |(scheme base)           |4.2.2. Binding constructs||
|let*-values                   |rapid-scheme    |(scheme base)           |4.2.2. Binding constructs||
|begin                         |rapid-scheme    |(scheme base)           |4.2.3. Sequencing       ||
|do                            |BAD             |(scheme base)           |4.2.4. Iteration        ||
|delay                         |rapid-scheme    |(scheme lazy)           |4.2.5. Delayed evaluation||
|delay-force                   |rapid-scheme    |(scheme lazy)           |4.2.5. Delayed evaluation||
|force                         |rapid-scheme    |(scheme lazy)           |4.2.5. Delayed evaluation||
|promise?                      |BAD             |(scheme lazy)           |4.2.5. Delayed evaluation||
|make-promise                  |rapid-scheme    |(scheme lazy)           |4.2.5. Delayed evaluation||
|make-parameter                |rapid-scheme    |(scheme base)           |4.2.6. Dynamic bindings ||
|parameterize                  |rapid-scheme    |(scheme base)           |4.2.6. Dynamic bindings ||
|guard                         |rapid-scheme    |(scheme base)           |4.2.7. Exception handling||
|quasiquote                    |rapid-scheme    |(scheme base)           |4.2.8. Quasiquotation   ||
|unquote                       |rapid-scheme    |(scheme base)           |4.2.8. Quasiquotation   ||
|unquote-splicing              |rapid-scheme    |(scheme base)           |4.2.8. Quasiquotation   ||
|case-lambda                   |rapid-scheme    |(scheme case-lambda)    |4.2.9. Case-lambda      ||
|let-syntax                    |rapid-scheme    |(scheme base)           |4.3.1. Binding constructs for syntactic keywords||
|letrec-syntax                 |rapid-scheme    |(scheme base)           |4.3.1. Binding constructs for syntactic keywords||
|syntax-rules                  |rapid-scheme    |(scheme base)           |4.3.2. Pattern language ||
|_                             |rapid-scheme    |(scheme base)           |4.3.2. Pattern language ||
|...                           |rapid-scheme    |(scheme base)           |4.3.2. Pattern language ||
|syntax-error                  |rapid-scheme    |(scheme base)           |4.3.3. Signaling errors in macro transformers||
|define                        |rapid-scheme    |(scheme base)           |5.3. Variable definitions||
|define-values                 |rapid-scheme    |(scheme base)           |5.3.3. Multiple-value definitions||
|define-syntax                 |rapid-scheme    |(scheme base)           |5.4. Syntax definitions ||
|define-record-type            |rapid-scheme    |(scheme base)           |5.5. Record-type definitions||
|eqv?                          |maybe           |(scheme base)           |6.1. Equivalence predicates||
|eq?                           |maybe           |(scheme base)           |6.1. Equivalence predicates||
|equal?                        |implemented     |(scheme base)           |6.1. Equivalence predicates|Rapid-gambit runtime override (equal?:r7)|
|number?                       |maybe           |(scheme base)           |6.2.6. Numerical operations||
|complex?                      |maybe           |(scheme base)           |6.2.6. Numerical operations||
|real?                         |maybe           |(scheme base)           |6.2.6. Numerical operations||
|rational?                     |maybe           |(scheme base)           |6.2.6. Numerical operations||
|integer?                      |maybe           |(scheme base)           |6.2.6. Numerical operations||
|exact?                        |maybe           |(scheme base)           |6.2.6. Numerical operations||
|inexact?                      |maybe           |(scheme base)           |6.2.6. Numerical operations||
|exact-integer?                |maybe           |(scheme base)           |6.2.6. Numerical operations||
|finite?                       |maybe           |(scheme inexact)        |6.2.6. Numerical operations||
|infinite?                     |maybe           |(scheme inexact)        |6.2.6. Numerical operations||
|nan?                          |maybe           |(scheme inexact)        |6.2.6. Numerical operations||
|=                             |implemented     |(scheme base)           |6.2.6. Numerical operations||
|<                             |implemented     |(scheme base)           |6.2.6. Numerical operations||
|>                             |implemented     |(scheme base)           |6.2.6. Numerical operations||
|<=                            |implemented     |(scheme base)           |6.2.6. Numerical operations||
|>=                            |implemented     |(scheme base)           |6.2.6. Numerical operations||
|zero?                         |maybe           |(scheme base)           |6.2.6. Numerical operations||
|positive?                     |maybe           |(scheme base)           |6.2.6. Numerical operations||
|negative?                     |maybe           |(scheme base)           |6.2.6. Numerical operations||
|odd?                          |maybe           |(scheme base)           |6.2.6. Numerical operations||
|even?                         |maybe           |(scheme base)           |6.2.6. Numerical operations||
|max                           |maybe           |(scheme base)           |6.2.6. Numerical operations||
|min                           |maybe           |(scheme base)           |6.2.6. Numerical operations||
|+                             |implemented     |(scheme base)           |6.2.6. Numerical operations||
|*                             |implemented     |(scheme base)           |6.2.6. Numerical operations||
|-                             |implemented     |(scheme base)           |6.2.6. Numerical operations||
|/                             |maybe           |(scheme base)           |6.2.6. Numerical operations||
|abs                           |maybe           |(scheme base)           |6.2.6. Numerical operations||
|floor/                        |NOTYET          |(scheme base)           |6.2.6. Numerical operations||
|floor-quotient                |NOTYET          |(scheme base)           |6.2.6. Numerical operations||
|floor-remainder               |NOTYET          |(scheme base)           |6.2.6. Numerical operations||
|truncate/                     |NOTYET          |(scheme base)           |6.2.6. Numerical operations||
|truncate-quotient             |NOTYET          |(scheme base)           |6.2.6. Numerical operations||
|truncate-remainder            |NOTYET          |(scheme base)           |6.2.6. Numerical operations||
|quotient                      |maybe           |(scheme base)           |6.2.6. Numerical operations||
|remainder                     |maybe           |(scheme base)           |6.2.6. Numerical operations||
|modulo                        |maybe           |(scheme base)           |6.2.6. Numerical operations||
|gcd                           |maybe           |(scheme base)           |6.2.6. Numerical operations||
|lcm                           |maybe           |(scheme base)           |6.2.6. Numerical operations||
|numerator                     |maybe           |(scheme base)           |6.2.6. Numerical operations||
|denominator                   |maybe           |(scheme base)           |6.2.6. Numerical operations||
|floor                         |maybe           |(scheme base)           |6.2.6. Numerical operations||
|ceiling                       |maybe           |(scheme base)           |6.2.6. Numerical operations||
|truncate                      |maybe           |(scheme base)           |6.2.6. Numerical operations||
|round                         |maybe           |(scheme base)           |6.2.6. Numerical operations||
|rationalize                   |maybe           |(scheme base)           |6.2.6. Numerical operations||
|exp                           |maybe           |(scheme inexact)        |6.2.6. Numerical operations||
|log                           |maybe           |(scheme inexact)        |6.2.6. Numerical operations||
|sin                           |maybe           |(scheme inexact)        |6.2.6. Numerical operations||
|cos                           |maybe           |(scheme inexact)        |6.2.6. Numerical operations||
|tan                           |maybe           |(scheme inexact)        |6.2.6. Numerical operations||
|asin                          |maybe           |(scheme inexact)        |6.2.6. Numerical operations||
|acos                          |maybe           |(scheme inexact)        |6.2.6. Numerical operations||
|atan                          |maybe           |(scheme inexact)        |6.2.6. Numerical operations||
|square                        |maybe           |(scheme base)           |6.2.6. Numerical operations||
|sqrt                          |maybe           |(scheme inexact)        |6.2.6. Numerical operations||
|exact-integer-sqrt            |NOTYET          |(scheme base)           |6.2.6. Numerical operations||
|expt                          |maybe           |(scheme base)           |6.2.6. Numerical operations||
|make-rectangular              |maybe           |(scheme complex)        |6.2.6. Numerical operations||
|make-polar                    |maybe           |(scheme complex)        |6.2.6. Numerical operations||
|real-part                     |maybe           |(scheme complex)        |6.2.6. Numerical operations||
|imag-part                     |maybe           |(scheme complex)        |6.2.6. Numerical operations||
|magnitude                     |maybe           |(scheme complex)        |6.2.6. Numerical operations||
|angle                         |maybe           |(scheme complex)        |6.2.6. Numerical operations||
|inexact                       |maybe           |(scheme base)           |6.2.6. Numerical operations||
|exact                         |maybe           |(scheme base)           |6.2.6. Numerical operations||
|number->string                |maybe           |(scheme base)           |6.2.7. Numerical input and output||
|string->number                |maybe           |(scheme base)           |6.2.7. Numerical input and output||
|not                           |maybe           |(scheme base)           |6.3. Booleans           ||
|boolean?                      |maybe           |(scheme base)           |6.3. Booleans           ||
|boolean=?                     |maybe           |(scheme base)           |6.3. Booleans           ||
|pair?                         |implemented     |(scheme base)           |6.4. Pairs and lists    ||
|cons                          |implemented     |(scheme base)           |6.4. Pairs and lists    ||
|car                           |implemented     |(scheme base)           |6.4. Pairs and lists    ||
|cdr                           |implemented     |(scheme base)           |6.4. Pairs and lists    ||
|set-car!                      |implemented     |(scheme base)           |6.4. Pairs and lists    ||
|set-cdr!                      |implemented     |(scheme base)           |6.4. Pairs and lists    ||
|caar                          |implemented     |(scheme base)           |6.4. Pairs and lists    ||
|cadr                          |implemented     |(scheme base)           |6.4. Pairs and lists    ||
|cdar                          |maybe           |(scheme base)           |6.4. Pairs and lists    ||
|cddr                          |implemented     |(scheme base)           |6.4. Pairs and lists    ||
|caaaar                        |implemented     |(scheme cxr)            |6.4. Pairs and lists    ||
|caaadr                        |implemented     |(scheme cxr)            |6.4. Pairs and lists    ||
|caaar                         |implemented     |(scheme cxr)            |6.4. Pairs and lists    ||
|caadar                        |implemented     |(scheme cxr)            |6.4. Pairs and lists    ||
|caaddr                        |implemented     |(scheme cxr)            |6.4. Pairs and lists    ||
|caadr                         |implemented     |(scheme cxr)            |6.4. Pairs and lists    ||
|cadaar                        |implemented     |(scheme cxr)            |6.4. Pairs and lists    ||
|cadadr                        |implemented     |(scheme cxr)            |6.4. Pairs and lists    ||
|cadar                         |implemented     |(scheme cxr)            |6.4. Pairs and lists    ||
|caddar                        |implemented     |(scheme cxr)            |6.4. Pairs and lists    ||
|cadddr                        |implemented     |(scheme cxr)            |6.4. Pairs and lists    ||
|caddr                         |implemented     |(scheme cxr)            |6.4. Pairs and lists    ||
|cdaaar                        |implemented     |(scheme cxr)            |6.4. Pairs and lists    ||
|cdaadr                        |implemented     |(scheme cxr)            |6.4. Pairs and lists    ||
|cdaar                         |implemented     |(scheme cxr)            |6.4. Pairs and lists    ||
|cdadar                        |implemented     |(scheme cxr)            |6.4. Pairs and lists    ||
|cdaddr                        |implemented     |(scheme cxr)            |6.4. Pairs and lists    ||
|cdadr                         |implemented     |(scheme cxr)            |6.4. Pairs and lists    ||
|cddaar                        |implemented     |(scheme cxr)            |6.4. Pairs and lists    ||
|cddadr                        |implemented     |(scheme cxr)            |6.4. Pairs and lists    ||
|cddar                         |implemented     |(scheme cxr)            |6.4. Pairs and lists    ||
|cdddar                        |implemented     |(scheme cxr)            |6.4. Pairs and lists    ||
|cddddr                        |implemented     |(scheme cxr)            |6.4. Pairs and lists    ||
|cdddr                         |implemented     |(scheme cxr)            |6.4. Pairs and lists    ||
|null?                         |implemented     |(scheme base)           |6.4. Pairs and lists    ||
|list?                         |implemented     |(scheme base)           |6.4. Pairs and lists    ||
|make-list                     |NOTYET          |(scheme base)           |6.4. Pairs and lists    ||
|list                          |maybe           |(scheme base)           |6.4. Pairs and lists    ||
|length                        |maybe           |(scheme base)           |6.4. Pairs and lists    ||
|append                        |maybe           |(scheme base)           |6.4. Pairs and lists    ||
|reverse                       |maybe           |(scheme base)           |6.4. Pairs and lists    ||
|list-tail                     |maybe           |(scheme base)           |6.4. Pairs and lists    ||
|list-ref                      |maybe           |(scheme base)           |6.4. Pairs and lists    ||
|list-set!                     |NOTYET          |(scheme base)           |6.4. Pairs and lists    ||
|memq                          |maybe           |(scheme base)           |6.4. Pairs and lists    ||
|memv                          |maybe           |(scheme base)           |6.4. Pairs and lists    ||
|member                        |maybe           |(scheme base)           |6.4. Pairs and lists    ||
|assq                          |maybe           |(scheme base)           |6.4. Pairs and lists    ||
|assv                          |maybe           |(scheme base)           |6.4. Pairs and lists    ||
|assoc                         |maybe           |(scheme base)           |6.4. Pairs and lists    ||
|list-copy                     |NOTYET          |(scheme base)           |6.4. Pairs and lists    ||
|symbol?                       |maybe           |(scheme base)           |6.5. Symbols            ||
|symbol=?                      |maybe           |(scheme base)           |6.5. Symbols            ||
|symbol->string                |maybe           |(scheme base)           |6.5. Symbols            ||
|string->symbol                |maybe           |(scheme base)           |6.5. Symbols            ||
|char?                         |maybe           |(scheme base)           |6.6. Characters         ||
|char=?                        |maybe           |(scheme base)           |6.6. Characters         ||
|char<?                        |maybe           |(scheme base)           |6.6. Characters         ||
|char>?                        |maybe           |(scheme base)           |6.6. Characters         ||
|char<=?                       |maybe           |(scheme base)           |6.6. Characters         ||
|char>=?                       |maybe           |(scheme base)           |6.6. Characters         ||
|char-ci=?                     |maybe           |(scheme char)           |6.6. Characters         ||
|char-ci<?                     |maybe           |(scheme char)           |6.6. Characters         ||
|char-ci>?                     |maybe           |(scheme char)           |6.6. Characters         ||
|char-ci<=?                    |maybe           |(scheme char)           |6.6. Characters         ||
|char-ci>=?                    |maybe           |(scheme char)           |6.6. Characters         ||
|char-alphabetic?              |maybe           |(scheme char)           |6.6. Characters         ||
|char-numeric?                 |maybe           |(scheme char)           |6.6. Characters         ||
|char-whitespace?              |maybe           |(scheme char)           |6.6. Characters         ||
|char-upper-case?              |maybe           |(scheme char)           |6.6. Characters         ||
|char-lower-case?              |maybe           |(scheme char)           |6.6. Characters         ||
|digit-value                   |NOTYET          |(scheme char)           |6.6. Characters         ||
|char->integer                 |maybe           |(scheme base)           |6.6. Characters         ||
|integer->char                 |maybe           |(scheme base)           |6.6. Characters         ||
|char-upcase                   |maybe           |(scheme char)           |6.6. Characters         ||
|char-downcase                 |maybe           |(scheme char)           |6.6. Characters         ||
|char-foldcase                 |BAD             |(scheme char)           |6.6. Characters         |[Issue 2](https://github.com/okuoku/rapid-gambit/issues/2)|
|string?                       |maybe           |(scheme base)           |6.7. Strings            ||
|make-string                   |maybe           |(scheme base)           |6.7. Strings            ||
|string                        |maybe           |(scheme base)           |6.7. Strings            ||
|string-length                 |maybe           |(scheme base)           |6.7. Strings            ||
|string-ref                    |maybe           |(scheme base)           |6.7. Strings            ||
|string-set!                   |maybe           |(scheme base)           |6.7. Strings            ||
|string=?                      |maybe           |(scheme base)           |6.7. Strings            ||
|string-ci=?                   |maybe           |(scheme char)           |6.7. Strings            ||
|string<?                      |maybe           |(scheme base)           |6.7. Strings            ||
|string-ci<?                   |maybe           |(scheme char)           |6.7. Strings            ||
|string>?                      |maybe           |(scheme base)           |6.7. Strings            ||
|string-ci>?                   |maybe           |(scheme char)           |6.7. Strings            ||
|string<=?                     |maybe           |(scheme base)           |6.7. Strings            ||
|string>=?                     |maybe           |(scheme base)           |6.7. Strings            ||
|string-ci<=?                  |maybe           |(scheme char)           |6.7. Strings            ||
|string-ci>=?                  |maybe           |(scheme char)           |6.7. Strings            ||
|string-upcase                 |NOTYET          |(scheme char)           |6.7. Strings            ||
|string-downcase               |NOTYET          |(scheme char)           |6.7. Strings            ||
|string-foldcase               |BAD             |(scheme char)           |6.7. Strings            |[Issue 2](https://github.com/okuoku/rapid-gambit/issues/2)|
|substring                     |maybe           |(scheme base)           |6.7. Strings            ||
|string-append                 |maybe           |(scheme base)           |6.7. Strings            ||
|string->list                  |maybe           |(scheme base)           |6.7. Strings            ||
|list->string                  |maybe           |(scheme base)           |6.7. Strings            ||
|string-copy                   |implemented     |(scheme base)           |6.7. Strings            |Rapid-gambit runtime override (string-copy:r7)|
|string-copy!                  |NOTYET          |(scheme base)           |6.7. Strings            ||
|string-fill!                  |maybe           |(scheme base)           |6.7. Strings            ||
|vector?                       |maybe           |(scheme base)           |6.8. Vectors            ||
|make-vector                   |maybe           |(scheme base)           |6.8. Vectors            ||
|vector                        |maybe           |(scheme base)           |6.8. Vectors            ||
|vector-length                 |maybe           |(scheme base)           |6.8. Vectors            ||
|vector-ref                    |maybe           |(scheme base)           |6.8. Vectors            ||
|vector-set!                   |maybe           |(scheme base)           |6.8. Vectors            ||
|vector->list                  |maybe           |(scheme base)           |6.8. Vectors            ||
|list->vector                  |maybe           |(scheme base)           |6.8. Vectors            ||
|vector->string                |NOTYET          |(scheme base)           |6.8. Vectors            ||
|string->vector                |NOTYET          |(scheme base)           |6.8. Vectors            ||
|vector-copy                   |maybe           |(scheme base)           |6.8. Vectors            ||
|vector-copy!                  |NOTYET          |(scheme base)           |6.8. Vectors            ||
|vector-append                 |maybe           |(scheme base)           |6.8. Vectors            ||
|vector-fill!                  |maybe           |(scheme base)           |6.8. Vectors            ||
|bytevector?                   |maybe           |(scheme base)           |6.9. Bytevectors        ||
|make-bytevector               |maybe           |(scheme base)           |6.9. Bytevectors        ||
|bytevector                    |maybe           |(scheme base)           |6.9. Bytevectors        ||
|bytevector-length             |maybe           |(scheme base)           |6.9. Bytevectors        ||
|bytevector-u8-ref             |maybe           |(scheme base)           |6.9. Bytevectors        ||
|bytevector-u8-set!            |maybe           |(scheme base)           |6.9. Bytevectors        ||
|bytevector-copy               |maybe           |(scheme base)           |6.9. Bytevectors        ||
|bytevector-copy!              |NOTYET          |(scheme base)           |6.9. Bytevectors        ||
|bytevector-append             |maybe           |(scheme base)           |6.9. Bytevectors        ||
|utf8->string                  |maybe           |(scheme base)           |6.9. Bytevectors        ||
|string->utf8                  |maybe           |(scheme base)           |6.9. Bytevectors        ||
|procedure?                    |maybe           |(scheme base)           |6.10. Control features  ||
|apply                         |maybe           |(scheme base)           |6.10. Control features  ||
|map                           |maybe           |(scheme base)           |6.10. Control features  ||
|string-map                    |maybe           |(scheme base)           |6.10. Control features  ||
|vector-map                    |maybe           |(scheme base)           |6.10. Control features  ||
|for-each                      |maybe           |(scheme base)           |6.10. Control features  ||
|string-for-each               |maybe           |(scheme base)           |6.10. Control features  ||
|vector-for-each               |maybe           |(scheme base)           |6.10. Control features  ||
|call-with-current-continuation|rapid-scheme    |(scheme base)           |6.10. Control features  ||
|call/cc                       |maybe           |(scheme base)           |6.10. Control features  ||
|values                        |rapid-scheme    |(scheme base)           |6.10. Control features  ||
|call-with-values              |rapid-scheme    |(scheme base)           |6.10. Control features  ||
|dynamic-wind                  |maybe           |(scheme base)           |6.10. Control features  ||
|with-exception-handler        |implemented     |(scheme base)           |6.11. Exceptions        |Rapid-gambit runtime override (with-exception-handler:r7)|
|raise                         |implemented     |(scheme base)           |6.11. Exceptions        |Rapid-gambit runtime override (raise:r7)|
|raise-continuable             |maybe           |(scheme base)           |6.11. Exceptions        ||
|error                         |maybe           |(scheme base)           |6.11. Exceptions        ||
|error-object?                 |maybe           |(scheme base)           |6.11. Exceptions        ||
|error-object-message          |maybe           |(scheme base)           |6.11. Exceptions        ||
|error-object-irritants        |maybe           |(scheme base)           |6.11. Exceptions        ||
|read-error?                   |rapid-scheme    |(scheme base)           |6.11. Exceptions        ||
|file-error?                   |maybe           |(scheme base)           |6.11. Exceptions        ||
|environment                   |BAD             |(scheme eval)           |6.12. Environments and evaluation|[Issue 4](https://github.com/okuoku/rapid-gambit/issues/4)|
|scheme-report-environment     |BAD             |Unknown                 |6.12. Environments and evaluation|[Issue 4](https://github.com/okuoku/rapid-gambit/issues/4)|
|null-environment              |BAD             |Unknown                 |6.12. Environments and evaluation|[Issue 4](https://github.com/okuoku/rapid-gambit/issues/4)|
|interaction-environment       |BAD             |Unknown                 |6.12. Environments and evaluation|[Issue 4](https://github.com/okuoku/rapid-gambit/issues/4)|
|eval                          |implemented     |(scheme eval)           |6.12. Environments and evaluation|Rapid-gambit runtime override (eval:r7)|
|call-with-port                |maybe           |(scheme base)           |6.13.1. Ports           ||
|call-with-input-file          |rapid-scheme    |(scheme file)           |6.13.1. Ports           ||
|call-with-output-file         |rapid-scheme    |(scheme file)           |6.13.1. Ports           ||
|input-port?                   |maybe           |(scheme base)           |6.13.1. Ports           ||
|output-port?                  |maybe           |(scheme base)           |6.13.1. Ports           ||
|textual-port?                 |NOTYET          |(scheme base)           |6.13.1. Ports           ||
|binary-port?                  |NOTYET          |(scheme base)           |6.13.1. Ports           ||
|port?                         |maybe           |(scheme base)           |6.13.1. Ports           ||
|input-port-open?              |NOTYET          |(scheme base)           |6.13.1. Ports           ||
|output-port-open?             |NOTYET          |(scheme base)           |6.13.1. Ports           ||
|current-input-port            |maybe           |(scheme base)           |6.13.1. Ports           ||
|current-output-port           |maybe           |(scheme base)           |6.13.1. Ports           ||
|current-error-port            |maybe           |(scheme base)           |6.13.1. Ports           ||
|with-input-from-file          |rapid-scheme    |(scheme file)           |6.13.1. Ports           ||
|with-output-to-file           |rapid-scheme    |(scheme file)           |6.13.1. Ports           ||
|open-input-file               |maybe           |(scheme file)           |6.13.1. Ports           ||
|open-binary-input-file        |NOTYET          |(scheme file)           |6.13.1. Ports           ||
|open-output-file              |maybe           |(scheme file)           |6.13.1. Ports           ||
|open-binary-output-file       |NOTYET          |(scheme file)           |6.13.1. Ports           ||
|close-port                    |maybe           |(scheme base)           |6.13.1. Ports           ||
|close-input-port              |maybe           |(scheme base)           |6.13.1. Ports           ||
|close-output-port             |maybe           |(scheme base)           |6.13.1. Ports           ||
|open-input-string             |maybe           |(scheme base)           |6.13.1. Ports           ||
|open-output-string            |maybe           |(scheme base)           |6.13.1. Ports           ||
|get-output-string             |maybe           |(scheme base)           |6.13.1. Ports           ||
|open-input-bytevector         |NOTYET          |(scheme base)           |6.13.1. Ports           ||
|open-output-bytevector        |NOTYET          |(scheme base)           |6.13.1. Ports           ||
|get-output-bytevector         |NOTYET          |(scheme base)           |6.13.1. Ports           ||
|read                          |rapid-scheme    |(scheme read)           |6.13.2. Input           ||
|read-char                     |maybe           |(scheme base)           |6.13.2. Input           ||
|peek-char                     |maybe           |(scheme base)           |6.13.2. Input           ||
|read-line                     |maybe           |(scheme base)           |6.13.2. Input           ||
|eof-object?                   |maybe           |(scheme base)           |6.13.2. Input           ||
|eof-object                    |maybe           |(scheme base)           |6.13.2. Input           ||
|char-ready?                   |maybe           |(scheme base)           |6.13.2. Input           ||
|read-string                   |NOTYET          |(scheme base)           |6.13.2. Input           ||
|read-u8                       |maybe           |(scheme base)           |6.13.2. Input           ||
|peek-u8                       |NOTYET          |(scheme base)           |6.13.2. Input           ||
|u8-ready?                     |NOTYET          |(scheme base)           |6.13.2. Input           ||
|read-bytevector               |NOTYET          |(scheme base)           |6.13.2. Input           ||
|read-bytevector!              |NOTYET          |(scheme base)           |6.13.2. Input           ||
|write                         |maybe           |(scheme write)          |6.13.3. Output          ||
|write-shared                  |maybe           |(scheme write)          |6.13.3. Output          ||
|write-simple                  |maybe           |(scheme write)          |6.13.3. Output          ||
|display                       |maybe           |(scheme write)          |6.13.3. Output          ||
|newline                       |maybe           |(scheme base)           |6.13.3. Output          ||
|write-char                    |maybe           |(scheme base)           |6.13.3. Output          ||
|write-string                  |maybe           |(scheme base)           |6.13.3. Output          ||
|write-u8                      |maybe           |(scheme base)           |6.13.3. Output          ||
|write-bytevector              |NOTYET          |(scheme base)           |6.13.3. Output          ||
|flush-output-port             |maybe           |(scheme base)           |6.13.3. Output          ||
|load                          |BAD             |(scheme load)           |6.14. System interface  |[Issue 4](https://github.com/okuoku/rapid-gambit/issues/4)|
|file-exists?                  |maybe           |(scheme file)           |6.14. System interface  ||
|delete-file                   |maybe           |(scheme file)           |6.14. System interface  ||
|command-line                  |maybe           |(scheme process-context)|6.14. System interface  ||
|exit                          |implemented     |(scheme process-context)|6.14. System interface  |Rapid-gambit runtime override (exit:r7)|
|emergency-exit                |maybe           |(scheme process-context)|6.14. System interface  ||
|get-environment-variable      |maybe           |(scheme process-context)|6.14. System interface  ||
|get-environment-variables     |maybe           |(scheme process-context)|6.14. System interface  ||
|current-second                |NOTYET          |(scheme time)           |6.14. System interface  ||
|current-jiffy                 |NOTYET          |(scheme time)           |6.14. System interface  ||
|jiffies-per-second            |NOTYET          |(scheme time)           |6.14. System interface  ||
|features                      |rapid-scheme    |(scheme base)           |6.14. System interface  ||
