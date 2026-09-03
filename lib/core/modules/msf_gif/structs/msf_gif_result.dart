part of '../../../raylib_dartified_base.dart';

enum MsfGifResultField with StructFields {
  data,
  dataSize,
  allocSize,
  contextPointer,
}

/// MsfGifResult
class MsfGifResultD extends RaylibStructView<MsfGifResultD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  @override
  StructLayout<MsfGifResultField> get structLayout => struct;

  /// Raw memory layout of the C struct (field order, offsets, and backing [RType]s).
  static final StructLayout<MsfGifResultField> struct = .aligned({
    .data:           RPointer(RVoid()),
    .dataSize:       RSize(),
    .allocSize:      RSize(),
    .contextPointer: RPointer(RVoid()),
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<MsfGifResultD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, struct, MsfGifResultD.new, MsfGifResultD.pointer);

  static final _dataF = struct.pointerUnknown<RVoid>(.data);
  static final _dataSizeF = struct.scalar<int, RSize>(.dataSize);
  static final _allocSizeF = struct.scalar<int, RSize>(.allocSize);
  static final _contextPointerF = struct.pointerUnknown<RVoid>(.contextPointer);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  late final LivePointerSync<RVoid> _data = _dataF.live(() => op?.ptr);
  MemoryPointer<RVoid> get data => _data.fieldPtr();
  Uint8List get dataView => data.asView(dataSize);

  int get dataSize => _dataSizeF.read(getOp().ptr);

  int get allocSize => _allocSizeF.read(getOp().ptr);

  late final LivePointerSync<RVoid> _contextPointer = _contextPointerF.live(() => op?.ptr);
  MemoryPointer<RVoid> get contextPointer => _contextPointer.fieldPtr();

  MsfGifResultD({ super.op });

  factory MsfGifResultD.zero() => .new();

  @override
  MsfGifResultD clone() => .new(op: getOp());

  @override
  String signature() => '$structName(dataSize: $dataSize, allocSize: $allocSize)';
}