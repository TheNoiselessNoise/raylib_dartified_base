part of '../../raylib_dartified_base.dart';

// void (MemoryPointer<Char>, MemoryPointer<Void>)
/// User-facing `TraceLogCallback` signature.
typedef TraceLogCallbackFunction = void Function(
  int logLevel,
  MemoryPointer<RInt8> text,
  MemoryPointer<RVoid> args,
);

typedef TraceLogCallbackFriendlyFunction = void Function(
  TraceLogLevel logLevel,
  String text,
);

/// Raylib's `TraceLogCallback` callback.
abstract class TraceLogCallbackBase extends RaylibCallback<TraceLogCallbackBase, TraceLogCallbackFunction> {
  TraceLogCallbackBase([super.name]);
  static final List<TraceLogCallbackBase> _registry = [];
  @override @nonVirtual get registry => _registry;
  static void disposeRegistry() => RaylibCallback.disposeRegistry(_registry);
}

// MemoryPointer<UnsignedChar> (MemoryPointer<Char>, MemoryPointer<Int>)
/// User-facing `LoadFileDataCallback` signature.
typedef LoadFileDataCallbackFunction = MemoryPointer<RUint8> Function(
  MemoryPointer<RInt8> fileName,
  MemoryPointer<RInt32> dataSize,
);

// MemoryPointer<UnsignedChar> (String, MemoryPointer<Int>)
typedef LoadFileDataCallbackFriendlyFunction = MemoryPointer<RUint8> Function(
  String fileName,
  MemoryPointer<RInt32> dataSize,
);

/// Raylib's `LoadFileDataCallback` callback.
abstract class LoadFileDataCallbackBase extends RaylibCallback<LoadFileDataCallbackBase, LoadFileDataCallbackFunction> {
  LoadFileDataCallbackBase([super.name]);
  static final List<LoadFileDataCallbackBase> _registry = [];
  @override @nonVirtual get registry => _registry;
  static void disposeRegistry() => RaylibCallback.disposeRegistry(_registry);
}

// bool (MemoryPointer<Char>, MemoryPointer<Void>, Int)
/// User-facing `SaveFileDataCallback` signature.
typedef SaveFileDataCallbackFunction = bool Function(
  MemoryPointer<RInt8> fileName,
  MemoryPointer<RVoid> data,
  int dataSize,
);

// bool (String, MemoryPointer<Void>, Int)
typedef SaveFileDataCallbackFriendlyFunction = bool Function(
  String fileName,
  MemoryPointer<RVoid> data,
  int dataSize,
);

/// Raylib's `SaveFileDataCallback` callback.
abstract class SaveFileDataCallbackBase extends RaylibCallback<SaveFileDataCallbackBase, SaveFileDataCallbackFunction> {
  SaveFileDataCallbackBase([super.name]);
  static final List<SaveFileDataCallbackBase> _registry = [];
  @override @nonVirtual get registry => _registry;
  static void disposeRegistry() => RaylibCallback.disposeRegistry(_registry);
}

// MemoryPointer<Char> (MemoryPointer<Char>)
/// User-facing `LoadFileTextCallback` signature.
typedef LoadFileTextCallbackFunction = MemoryPointer<RInt8> Function(
  MemoryPointer<RInt8> fileName,
);

typedef LoadFileTextCallbackFriendlyFunction = String Function(
  String fileName,
);

/// Raylib's `LoadFileTextCallback` callback.
abstract class LoadFileTextCallbackBase extends RaylibCallback<LoadFileTextCallbackBase, LoadFileTextCallbackFunction> {
  LoadFileTextCallbackBase([super.name]);
  static final List<LoadFileTextCallbackBase> _registry = [];
  @override @nonVirtual get registry => _registry;
  static void disposeRegistry() => RaylibCallback.disposeRegistry(_registry);
}

// bool (MemoryPointer<Char>, MemoryPointer<Char>)
/// User-facing `SaveFileTextCallback` signature.
typedef SaveFileTextCallbackFunction = bool Function(
  MemoryPointer<RInt8> fileName,
  MemoryPointer<RInt8> text,
);

typedef SaveFileTextCallbackFriendlyFunction = bool Function(
  String fileName,
  String text,
);

/// Raylib's `SaveFileTextCallback` callback.
abstract class SaveFileTextCallbackBase extends RaylibCallback<SaveFileTextCallbackBase, SaveFileTextCallbackFunction> {
  SaveFileTextCallbackBase([super.name]);
  static final List<SaveFileTextCallbackBase> _registry = [];
  @override @nonVirtual get registry => _registry;
  static void disposeRegistry() => RaylibCallback.disposeRegistry(_registry);
}