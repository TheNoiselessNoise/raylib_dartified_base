# Array-returning function lifecycles

Raylib has two distinct patterns for functions that return a pointer to an
array (`T *Load...(..., int *count)`), and the wrapper strategy differs for
each. Which one applies depends on whether `T` owns further heap allocations
of its own.

## 1. Flat value types => eager copy-and-free

If `T` is a flat bucket of values with no nested pointers (e.g. `Color`,
`Vector2`), there's nothing to preserve a live view of. The wrapper
dereferences every element into a plain Dart value type immediately, then
frees the native array in the same call via the matching `Unload...`, before
ever returning to the caller.

- No back-reference to native memory; returned values are fully Dart-owned
  and inert.
- No `Unload...` exposed to (or needed from) the caller, freeing is an
  implementation detail hidden inside the `Load...` wrapper.
- Safe to hold onto indefinitely; no risk of stale/dangling pointers, no
  risk of double-free.

Example: **`[native].CoreD.LoadImageColors`** copies out all `ColorD`s and calls
`UnloadImageColors` internally before returning.

## 2. Structs with nested ownership => live, deferred unload via `RaylibLiveList`

If `T` owns further raylib-allocated memory (e.g. `ModelAnimation.keyframePoses`), eagerly copying it out would mean
either a nontrivial deep clone on every load, or silently severing the
ability to write back through to native memory. These are wrapped in a
`[native].NativeLiveListPointer` instead:

- The returned handle wraps the ***original*** native pointer, no copy, no
  allocator round-trip.
- Indexed reads/writes (`list[i].x = y`) proxy straight through to live
  native memory via `[native].StructD.nativeGetIndexedReference` / `[native].StructD.nativeWriteInto`.
- The native array stays alive until the caller explicitly calls the
  matching `Unload...`, which must receive the ***same*** underlying pointer the
  handle was constructed with, never a value reconstructed through the
  generic struct-sync/allocation machinery, which would
  allocate unrelated temp memory and hand that to `RL_FREE` instead.

Example:
1) **`[native].CoreD.LoadModelAnimations`**
    - returns a
`NativeLiveListPointerStruct`

2) **`[native].CoreD.UnloadModelAnimations`**
    - passes `NativeLiveListPointerStruct`'s `ptr` straight to the native call.

## Rule of thumb

When wrapping a new `T *Load...(..., int *count)` function: does `T`
contain pointers to further raylib-owned memory?

- **No** => eager copy-and-free (bucket 1).
- **Yes** => `LiveList` + deferred `Unload...` (bucket 2).