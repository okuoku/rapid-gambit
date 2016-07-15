# rapid-gambit

Gambit port of [rapid-scheme](https://www.rapid-scheme.org/).

# Status

It runs some R7RS code with Gambit interpreter; rapid-compiler compiled 
with `gsc` successfully runs rapid-scheme frontend itself.

Most of R7RS libraries are still missing.

# Prerequisites

- Larceny (0.99-) - Required for bootstrap rapid-scheme
- or, chibi-scheme - Used when Larceny unavailable (slow)
- Gambit (4.x)
- CMake (2.8.1x or 3.x)

Larceny can be Win32 native version even if you build on Cygwin. 
Build script will automagically converts Cygwin path into Win32 path when 
invoke Larceny to bootstrap rapid-scheme. 

Build script will automatically detect chibi-scheme and use it when
Larceny is not available. 

# Build

Since rapid-scheme is written in R7RS and Gambit is R5RS, we will need other 
R7RS to bootstrap. Currently we use Larceny for this purpose.

CMakeLists.txt assumes `rapid-scheme` submodule initialized properly.

```sh
# Initialize submodule first
git submodule update --init

# Create build directory anywhere you want
mkdir _build
cd _build

# Generate Makefile
cmake -DCMAKE_INSTALL_PREFIX=/opt/rapid-gambit ../   # Path to this repository

# Build and test
make
make test

# Installation
make install

# Run program
/opt/rapid-gambit/bin/rapid-gambit prog.scm
```

CMakeLists.txt will accept following variables:

- `RAPID_SCHEME_ROOT`    - Path to rapid-scheme root
- `RAPID_GAMBIT_GSI`     - Path to Gambit's `gsi` executable
- `RAPID_GAMBIT_GSC`     - Path to Gambit's `gsc` executable
- `RAPID_GAMBIT_LARCENY` - Path to Larceny executable to bootstrap

# Repository structure

Compiled-in/distributed with rapid-gambit executable:

- `rt`  - Runtime procedures/macros for rapid-scheme
- `r7`  - R7RS procedures
- `src` - Sources for `rapid-gambit` program/frontend support
- `lib` - Standard libraries for `rapid-gambit` in R7RS form

Build support:

- `cmake` - Support scripts written in CMake language
- `build` - Bootstrap/build support scripts

External project:

- `rapid-scheme` - Git submodule of rapid-scheme project
  It can override with `RAPID_SCHEME_ROOT` CMake variable

# License

Rapid-Gambit is combination of:

- Modified rapid-scheme code which is GPL3+. 
  See the file header and COPYING.GPL3
- Glue code and support scripts including `CMakeLists.txt`:
  I hereby release it into the Public domain.

