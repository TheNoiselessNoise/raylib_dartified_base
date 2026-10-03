part of '../raylib_dartified_base.dart';

/// StructType
final class StructType<D extends RaylibStruct<D>> {
  final bool isBuiltin;
  final StructFactory<D> factory;
  final StructLayout layout;

  const StructType._({
    this.isBuiltin = false,
    required this.factory,
    required this.layout,
  });

  factory StructType._builtin({
    required StructFactory<D> factory,
    required StructLayout layout,
  }) => ._(
    isBuiltin: true,
    factory: factory,
    layout: layout,
  );

  factory StructType.create({
    required StructFactory<D> factory,
    required StructLayout layout,
  }) => ._(
    factory: factory,
    layout: layout,
  );

  /// Gets the [layout] typed to fields [F].
  StructLayout<F> layoutOf<F extends StructFields>()
    => layout as StructLayout<F>;

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  StructPointer<D> ptr(MemoryPointer? ptr) => .nullable(ptr, this);

  /// The total size of the struct in bytes, including trailing alignment.
  int get byteSize => layout.byteSize;
}

/// Registry of [StructType]s
final class StructTypes {
  static final Map<Type, StructType> _types = {};

  static bool exists<D extends RaylibStruct<D>>()
    => _types.containsKey(D);

  static bool isBuiltIn<D extends RaylibStruct<D>>()
    => of<D>().isBuiltin;

  /// Registers a [StructType] under the key [D].
  static void register<D extends RaylibStruct<D>>(StructType<D> type) {
    if (exists<D>()) {
      throw StateError('StructType for $D is already registered.');
    }
    _types[D] = type;
  }

  /// Gets the [StructType] either by type [D] directly or by infering type from [value].
  static StructType<D> of<D extends RaylibStruct<D>>([D? value]) {
    final type = _types[D];

    if (type == null) {
      throw StateError('No StructType registered for $D.');
    }

    return type as StructType<D>;
  }
}