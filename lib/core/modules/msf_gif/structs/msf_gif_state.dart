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

class _MsfGifCookedFrame extends RaylibStructView<_MsfGifCookedFrame> {
  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final StructType<_MsfGifCookedFrame> struct = ._builtin(
    factory: _MsfGifCookedFrame.new,
    layout: .aligned<MsfGifCookedFrameField>({
      .pixels: RPointer(RUint32()),
      .depth:  RInt(),
      .count:  RInt(),
      .rbits:  RInt(),
      .gbits:  RInt(),
      .bbits:  RInt(),
    }),
  );

  _MsfGifCookedFrame({super.op});
}

/// MsfGifState
class MsfGifState extends RaylibStructView<MsfGifState> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final StructType<MsfGifState> struct = ._builtin(
    factory: MsfGifState.new,
    layout: .aligned<MsfGifStateField>({
      .fileWriteFunc:          RPointer(RFunction<MsfGifFileWriteCallbackBase>()),
      .fileWriteData:          RPointer(RVoid()),
      .previousFrame:          RStruct(_MsfGifCookedFrame.struct),
      .currentFrame:           RStruct(_MsfGifCookedFrame.struct),
      .lzwMem:                 RPointer(RInt16()),
      .listHead:               RPointer(ROpaque()),
      .listTail:               RPointer(ROpaque()),
      .width:                  RInt(),
      .height:                 RInt(),
      .customAllocatorContext: RPointer(RVoid()),
      .framesSubmitted:        RInt(),
    }),
  );

  /// Raw memory layout of this object.
  static final StructLayout<MsfGifStateField> structLayout = struct.layoutOf();

  /// Field descriptor for [width].
  static final field_width = structLayout.scalar<int, RInt>(.width);
  /// Field descriptor for [height].
  static final field_height = structLayout.scalar<int, RInt>(.height);
  /// Field descriptor for [framesSubmitted].
  static final field_framesSubmitted = structLayout.scalar<int, RInt>(.framesSubmitted);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        
  
  int get width => field_width.readOr(op, 0);
  
  int get height => field_height.readOr(op, 0);
  
  int get framesSubmitted => field_framesSubmitted.readOr(op, 0);

  MsfGifState({ super.op });

  factory MsfGifState.zero() => .new();

  @override
  String signature() => '$structName(width: $width, height: $height, framesSubmitted: $framesSubmitted)';
}