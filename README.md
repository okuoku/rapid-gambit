# rapid-gambit
Gambit support for [rapid-scheme](https://gitlab.com/nieper/rapid-scheme).

# Status

Just selfhosted; rapid-compiler compiled with `gsc` successfully expands rapid-compiler itself.

Most of R7RS libraries are still missing.

# build

Since rapid-scheme is written in R7RS and Gambit is R5RS, we will need other R7RS to bootstrap.

Following commands assume `rapid-scheme` is checked out on the parent directory.

1. Generate `core.scm`(bootstrapped expander) with `larceny`
2. Convert `core.scm` into Gambit-readable form
3. do `gsc`

### Generate `core.scm`(bootstrapped expander) with `larceny`

```sh
larceny -path ../rapid-scheme -r7rs -program rapid-compiler-gambit.scm -- \
-I ../rapid-scheme -I ../rapid-scheme/share rapid-compiler-gambit.scm > core.scm
```

### Convert `core.scm` into Gambit-readable form (`core0.scm`)

```sh
./gen.scm
```

Skips errors on stdout and pretty-print `core.scm`. (for debuggability...)

### Compile

```sh
gsc -o rapid-gambit -exe rapid-gambit-interp.scm
```

Alternatively, rapid-gambit-interp.scm can be used with `gsi`.
