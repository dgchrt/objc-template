# Objective-C Template

## Overview
This project is an Objective-C template, ready to be used as a starting point for any Objective-C project. It uses only the `libobjc` runtime and is designed for portability and extensibility.

- A reusable custom root class, `Root`, which provides the foundation for any Objective-C project (object allocation, initialization, manual reference counting, and class name introspection).
- Sample subclasses: `Parent` (basic methods) and `Child` (inherits from `Parent`, overrides methods, demonstrates `super`).
- A `main.m` file that demonstrates usage.

The template is simple, portable, and enables Objective-C without the need for heavier libraries like Foundation or GNUstep.

## Requirements
- **Compiler**: GCC with Objective-C support (`gobjc`).
- **Runtime Library**: `libobjc` (GNU Objective-C runtime).
- **Development Environment**: Linux-based system with `make` installed.

## Constraints
- No use of high-level frameworks like Foundation or GNUstep.
- Object creation and management are handled using `libobjc` runtime APIs.
- The project is designed to be portable and minimal.

## Project Structure
- `src/Root.h` / `src/Root.m`: Defines and implements the custom root class (`Root`).
- `src/Parent.h` / `src/Parent.m`: Sample subclass (`Parent`).
- `src/Child.h` / `src/Child.m`: Sample subclass (`Child`).
- `src/main.m`: Entry point for the program.
- `Makefile`: Build, test, and run instructions.
- `tests/`: Unit tests (see below).
## Unit Tests

Unit tests are provided for each class in the `tests/` directory. Each test file (e.g., `tests/root.m`, `tests/parent.m`, `tests/child.m`) is a standalone program with its own `main()` function and assertions. Run all tests with:

```sh
make test
```

This will build and execute each test binary independently. All tests use only standard C and the same minimal runtime as the main code.

## Build Instructions
1. Open a terminal and navigate to the project directory.
2. Run the following command to build the project:
   ```sh
   make
   ```

## Run Instructions
After building, run the program with:
```sh
make run
```

## Clean Up
To remove the compiled binary, run:
```sh
make clean
```