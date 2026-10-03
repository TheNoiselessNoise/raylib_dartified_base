import 'dart:typed_data';
import 'package:raylib_dartified_base/raylib_dartified_base.dart';

// Exports everything that can be shared across Dart and Flat layers.

RaylibBase get _rl => RaylibBase.instance;

/// See [RaylibTemp].
RaylibTemp get _$ => _rl.Temp;

/// See [RaylibTemp.TypedDataList$].
RaylibTempTypedDataListAllocator get TypedDataList$ => _$.TypedDataList$;
/// See [RaylibTemp.String$].
RaylibTempStringAllocator get String$ => _$.String$;
/// See [RaylibTemp.Bool$].
RaylibTempScalarAllocator<bool, RBool> get Bool$ => _$.Bool$;
/// See [RaylibTemp.Int8$].
RaylibTempScalarIntAllocator<Int8List, RInt8> get Int8$ => _$.Int8$;
/// See [RaylibTemp.Uint8$].
RaylibTempScalarIntAllocator<Uint8List, RUint8> get Uint8$ => _$.Uint8$;
/// See [RaylibTemp.Int16$].
RaylibTempScalarIntAllocator<Int16List, RInt16> get Int16$ => _$.Int16$;
/// See [RaylibTemp.Uint16$].
RaylibTempScalarIntAllocator<Uint16List, RUint16> get Uint16$ => _$.Uint16$;
/// See [RaylibTemp.Int32$].
RaylibTempScalarIntAllocator<Int32List, RInt32> get Int32$ => _$.Int32$;
/// See [RaylibTemp.Uint32$].
RaylibTempScalarIntAllocator<Uint32List, RUint32> get Uint32$ => _$.Uint32$;
/// See [RaylibTemp.Int64$].
RaylibTempScalarIntAllocator<Int64List, RInt64> get Int64$ => _$.Int64$;
/// See [RaylibTemp.Uint64$].
RaylibTempScalarIntAllocator<Uint64List, RUint64> get Uint64$ => _$.Uint64$;
/// See [RaylibTemp.Float32$].
RaylibTempScalarFloatAllocator<Float32List, RFloat32> get Float32$ => _$.Float32$;
/// See [RaylibTemp.Float64$].
RaylibTempScalarFloatAllocator<Float64List, RFloat64> get Float64$ => _$.Float64$;
/// See [RaylibTemp.Char$].
RaylibTempScalarIntAllocator<Int8List, RInt8> get Char$ => _$.Char$;
/// See [RaylibTemp.UnsignedChar$].
RaylibTempScalarIntAllocator<Uint8List, RUint8> get UnsignedChar$ => _$.UnsignedChar$;
/// See [RaylibTemp.Short$].
RaylibTempScalarIntAllocator<Int16List, RInt16> get Short$ => _$.Short$;
/// See [RaylibTemp.UnsignedShort$].
RaylibTempScalarIntAllocator<Uint16List, RUint16> get UnsignedShort$ => _$.UnsignedShort$;
/// See [RaylibTemp.Int$].
RaylibTempScalarIntAllocator<Int32List, RInt32> get Int$ => _$.Int$;
/// See [RaylibTemp.UnsignedInt$].
RaylibTempScalarIntAllocator<Uint32List, RUint32> get UnsignedInt$ => _$.UnsignedInt$;
/// See [RaylibTemp.Float$].
RaylibTempScalarFloatAllocator<Float32List, RFloat32> get Float$ => _$.Float$;
/// See [RaylibTemp.Double$].
RaylibTempScalarFloatAllocator<Float64List, RFloat64> get Double$ => _$.Double$;
