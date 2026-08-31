part of '../../../raylib_dartified_base.dart';

enum MsfGifCookedFrameField with StructFields {
  pixels,
  depth,
  count,
  rbits,
  gbits,
  bbits,
}

enum MsfGifStateField with StructFields {
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

/// MsfGifState
class MsfGifStateD extends RaylibStructView<MsfGifStateD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  static final StructLayout<MsfGifCookedFrameField> cookedFrameStructLayout = .aligned({
    .pixels: RPointer(RUint32()),
    .depth:  RInt(),
    .count:  RInt(),
    .rbits:  RInt(),
    .gbits:  RInt(),
    .bbits:  RInt(),
  });

  /// Raw memory layout of the C struct (field order, offsets, and backing [RType]s).
  static final StructLayout<MsfGifStateField> struct = .aligned({
    .fileWriteFunc:          RPointer(RFunction()),
    .fileWriteData:          RPointer(RVoid()),
    .previousFrame:          RStruct(cookedFrameStructLayout),
    .currentFrame:           RStruct(cookedFrameStructLayout),
    .lzwMem:                 RPointer(RInt16()),
    .listHead:               RPointer(ROpaque()),
    .listTail:               RPointer(ROpaque()),
    .width:                  RInt(),
    .height:                 RInt(),
    .customAllocatorContext: RPointer(RVoid()),
    .framesSubmitted:        RInt(),
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<MsfGifStateD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, struct, MsfGifStateD.new, MsfGifStateD.pointer);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        
  
  int get width => op?.readInt(struct.offset(.width)) ?? 0;

  int get height => op?.readInt(struct.offset(.height)) ?? 0;

  int get framesSubmitted => op?.readInt(struct.offset(.framesSubmitted)) ?? 0;

  MsfGifStateD({ super.op });

  factory MsfGifStateD.zero() => .new();

  @override
  MsfGifStateD clone() => .new(op: op);

  @override
  String signature() => '$structName(width: $width, height: $height, framesSubmitted: $framesSubmitted)';
}