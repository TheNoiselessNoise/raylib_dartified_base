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

  @override
  StructLayout<MsfGifStateField> get structLayout => struct;

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
    .fileWriteFunc:          RPointer(RFunction<MsfGifFileWriteCallbackBase>()),
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

  static final _widthF = struct.scalar<int, RInt>(.width);
  static final _heightF = struct.scalar<int, RInt>(.height);
  static final _framesSubmittedF = struct.scalar<int, RInt>(.framesSubmitted);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        
  
  int get width => _widthF.readOr(op?.ptr, 0);
  
  int get height => _heightF.readOr(op?.ptr, 0);
  
  int get framesSubmitted => _framesSubmittedF.readOr(op?.ptr, 0);

  MsfGifStateD({ super.op });

  factory MsfGifStateD.zero() => .new();

  @override
  MsfGifStateD clone() => .new(op: op);

  @override
  String signature() => '$structName(width: $width, height: $height, framesSubmitted: $framesSubmitted)';
}