part of '../../../raylib_dartified_base.dart';

enum ModelAnimationField with StructFields {
  name,
  boneCount,
  keyframeCount,
  keyframePoses,
}

/// ModelAnimation, contains a full animation sequence
class ModelAnimationD extends RaylibStructView<ModelAnimationD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  @override
  StructLayout<ModelAnimationField> get structLayout => struct;

  /// Raw memory layout of the C struct (field order, offsets, and backing [RType]s).
  static final StructLayout<ModelAnimationField> struct = .aligned({
    .name:          RArray(RChar(), BASE_nameLength), // Animation name
    .boneCount:     RInt(), // Number of bones (per pose)
    .keyframeCount: RInt(), // Number of animation key frames
    .keyframePoses: RPointer(RPointer(RStruct(TransformD.struct))), // Animation sequence keyframe poses [keyframe][pose]
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<ModelAnimationD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, struct, ModelAnimationD.new, ModelAnimationD.pointer);

  static final field_name = struct.stringAsCharArray(.name);
  static final field_boneCount = struct.scalar<int, RInt>(.boneCount);
  static final field_keyframeCount = struct.scalar<int, RInt>(.keyframeCount);
  static final field_keyframePoses = struct.pointerPointerStructArray(.keyframePoses, TransformD.pointer);

  //   ░██████    ░██████   ░███    ░██   ░██████   ░██████████
  //  ░██   ░██  ░██   ░██  ░████   ░██  ░██   ░██      ░██    
  // ░██        ░██     ░██ ░██░██  ░██ ░██             ░██    
  // ░██        ░██     ░██ ░██ ░██ ░██  ░████████      ░██    
  // ░██        ░██     ░██ ░██  ░██░██         ░██     ░██    
  //  ░██   ░██  ░██   ░██  ░██   ░████  ░██   ░██      ░██    
  //   ░██████    ░██████   ░██    ░███   ░██████       ░██    

  /// Size of the native [name] buffer.
  static int get BASE_nameLength => 32;

  /// Size of the native [name] buffer.
  int get nameLength => BASE_nameLength;

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  /// Animation name
  String get name => field_name.readOr(op, '');

  /// Number of bones (per pose)
  int get boneCount => field_boneCount.readOr(op, 0);

  /// Number of animation key frames
  int get keyframeCount => field_keyframeCount.readOr(op, 0);

  StructLiveListStructNested<TransformD> get keyframePoses => field_keyframePoses.liveNested(() => op, []);

  ModelAnimationD({ super.op });

  factory ModelAnimationD.zero() => .new();

  @override
  ModelAnimationD clone() => .new(op: op);

  @override
  String signature() => '$structName(name: $name, boneCount: $boneCount, keyframeCount: $keyframeCount)';
}