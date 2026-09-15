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

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final StructType<ModelAnimationD> struct = .new(
    factory: ModelAnimationD.new,
    layout: .aligned<ModelAnimationField>({
      .name:          RArray(RChar(), BASE_nameLength), // Animation name
      .boneCount:     RInt(), // Number of bones (per pose)
      .keyframeCount: RInt(), // Number of animation key frames
      .keyframePoses: RPointer(RPointer(RStruct(TransformD.struct))), // Animation sequence keyframe poses [keyframe][pose]
    }),
  );

  /// Raw memory layout of this object.
  static final StructLayout<ModelAnimationField> structLayout = struct.layoutOf();

  /// Field descriptor for [name].
  static final field_name = structLayout.stringAsCharArray(.name);
  /// Field descriptor for [boneCount].
  static final field_boneCount = structLayout.scalar<int, RInt>(.boneCount);
  /// Field descriptor for [keyframeCount].
  static final field_keyframeCount = structLayout.scalar<int, RInt>(.keyframeCount);
  /// Field descriptor for [keyframePoses].
  static final field_keyframePoses = structLayout.pointerPointerStructArray<TransformD>(.keyframePoses);

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
  String signature() => '$structName(name: $name, boneCount: $boneCount, keyframeCount: $keyframeCount)';
}