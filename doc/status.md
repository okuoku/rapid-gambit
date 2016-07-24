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
|*                             |implemented     |(scheme base)           |6.2.6. Numerical operations||
|+                             |implemented     |(scheme base)           |6.2.6. Numerical operations||
|-                             |implemented     |(scheme base)           |6.2.6. Numerical operations||
|...                           |rapid-scheme    |(scheme base)           |4.3.2. Pattern language ||
|/                             |maybe           |(scheme base)           |6.2.6. Numerical operations||
|<                             |implemented     |(scheme base)           |6.2.6. Numerical operations||
|<=                            |implemented     |(scheme base)           |6.2.6. Numerical operations||
|=                             |implemented     |(scheme base)           |6.2.6. Numerical operations||
|=>                            |rapid-scheme    |(scheme base)           |4.2.1. Conditionals     ||
|>                             |implemented     |(scheme base)           |6.2.6. Numerical operations||
|>=                            |implemented     |(scheme base)           |6.2.6. Numerical operations||
|_                             |rapid-scheme    |(scheme base)           |4.3.2. Pattern language ||
|abs                           |maybe           |(scheme base)           |6.2.6. Numerical operations||
|and                           |rapid-scheme    |(scheme base)           |4.2.1. Conditionals     ||
|append                        |maybe           |(scheme base)           |6.4. Pairs and lists    ||
|apply                         |maybe           |(scheme base)           |6.10. Control features  ||
|assoc                         |maybe           |(scheme base)           |6.4. Pairs and lists    ||
|assq                          |maybe           |(scheme base)           |6.4. Pairs and lists    ||
|assv                          |maybe           |(scheme base)           |6.4. Pairs and lists    ||
|begin                         |rapid-scheme    |(scheme base)           |4.2.3. Sequencing       ||
|binary-port?                  |NOTYET          |(scheme base)           |6.13.1. Ports           ||
|boolean=?                     |maybe           |(scheme base)           |6.3. Booleans           ||
|boolean?                      |maybe           |(scheme base)           |6.3. Booleans           ||
|bytevector                    |maybe           |(scheme base)           |6.9. Bytevectors        ||
|bytevector-append             |maybe           |(scheme base)           |6.9. Bytevectors        ||
|bytevector-copy               |maybe           |(scheme base)           |6.9. Bytevectors        ||
|bytevector-copy!              |NOTYET          |(scheme base)           |6.9. Bytevectors        ||
|bytevector-length             |maybe           |(scheme base)           |6.9. Bytevectors        ||
|bytevector-u8-ref             |maybe           |(scheme base)           |6.9. Bytevectors        ||
|bytevector-u8-set!            |maybe           |(scheme base)           |6.9. Bytevectors        ||
|bytevector?                   |maybe           |(scheme base)           |6.9. Bytevectors        ||
|caar                          |implemented     |(scheme base)           |6.4. Pairs and lists    ||
|cadr                          |implemented     |(scheme base)           |6.4. Pairs and lists    ||
|call-with-current-continuation|rapid-scheme    |(scheme base)           |6.10. Control features  ||
|call-with-port                |maybe           |(scheme base)           |6.13.1. Ports           ||
|call-with-values              |rapid-scheme    |(scheme base)           |6.10. Control features  ||
|call/cc                       |maybe           |(scheme base)           |6.10. Control features  ||
|car                           |implemented     |(scheme base)           |6.4. Pairs and lists    ||
|case                          |rapid-scheme    |(scheme base)           |4.2.1. Conditionals     ||
|cdar                          |maybe           |(scheme base)           |6.4. Pairs and lists    ||
|cddr                          |implemented     |(scheme base)           |6.4. Pairs and lists    ||
|cdr                           |implemented     |(scheme base)           |6.4. Pairs and lists    ||
|ceiling                       |maybe           |(scheme base)           |6.2.6. Numerical operations||
|char->integer                 |maybe           |(scheme base)           |6.6. Characters         ||
|char-ready?                   |maybe           |(scheme base)           |6.13.2. Input           ||
|char<=?                       |maybe           |(scheme base)           |6.6. Characters         ||
|char<?                        |maybe           |(scheme base)           |6.6. Characters         ||
|char=?                        |maybe           |(scheme base)           |6.6. Characters         ||
|char>=?                       |maybe           |(scheme base)           |6.6. Characters         ||
|char>?                        |maybe           |(scheme base)           |6.6. Characters         ||
|char?                         |maybe           |(scheme base)           |6.6. Characters         ||
|close-input-port              |maybe           |(scheme base)           |6.13.1. Ports           ||
|close-output-port             |maybe           |(scheme base)           |6.13.1. Ports           ||
|close-port                    |maybe           |(scheme base)           |6.13.1. Ports           ||
|complex?                      |maybe           |(scheme base)           |6.2.6. Numerical operations||
|cond                          |rapid-scheme    |(scheme base)           |4.2.1. Conditionals     ||
|cond-expand                   |rapid-scheme    |(scheme base)           |4.2.1. Conditionals     ||
|cons                          |implemented     |(scheme base)           |6.4. Pairs and lists    ||
|current-error-port            |maybe           |(scheme base)           |6.13.1. Ports           ||
|current-input-port            |maybe           |(scheme base)           |6.13.1. Ports           ||
|current-output-port           |maybe           |(scheme base)           |6.13.1. Ports           ||
|define                        |rapid-scheme    |(scheme base)           |5.3. Variable definitions||
|define-record-type            |rapid-scheme    |(scheme base)           |5.5. Record-type definitions||
|define-syntax                 |rapid-scheme    |(scheme base)           |5.4. Syntax definitions ||
|define-values                 |rapid-scheme    |(scheme base)           |5.3.3. Multiple-value definitions||
|denominator                   |maybe           |(scheme base)           |6.2.6. Numerical operations||
|do                            |BAD             |(scheme base)           |4.2.4. Iteration        ||
|dynamic-wind                  |maybe           |(scheme base)           |6.10. Control features  ||
|else                          |BAD             |(scheme base)           |4.2.1. Conditionals     ||
|eof-object                    |maybe           |(scheme base)           |6.13.2. Input           ||
|eof-object?                   |maybe           |(scheme base)           |6.13.2. Input           ||
|eq?                           |maybe           |(scheme base)           |6.1. Equivalence predicates||
|equal?                        |implemented     |(scheme base)           |6.1. Equivalence predicates|Rapid-gambit runtime override (equal?:r7)|
|eqv?                          |maybe           |(scheme base)           |6.1. Equivalence predicates||
|error                         |maybe           |(scheme base)           |6.11. Exceptions        ||
|error-object-irritants        |maybe           |(scheme base)           |6.11. Exceptions        ||
|error-object-message          |maybe           |(scheme base)           |6.11. Exceptions        ||
|error-object?                 |maybe           |(scheme base)           |6.11. Exceptions        ||
|even?                         |maybe           |(scheme base)           |6.2.6. Numerical operations||
|exact                         |maybe           |(scheme base)           |6.2.6. Numerical operations||
|exact-integer-sqrt            |NOTYET          |(scheme base)           |6.2.6. Numerical operations||
|exact-integer?                |maybe           |(scheme base)           |6.2.6. Numerical operations||
|exact?                        |maybe           |(scheme base)           |6.2.6. Numerical operations||
|expt                          |maybe           |(scheme base)           |6.2.6. Numerical operations||
|features                      |rapid-scheme    |(scheme base)           |6.14. System interface  ||
|file-error?                   |maybe           |(scheme base)           |6.11. Exceptions        ||
|floor                         |maybe           |(scheme base)           |6.2.6. Numerical operations||
|floor-quotient                |NOTYET          |(scheme base)           |6.2.6. Numerical operations||
|floor-remainder               |NOTYET          |(scheme base)           |6.2.6. Numerical operations||
|floor/                        |NOTYET          |(scheme base)           |6.2.6. Numerical operations||
|flush-output-port             |maybe           |(scheme base)           |6.13.3. Output          ||
|for-each                      |maybe           |(scheme base)           |6.10. Control features  ||
|gcd                           |maybe           |(scheme base)           |6.2.6. Numerical operations||
|get-output-bytevector         |NOTYET          |(scheme base)           |6.13.1. Ports           ||
|get-output-string             |maybe           |(scheme base)           |6.13.1. Ports           ||
|guard                         |rapid-scheme    |(scheme base)           |4.2.7. Exception handling||
|if                            |rapid-scheme    |(scheme base)           |4.1.5. Conditionals     ||
|include                       |rapid-scheme    |(scheme base)           |4.1.7. Inclusion        ||
|include-ci                    |rapid-scheme    |(scheme base)           |4.1.7. Inclusion        ||
|inexact                       |maybe           |(scheme base)           |6.2.6. Numerical operations||
|inexact?                      |maybe           |(scheme base)           |6.2.6. Numerical operations||
|input-port-open?              |NOTYET          |(scheme base)           |6.13.1. Ports           ||
|input-port?                   |maybe           |(scheme base)           |6.13.1. Ports           ||
|integer->char                 |maybe           |(scheme base)           |6.6. Characters         ||
|integer?                      |maybe           |(scheme base)           |6.2.6. Numerical operations||
|lambda                        |rapid-scheme    |(scheme base)           |4.1.4. Procedures       ||
|lcm                           |maybe           |(scheme base)           |6.2.6. Numerical operations||
|length                        |maybe           |(scheme base)           |6.4. Pairs and lists    ||
|let                           |rapid-scheme    |(scheme base)           |4.2.2. Binding constructs||
|let*                          |rapid-scheme    |(scheme base)           |4.2.2. Binding constructs||
|let*-values                   |rapid-scheme    |(scheme base)           |4.2.2. Binding constructs||
|let-syntax                    |rapid-scheme    |(scheme base)           |4.3.1. Binding constructs for syntactic keywords||
|let-values                    |rapid-scheme    |(scheme base)           |4.2.2. Binding constructs||
|letrec                        |rapid-scheme    |(scheme base)           |4.2.2. Binding constructs||
|letrec*                       |rapid-scheme    |(scheme base)           |4.2.2. Binding constructs||
|letrec-syntax                 |rapid-scheme    |(scheme base)           |4.3.1. Binding constructs for syntactic keywords||
|list                          |maybe           |(scheme base)           |6.4. Pairs and lists    ||
|list->string                  |maybe           |(scheme base)           |6.7. Strings            ||
|list->vector                  |maybe           |(scheme base)           |6.8. Vectors            ||
|list-copy                     |NOTYET          |(scheme base)           |6.4. Pairs and lists    ||
|list-ref                      |maybe           |(scheme base)           |6.4. Pairs and lists    ||
|list-set!                     |NOTYET          |(scheme base)           |6.4. Pairs and lists    ||
|list-tail                     |maybe           |(scheme base)           |6.4. Pairs and lists    ||
|list?                         |implemented     |(scheme base)           |6.4. Pairs and lists    ||
|make-bytevector               |maybe           |(scheme base)           |6.9. Bytevectors        ||
|make-list                     |NOTYET          |(scheme base)           |6.4. Pairs and lists    ||
|make-parameter                |rapid-scheme    |(scheme base)           |4.2.6. Dynamic bindings ||
|make-string                   |maybe           |(scheme base)           |6.7. Strings            ||
|make-vector                   |maybe           |(scheme base)           |6.8. Vectors            ||
|map                           |maybe           |(scheme base)           |6.10. Control features  ||
|max                           |maybe           |(scheme base)           |6.2.6. Numerical operations||
|member                        |maybe           |(scheme base)           |6.4. Pairs and lists    ||
|memq                          |maybe           |(scheme base)           |6.4. Pairs and lists    ||
|memv                          |maybe           |(scheme base)           |6.4. Pairs and lists    ||
|min                           |maybe           |(scheme base)           |6.2.6. Numerical operations||
|modulo                        |maybe           |(scheme base)           |6.2.6. Numerical operations||
|negative?                     |maybe           |(scheme base)           |6.2.6. Numerical operations||
|newline                       |maybe           |(scheme base)           |6.13.3. Output          ||
|not                           |maybe           |(scheme base)           |6.3. Booleans           ||
|null?                         |implemented     |(scheme base)           |6.4. Pairs and lists    ||
|number->string                |maybe           |(scheme base)           |6.2.7. Numerical input and output||
|number?                       |maybe           |(scheme base)           |6.2.6. Numerical operations||
|numerator                     |maybe           |(scheme base)           |6.2.6. Numerical operations||
|odd?                          |maybe           |(scheme base)           |6.2.6. Numerical operations||
|open-input-bytevector         |NOTYET          |(scheme base)           |6.13.1. Ports           ||
|open-input-string             |maybe           |(scheme base)           |6.13.1. Ports           ||
|open-output-bytevector        |NOTYET          |(scheme base)           |6.13.1. Ports           ||
|open-output-string            |maybe           |(scheme base)           |6.13.1. Ports           ||
|or                            |rapid-scheme    |(scheme base)           |4.2.1. Conditionals     ||
|output-port-open?             |NOTYET          |(scheme base)           |6.13.1. Ports           ||
|output-port?                  |maybe           |(scheme base)           |6.13.1. Ports           ||
|pair?                         |implemented     |(scheme base)           |6.4. Pairs and lists    ||
|parameterize                  |rapid-scheme    |(scheme base)           |4.2.6. Dynamic bindings ||
|peek-char                     |maybe           |(scheme base)           |6.13.2. Input           ||
|peek-u8                       |NOTYET          |(scheme base)           |6.13.2. Input           ||
|port?                         |maybe           |(scheme base)           |6.13.1. Ports           ||
|positive?                     |maybe           |(scheme base)           |6.2.6. Numerical operations||
|procedure?                    |maybe           |(scheme base)           |6.10. Control features  ||
|quasiquote                    |rapid-scheme    |(scheme base)           |4.2.8. Quasiquotation   ||
|quote                         |rapid-scheme    |(scheme base)           |4.1.2. Literal expressions||
|quotient                      |maybe           |(scheme base)           |6.2.6. Numerical operations||
|raise                         |implemented     |(scheme base)           |6.11. Exceptions        |Rapid-gambit runtime override (raise:r7)|
|raise-continuable             |maybe           |(scheme base)           |6.11. Exceptions        ||
|rational?                     |maybe           |(scheme base)           |6.2.6. Numerical operations||
|rationalize                   |maybe           |(scheme base)           |6.2.6. Numerical operations||
|read-bytevector               |NOTYET          |(scheme base)           |6.13.2. Input           ||
|read-bytevector!              |NOTYET          |(scheme base)           |6.13.2. Input           ||
|read-char                     |maybe           |(scheme base)           |6.13.2. Input           ||
|read-error?                   |rapid-scheme    |(scheme base)           |6.11. Exceptions        ||
|read-line                     |maybe           |(scheme base)           |6.13.2. Input           ||
|read-string                   |NOTYET          |(scheme base)           |6.13.2. Input           ||
|read-u8                       |maybe           |(scheme base)           |6.13.2. Input           ||
|real?                         |maybe           |(scheme base)           |6.2.6. Numerical operations||
|remainder                     |maybe           |(scheme base)           |6.2.6. Numerical operations||
|reverse                       |maybe           |(scheme base)           |6.4. Pairs and lists    ||
|round                         |maybe           |(scheme base)           |6.2.6. Numerical operations||
|set!                          |rapid-scheme    |(scheme base)           |4.1.6. Assignments      ||
|set-car!                      |implemented     |(scheme base)           |6.4. Pairs and lists    ||
|set-cdr!                      |implemented     |(scheme base)           |6.4. Pairs and lists    ||
|square                        |maybe           |(scheme base)           |6.2.6. Numerical operations||
|string                        |maybe           |(scheme base)           |6.7. Strings            ||
|string->list                  |maybe           |(scheme base)           |6.7. Strings            ||
|string->number                |maybe           |(scheme base)           |6.2.7. Numerical input and output||
|string->symbol                |maybe           |(scheme base)           |6.5. Symbols            ||
|string->utf8                  |maybe           |(scheme base)           |6.9. Bytevectors        ||
|string->vector                |NOTYET          |(scheme base)           |6.8. Vectors            ||
|string-append                 |maybe           |(scheme base)           |6.7. Strings            ||
|string-copy                   |implemented     |(scheme base)           |6.7. Strings            |Rapid-gambit runtime override (string-copy:r7)|
|string-copy!                  |NOTYET          |(scheme base)           |6.7. Strings            ||
|string-fill!                  |maybe           |(scheme base)           |6.7. Strings            ||
|string-for-each               |maybe           |(scheme base)           |6.10. Control features  ||
|string-length                 |maybe           |(scheme base)           |6.7. Strings            ||
|string-map                    |maybe           |(scheme base)           |6.10. Control features  ||
|string-ref                    |maybe           |(scheme base)           |6.7. Strings            ||
|string-set!                   |maybe           |(scheme base)           |6.7. Strings            ||
|string<=?                     |maybe           |(scheme base)           |6.7. Strings            ||
|string<?                      |maybe           |(scheme base)           |6.7. Strings            ||
|string=?                      |maybe           |(scheme base)           |6.7. Strings            ||
|string>=?                     |maybe           |(scheme base)           |6.7. Strings            ||
|string>?                      |maybe           |(scheme base)           |6.7. Strings            ||
|string?                       |maybe           |(scheme base)           |6.7. Strings            ||
|substring                     |maybe           |(scheme base)           |6.7. Strings            ||
|symbol->string                |maybe           |(scheme base)           |6.5. Symbols            ||
|symbol=?                      |maybe           |(scheme base)           |6.5. Symbols            ||
|symbol?                       |maybe           |(scheme base)           |6.5. Symbols            ||
|syntax-error                  |rapid-scheme    |(scheme base)           |4.3.3. Signaling errors in macro transformers||
|syntax-rules                  |rapid-scheme    |(scheme base)           |4.3.2. Pattern language ||
|textual-port?                 |NOTYET          |(scheme base)           |6.13.1. Ports           ||
|truncate                      |maybe           |(scheme base)           |6.2.6. Numerical operations||
|truncate-quotient             |NOTYET          |(scheme base)           |6.2.6. Numerical operations||
|truncate-remainder            |NOTYET          |(scheme base)           |6.2.6. Numerical operations||
|truncate/                     |NOTYET          |(scheme base)           |6.2.6. Numerical operations||
|u8-ready?                     |NOTYET          |(scheme base)           |6.13.2. Input           ||
|unless                        |rapid-scheme    |(scheme base)           |4.2.1. Conditionals     ||
|unquote                       |rapid-scheme    |(scheme base)           |4.2.8. Quasiquotation   ||
|unquote-splicing              |rapid-scheme    |(scheme base)           |4.2.8. Quasiquotation   ||
|utf8->string                  |maybe           |(scheme base)           |6.9. Bytevectors        ||
|values                        |rapid-scheme    |(scheme base)           |6.10. Control features  ||
|vector                        |maybe           |(scheme base)           |6.8. Vectors            ||
|vector->list                  |maybe           |(scheme base)           |6.8. Vectors            ||
|vector->string                |NOTYET          |(scheme base)           |6.8. Vectors            ||
|vector-append                 |maybe           |(scheme base)           |6.8. Vectors            ||
|vector-copy                   |maybe           |(scheme base)           |6.8. Vectors            ||
|vector-copy!                  |NOTYET          |(scheme base)           |6.8. Vectors            ||
|vector-fill!                  |maybe           |(scheme base)           |6.8. Vectors            ||
|vector-for-each               |maybe           |(scheme base)           |6.10. Control features  ||
|vector-length                 |maybe           |(scheme base)           |6.8. Vectors            ||
|vector-map                    |maybe           |(scheme base)           |6.10. Control features  ||
|vector-ref                    |maybe           |(scheme base)           |6.8. Vectors            ||
|vector-set!                   |maybe           |(scheme base)           |6.8. Vectors            ||
|vector?                       |maybe           |(scheme base)           |6.8. Vectors            ||
|when                          |rapid-scheme    |(scheme base)           |4.2.1. Conditionals     ||
|with-exception-handler        |implemented     |(scheme base)           |6.11. Exceptions        |Rapid-gambit runtime override (with-exception-handler:r7)|
|write-bytevector              |NOTYET          |(scheme base)           |6.13.3. Output          ||
|write-char                    |maybe           |(scheme base)           |6.13.3. Output          ||
|write-string                  |maybe           |(scheme base)           |6.13.3. Output          ||
|write-u8                      |maybe           |(scheme base)           |6.13.3. Output          ||
|zero?                         |maybe           |(scheme base)           |6.2.6. Numerical operations||
|case-lambda                   |rapid-scheme    |(scheme case-lambda)    |4.2.9. Case-lambda      ||
|char-alphabetic?              |maybe           |(scheme char)           |6.6. Characters         ||
|char-ci<=?                    |maybe           |(scheme char)           |6.6. Characters         ||
|char-ci<?                     |maybe           |(scheme char)           |6.6. Characters         ||
|char-ci=?                     |maybe           |(scheme char)           |6.6. Characters         ||
|char-ci>=?                    |maybe           |(scheme char)           |6.6. Characters         ||
|char-ci>?                     |maybe           |(scheme char)           |6.6. Characters         ||
|char-downcase                 |maybe           |(scheme char)           |6.6. Characters         ||
|char-foldcase                 |BAD             |(scheme char)           |6.6. Characters         |[Issue 2](https://github.com/okuoku/rapid-gambit/issues/2)|
|char-lower-case?              |maybe           |(scheme char)           |6.6. Characters         ||
|char-numeric?                 |maybe           |(scheme char)           |6.6. Characters         ||
|char-upcase                   |maybe           |(scheme char)           |6.6. Characters         ||
|char-upper-case?              |maybe           |(scheme char)           |6.6. Characters         ||
|char-whitespace?              |maybe           |(scheme char)           |6.6. Characters         ||
|digit-value                   |NOTYET          |(scheme char)           |6.6. Characters         ||
|string-ci<=?                  |maybe           |(scheme char)           |6.7. Strings            ||
|string-ci<?                   |maybe           |(scheme char)           |6.7. Strings            ||
|string-ci=?                   |maybe           |(scheme char)           |6.7. Strings            ||
|string-ci>=?                  |maybe           |(scheme char)           |6.7. Strings            ||
|string-ci>?                   |maybe           |(scheme char)           |6.7. Strings            ||
|string-downcase               |NOTYET          |(scheme char)           |6.7. Strings            ||
|string-foldcase               |BAD             |(scheme char)           |6.7. Strings            |[Issue 2](https://github.com/okuoku/rapid-gambit/issues/2)|
|string-upcase                 |NOTYET          |(scheme char)           |6.7. Strings            ||
|angle                         |maybe           |(scheme complex)        |6.2.6. Numerical operations||
|magnitude                     |maybe           |(scheme complex)        |6.2.6. Numerical operations||
|make-rectangular              |maybe           |(scheme complex)        |6.2.6. Numerical operations||
|imag-part                     |maybe           |(scheme complex)        |6.2.6. Numerical operations||
|make-polar                    |maybe           |(scheme complex)        |6.2.6. Numerical operations||
|real-part                     |maybe           |(scheme complex)        |6.2.6. Numerical operations||
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
|environment                   |BAD             |(scheme eval)           |6.12. Environments and evaluation|[Issue 4](https://github.com/okuoku/rapid-gambit/issues/4)|
|eval                          |implemented     |(scheme eval)           |6.12. Environments and evaluation|Rapid-gambit runtime override (eval:r7)|
|call-with-input-file          |rapid-scheme    |(scheme file)           |6.13.1. Ports           ||
|call-with-output-file         |rapid-scheme    |(scheme file)           |6.13.1. Ports           ||
|delete-file                   |maybe           |(scheme file)           |6.14. System interface  ||
|file-exists?                  |maybe           |(scheme file)           |6.14. System interface  ||
|open-binary-input-file        |NOTYET          |(scheme file)           |6.13.1. Ports           ||
|open-binary-output-file       |NOTYET          |(scheme file)           |6.13.1. Ports           ||
|open-input-file               |maybe           |(scheme file)           |6.13.1. Ports           ||
|open-output-file              |maybe           |(scheme file)           |6.13.1. Ports           ||
|with-input-from-file          |rapid-scheme    |(scheme file)           |6.13.1. Ports           ||
|with-output-to-file           |rapid-scheme    |(scheme file)           |6.13.1. Ports           ||
|cos                           |maybe           |(scheme inexact)        |6.2.6. Numerical operations||
|asin                          |maybe           |(scheme inexact)        |6.2.6. Numerical operations||
|atan                          |maybe           |(scheme inexact)        |6.2.6. Numerical operations||
|acos                          |maybe           |(scheme inexact)        |6.2.6. Numerical operations||
|exp                           |maybe           |(scheme inexact)        |6.2.6. Numerical operations||
|finite?                       |maybe           |(scheme inexact)        |6.2.6. Numerical operations||
|infinite?                     |maybe           |(scheme inexact)        |6.2.6. Numerical operations||
|log                           |maybe           |(scheme inexact)        |6.2.6. Numerical operations||
|nan?                          |maybe           |(scheme inexact)        |6.2.6. Numerical operations||
|sin                           |maybe           |(scheme inexact)        |6.2.6. Numerical operations||
|sqrt                          |maybe           |(scheme inexact)        |6.2.6. Numerical operations||
|tan                           |maybe           |(scheme inexact)        |6.2.6. Numerical operations||
|delay                         |rapid-scheme    |(scheme lazy)           |4.2.5. Delayed evaluation||
|delay-force                   |rapid-scheme    |(scheme lazy)           |4.2.5. Delayed evaluation||
|force                         |rapid-scheme    |(scheme lazy)           |4.2.5. Delayed evaluation||
|make-promise                  |rapid-scheme    |(scheme lazy)           |4.2.5. Delayed evaluation||
|promise?                      |BAD             |(scheme lazy)           |4.2.5. Delayed evaluation||
|load                          |BAD             |(scheme load)           |6.14. System interface  |[Issue 4](https://github.com/okuoku/rapid-gambit/issues/4)|
|command-line                  |maybe           |(scheme process-context)|6.14. System interface  ||
|emergency-exit                |maybe           |(scheme process-context)|6.14. System interface  ||
|exit                          |implemented     |(scheme process-context)|6.14. System interface  |Rapid-gambit runtime override (exit:r7)|
|get-environment-variable      |maybe           |(scheme process-context)|6.14. System interface  ||
|get-environment-variables     |maybe           |(scheme process-context)|6.14. System interface  ||
|read                          |rapid-scheme    |(scheme read)           |6.13.2. Input           ||
|current-jiffy                 |NOTYET          |(scheme time)           |6.14. System interface  ||
|current-second                |NOTYET          |(scheme time)           |6.14. System interface  ||
|jiffies-per-second            |NOTYET          |(scheme time)           |6.14. System interface  ||
|display                       |maybe           |(scheme write)          |6.13.3. Output          ||
|write                         |maybe           |(scheme write)          |6.13.3. Output          ||
|write-shared                  |maybe           |(scheme write)          |6.13.3. Output          ||
|write-simple                  |maybe           |(scheme write)          |6.13.3. Output          ||
|scheme-report-environment     |BAD             |Unknown                 |6.12. Environments and evaluation|[Issue 4](https://github.com/okuoku/rapid-gambit/issues/4)|
|null-environment              |BAD             |Unknown                 |6.12. Environments and evaluation|[Issue 4](https://github.com/okuoku/rapid-gambit/issues/4)|
|interaction-environment       |BAD             |Unknown                 |6.12. Environments and evaluation|[Issue 4](https://github.com/okuoku/rapid-gambit/issues/4)|
