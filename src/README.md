This directory contains main executable sources.

For procedure/macros which should also be used on compiled/interpreted R7RS
program, see `r7` and `rt` dir.

Global constants:

- `buildconfig.scm.in` - Build directory information
- `config.scm.in` - Install directory information

Gambit program:

- `entrypoint.scm.in` - The entrypoint which can be compiled/interpreted with
  `gsc` or `gsi`.

R7RS program:

- `rapid-gambit-main.scm` - rapid-scheme program implements program entrypoint.

