# rapid-gambit
Gambit support for [rapid-scheme](https://gitlab.com/nieper/rapid-scheme).

# Status

Just selfhosted; rapid-compiler compiled with `gsc` successfully expands rapid-compiler itself.

Most of R7RS libraries are still missing.

# Prerequisites

- Larceny (0.99-) - Required for bootstrap rapid-scheme
- Gambit (4.x)
- CMake (2.8.1x or 3.x)

Larceny can be Win32 native version even if you build on Cygwin. 
Build script will automagically converts Cygwin path into Win32 path when invoke Larceny to bootstrap. 

# Build

Since rapid-scheme is written in R7RS and Gambit is R5RS, we will need other R7RS to bootstrap.

CMakeLists.txt assume `rapid-scheme` is checked out on the parent directory.

```sh
mkdir build
chdir build
cmake ../
make
```

CMakeLists.txt will accept following variables:

- `RAPID_GAMBIT_GSI` - Path to Gambit's `gsi` executable
- `RAPID_GAMBIT_GSC` - Path to Gambit's `gsc` executable
- `RAPID_GAMBIT_LARCENY` - Path to Larceny executable

FIXME: Currently it has no `install` target.
