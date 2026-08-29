part of '../../../raylib_dartified_base.dart';

enum MsfGifResultField with StructFields {
  data,
  dataSize,
  allocSize,
  contextPointer,
}

class MsfGifResultD extends RaylibStructView<MsfGifResultD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  static final StructLayout<MsfGifResultField> structLayout = .aligned({
    .data:           RPointer<RVoid>(),
    .dataSize:       RSize(),
    .allocSize:      RSize(),
    .contextPointer: RPointer<RVoid>(),
  });

  static StructPointer<MsfGifResultD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, structLayout, MsfGifResultD.new, MsfGifResultD.pointer);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  Uint8List get data => getOp().offsetBy(structLayout.offset(.data)).asView(dataSize);

  int get dataSize => getOp().readSize(structLayout.offset(.dataSize));

  int get allocSize => getOp().readSize(structLayout.offset(.allocSize));

  MsfGifResultD({super.op});

  factory MsfGifResultD.zero() => .new();

  @override
  MsfGifResultD clone() => .new(op: getOp());

  @override
  String signature() => '$structName(dataSize: $dataSize, allocSize: $allocSize)';
}