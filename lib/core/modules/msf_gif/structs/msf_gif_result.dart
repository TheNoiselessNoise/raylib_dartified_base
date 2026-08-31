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

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  Uint8List get data => getOp().readPtr(struct.offset(.data)).asView(dataSize);

  int get dataSize => getOp().readSize(struct.offset(.dataSize));

  int get allocSize => getOp().readSize(struct.offset(.allocSize));

  MsfGifResultD({ super.op });

  factory MsfGifResultD.zero() => .new();

  @override
  MsfGifResultD clone() => .new(op: getOp());

  @override
  String signature() => '$structName(dataSize: $dataSize, allocSize: $allocSize)';
}