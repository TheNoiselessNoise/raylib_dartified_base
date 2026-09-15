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

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final StructType<MsfGifResultD> struct = .new(
    factory: MsfGifResultD.new,
    layout: .aligned<MsfGifResultField>({
      .data:           RPointer(RVoid()),
      .dataSize:       RSize(),
      .allocSize:      RSize(),
      .contextPointer: RPointer(RVoid()),
    }),
  );

  /// Raw memory layout of this object.
  static final StructLayout<MsfGifResultField> structLayout = struct.layoutOf();

  /// Field descriptor for [data].
  static final field_data = structLayout.pointerUnknown<RVoid>(.data);
  /// Field descriptor for [dataSize].
  static final field_dataSize = structLayout.scalar<int, RSize>(.dataSize);
  /// Field descriptor for [allocSize].
  static final field_allocSize = structLayout.scalar<int, RSize>(.allocSize);
  /// Field descriptor for [contextPointer].
  static final field_contextPointer = structLayout.pointerUnknown<RVoid>(.contextPointer);

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
  String signature() => '$structName(dataSize: $dataSize, allocSize: $allocSize)';
}