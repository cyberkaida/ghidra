# Decompiler

## Datatests

Datatests are tests that construct a binary, decompile it, and then look for output in the
decompilation. These tests are defined in [src/decompile/datatests](src/decompile/datatests)
directory.

The tests are in an XML format and are executed by the `test` target in the [decompiler Makefile](src/decompile/cpp/Makefile).

The tests can be debugged by building the decompiler test target and running the tests like so:

> Note: the working directory must be the `src/decompile/cpp` directory.

```sh
cd src/decompile/cpp
make test
./ghidra_test_dbg -verbose datatests
```

This will print the result of the decompilation to stderr. Your test must have a `print C` command for the decompiler to print the decompilation (but you need this anyway to match against the expected output).