# Documentation
The digicompute API is divided among several different files. Unless otherwise mentioned, the `.md` documentation file is labeled the same as the Lua file containin the code. However, for modules, documentation is found in a subdirectory. Below, the main documentation sections are found before being divided depending on the module.

### `modules.md`
Non-API portions of digicompute are loaded as modules to allow them to be easily enabled or disabled. This documents the API for loading, configuring, and interacting with modules.

### `builtin.md`
This documents the API introduced by `builtin.lua`. Mostly containing file interaction APIs, __builtin__ contains functions that don't fit elsewhere.

### `env.md`
This covers the simplistic API created in `env.lua` for running code under an environment.

## [Module] Computers

### `api.md`
This documents the entire API used by computers. This API is only for use by modders who want to register or customize a computer.

### `os.md`
This documents the API accessible under a secure environment to the computer OS. Through this API, the player can interact with the computer itself to make their own programs.