This directory includes R7RS procedures for Gambit.

Definitions
-----------

- `_override.scm` - Override some identifier so we can reference
  R7RS version of procedure inside rapid-scheme expanded program.
  ref: https://gitlab.com/nieper/rapid-scheme/issues/1#note_12969945


Libraries
---------

- (scheme base)

  R7RS bytevectors are mapped to Gambit u8vector.

  * `raise-continuable` - needs some consideration
  * `vector-for-each`   - not optimal
  * `vector-map`        - not optimal
  * `eof-object`        - not optimal
  * `equal?`            - not optimal
  * `member`            - Override
  * `u8-ready?`         - Not implemented (never)
  * `flush-output-port` - No-op
  * `utf8->string`      - test this
  * `string->utf8`      - test this

  MANY unimplemted procedures.

- (scheme char)

  NOT YET.

  * `char-foldcase`     - Stub
  * `string-foldcase`   - Stub

- (scheme eval)

  Includes a tiny macro-expander to perform minimal semantic conversion
  between R5RS and R7RS.

  * `eval` - no environment support
  * `environment` - stub

- (scheme file)

  NOT YET.

- (scheme lazy)

  NOT YET.

- (scheme process-context)

  * `command-line` - Uses "--" to separate backend options.
  * `get-environment-variables` - not implemented

- (scheme time)

  NOT YET.

- (scheme write)

  * `write-shared` - stub


NOT Included
------------

Since Gambit implements R5RS, we don't have to reimprement R5RS here.

 - (scheme case-lambda) - syntax only
 - (scheme complex)     - R5RS
 - (scheme cxr)         - R5RS
 - (scheme inexact)     - R5RS
 - (scheme load)        - ???
 - (scheme read)        - rapid-scheme
 - (scheme r5rs)        - R5RS

