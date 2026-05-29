# Objective-C Boilerplate Project

## Overview
This project demonstrates a minimal Objective-C command-line application using only the `libobjc` runtime. It includes:

- A `Parent` class with basic methods.
- A `Child` class that inherits from `Parent`, overrides methods, and demonstrates the use of `super`.
- A `main.m` file that dynamically creates instances of these classes and calls their methods.

The project is designed to be simple and portable, avoiding proprietary libraries like Foundation or GNUstep.

## Requirements
- **Compiler**: GCC with Objective-C support (`gobjc`).
- **Runtime Library**: `libobjc` (GNU Objective-C runtime).
- **Development Environment**: Linux-based system with `make` installed.

## Constraints
- No use of high-level frameworks like Foundation or GNUstep.
- Object creation and management are handled using `libobjc` runtime APIs.
- The project is designed to be portable and minimal.

## Project Structure
- `src/Parent.h` / `src/Parent.m`: Defines and implements the `Parent` class.
- `src/Child.h` / `src/Child.m`: Defines and implements the `Child` class.
- `src/main.m`: Entry point for the program.
- `Makefile`: Build and run instructions.

## Build Instructions
1. Open a terminal and navigate to the project directory.
2. Run the following command to build the project:
   ```bash
   make
   ```

## Run Instructions
After building, run the program with:
```bash
make run
```

## Clean Up
To remove the compiled binary, run:
```bash
make clean
```