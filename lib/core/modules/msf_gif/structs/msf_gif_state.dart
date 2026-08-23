part of '../../../raylib_dartified_base.dart';

enum MsfGifCookedFrameField {
  pixels,
  depth,
  count,
  rbits,
  gbits,
  bbits,
}

enum MsfGifStateField {
  fileWriteFunc,
  fileWriteData,
  previousFrame,
  currentFrame,
  lzwMem,
  listHead,
  listTail,
  width,
  height,
  customAllocatorContext,
  framesSubmitted,
}

class MsfGifStateD extends RaylibStruct<MsfGifStateD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  static final StructLayout<MsfGifCookedFrameField> cookedFrameStructLayout = .aligned(cookedFrameStructFields);
  static final Map<MsfGifCookedFrameField, RType> cookedFrameStructFields = {
    .pixels: RPointer<RUint32>(),
    .depth:  RInt32(),
    .count:  RInt32(),
    .rbits:  RInt32(),
    .gbits:  RInt32(),
    .bbits:  RInt32(),
  };

  static final int byteSize = structLayout.byteSize;
  static final int alignment = structLayout.alignment;
  static final StructLayout<MsfGifStateField> structLayout = .aligned(structFields);
  static final Map<MsfGifStateField, RType> structFields = {
    .fileWriteFunc:          RPointer<RFunction>(),
    .fileWriteData:          RPointer<RVoid>(),
    .previousFrame:          RStruct(cookedFrameStructLayout),
    .currentFrame:           RStruct(cookedFrameStructLayout),
    .lzwMem:                 RPointer<RUint16>(),
    .listHead:               RPointer<ROpaque>(),
    .listTail:               RPointer<ROpaque>(),
    .width:                  RInt32(),
    .height:                 RInt32(),
    .customAllocatorContext: RPointer<RVoid>(),
    .framesSubmitted:        RInt32(),
  };

  static StructPointer<MsfGifStateD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, structLayout, MsfGifStateD.new);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        
  
  int _width = 0;
  int get width {
    structOnOp((p) => _width = p.readInt32(structLayout.offset(.width)));
    return _width;
  }

  int _height = 0;
  int get height {
    structOnOp((p) => _height = p.readInt32(structLayout.offset(.height)));
    return _height;
  }

  int _framesSubmitted = 0;
  int get framesSubmitted {
    structOnOp((p) => _framesSubmitted = p.readInt32(structLayout.offset(.framesSubmitted)));
    return _framesSubmitted;
  }

  MsfGifStateD({ super.op });

  factory MsfGifStateD.zero() => .new();

  @override
  MsfGifStateD setD(MsfGifStateD o) => this;

  @override
  void writeInto(MemoryPointer<RStruct> p) {
    p.writeInt32(_width, structLayout.offset(.width));
    p.writeInt32(_height, structLayout.offset(.height));
    p.writeInt32(_framesSubmitted, structLayout.offset(.framesSubmitted));
  }

  @override
  void readFrom(MemoryPointer<RStruct> p) {
    _width = p.readInt32(structLayout.offset(.width));
    _height = p.readInt32(structLayout.offset(.height));
    _framesSubmitted = p.readInt32(structLayout.offset(.framesSubmitted));
  }

  @override
  MsfGifStateD clone() => .new(op: op);

  @override
  String signature() => '$structName(width: $width, height: $height, framesSubmitted: $framesSubmitted)';
}