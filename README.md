# rapid-gambit
Gambit support for [rapid-scheme](https://gitlab.com/nieper/rapid-scheme).

# Status

Just selfhosted; rapid-compiler compiled with `gsc` successfully expands rapid-compiler itself.

Most of R7RS libraries are still missing.

# build

Since rapid-scheme is written in R7RS and Gambit is R5RS, we will need other R7RS to bootstrap.

CMakeLists.txt assume `rapid-scheme` is checked out on the parent directory.

```sh
mkdir build
chdir build
cmake ../
make
```
