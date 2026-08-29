# raylib_dartified_base

Platform interface package for the `raylib_dartified` package family.

Defines the shared API surface (types, structs, abstract flat-call
modules) that platform implementations bind to. This package is **not**
fully backend-agnostic: it defines primitives a platform must supply
itself, since pointer representation and native call dispatch differ
between native (`dart:ffi`) and WebAssembly (linear memory + imports).

## For platform implementors

A platform implementation must provide:

- `MemoryPointer<X extends RType>` => pointer abstraction with
  `readX`/`writeX` at explicit byte offsets, backed by whatever memory
  model the platform uses (FFI pointer vs. WASM linear memory offset).
- A concrete flat module for each of the following, extending the
  matching abstract type defined here and exposed via `RaylibBase`:

  | Module | Abstract type |
  |---|---|
  | Audio | `RaylibAudioFlatModule<R>` |
  | Camera | `RaylibCameraFlatModule<R>` |
  | Core | `RaylibCoreFlatModule<R>` |
  | Gui | `RaylibGuiFlatModule<R>` |
  | Light | `RaylibLightFlatModule<R>` |
  | MsfGif | `RaylibMsfGifFlatModule<R>` |
  | Rlgl | `RaylibRlglFlatModule<R>` |

  Each module implements its methods by dispatching to the platform's
  native call surface.

Everything else (struct definitions, higher-level bindings, ...) is shared
and works unmodified once `MemoryPointer` and the six flat modules exist
for a platform.

See [raylib_dartified](https://github.com/TheNoiselessNoise/raylib_dartified) (FFI) and [raylib_dartified_web](https://github.com/TheNoiselessNoise/raylib_dartified_web) (WASM) for
reference implementations.

## License

This project is released under the **zlib/libpng license**.

It contains rewritten components derived from **raylib**, which is also licensed under zlib.

See [LICENSE](LICENSE) for details.