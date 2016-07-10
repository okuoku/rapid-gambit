This directory includes build support script

- `gen.scm.in` - Convert and pretty-print expanded rapid-scheme source
  so Gambit can accept S-exp printed using Larceny.

- `rapid-compiler-bootstrap.scm` - R7RS program for Laceny to bootstrap
  rapid-scheme source. Used on `cmake/gen-core-scm.`.

