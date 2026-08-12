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
mixin TraceLogCallbackBase on RaylibCallbackBase {
  TraceLogCallbackFunction get function;
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
mixin LoadFileDataCallbackBase on RaylibCallbackBase {
  LoadFileDataCallbackFunction get function;
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
mixin SaveFileDataCallbackBase on RaylibCallbackBase {
  SaveFileDataCallbackFunction get function;
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
mixin LoadFileTextCallbackBase on RaylibCallbackBase {
  LoadFileTextCallbackFunction get function;
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
mixin SaveFileTextCallbackBase on RaylibCallbackBase {
  SaveFileTextCallbackFunction get function;
}