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
  static final StructLayout<MsfGifResultField> structLayout = .aligned({
    .data:           RPointer<RVoid>(),
    .dataSize:       RSize(),
    .allocSize:      RSize(),
    .contextPointer: RPointer<RVoid>(),
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<MsfGifResultD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, structLayout, MsfGifResultD.new, MsfGifResultD.pointer);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  Uint8List get data => getOp().readPtr(structLayout.offset(.data)).asView(dataSize);

  int get dataSize => getOp().readSize(structLayout.offset(.dataSize));

  int get allocSize => getOp().readSize(structLayout.offset(.allocSize));

  MsfGifResultD({ super.op });

  factory MsfGifResultD.zero() => .new();

  @override
  MsfGifResultD clone() => .new(op: getOp());

  @override
  String signature() => '$structName(dataSize: $dataSize, allocSize: $allocSize)';
}