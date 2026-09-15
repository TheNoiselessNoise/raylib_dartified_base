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

  static final field_data = struct.pointerUnknown<RVoid>(.data);
  static final field_dataSize = struct.scalar<int, RSize>(.dataSize);
  static final field_allocSize = struct.scalar<int, RSize>(.allocSize);
  static final field_contextPointer = struct.pointerUnknown<RVoid>(.contextPointer);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  late final LivePointerSync<RVoid> _data = field_data.live(() => op);
  MemoryPointer<RVoid> get data => _data.derefPtr();
  Uint8List get dataView => data.asView(dataSize);

  int get dataSize => field_dataSize.read(getOp());

  int get allocSize => field_allocSize.read(getOp());

  late final LivePointerSync<RVoid> _contextPointer = field_contextPointer.live(() => op);
  MemoryPointer<RVoid> get contextPointer => _contextPointer.derefPtr();

  MsfGifResultD({ super.op });

  factory MsfGifResultD.zero() => .new();

  @override
  MsfGifResultD clone() => .new(op: getOp());

  @override
  String signature() => '$structName(dataSize: $dataSize, allocSize: $allocSize)';
}