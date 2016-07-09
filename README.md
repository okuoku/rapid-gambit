# rapid-gambit

Gambit port of [rapid-scheme](https://www.rapid-scheme.org/).

# Status

Now runs some R7RS code with Gambit interpreter; rapid-compiler compiled with `gsc` successfully runs rapid-scheme frontend itself.

Most of R7RS libraries are still missing.

# Prerequisites

- Larceny (0.99-) - Required for bootstrap rapid-scheme
- Gambit (4.x)
- CMake (2.8.1x or 3.x)

Larceny can be Win32 native version even if you build on Cygwin. 
Build script will automagically converts Cygwin path into Win32 path when invoke Larceny to bootstrap. 

# Build

Since rapid-scheme is written in R7RS and Gambit is R5RS, we will need other R7RS to bootstrap. Currently we use Larceny for this purpose.

CMakeLists.txt assume `rapid-scheme` submodule initialized properly.

```sh
# Initialize submodule first
git submodule update --init

# Create build directory anywhere you want
mkdir build
chdir build

# Generate Makefile
cmake ../
make

# To run R7RS program,
./rapid-scheme -I /path/to/rapid-scheme -I /path/to/rapid-scheme/share prog.scm
```

CMakeLists.txt will accept following variables:

- `RAPID_GAMBIT_GSI` - Path to Gambit's `gsi` executable
- `RAPID_GAMBIT_GSC` - Path to Gambit's `gsc` executable
- `RAPID_GAMBIT_LARCENY` - Path to Larceny executable

FIXME: Currently it has no `install` target.

# License

Rapid-Gambit is combination of:

- Modified rapid-scheme code which is GPL3. See the file header and COPYING.GPL3
- Glue code and support scripts including `CMakeLists.txt`:
  I hereby release it into the Public domain.

