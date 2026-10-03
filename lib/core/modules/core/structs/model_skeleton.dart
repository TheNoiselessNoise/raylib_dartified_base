part of '../../../raylib_dartified_base.dart';

enum ModelSkeletonField with StructFields {
  boneCount,
  bones,
  bindPose,
}

/// Skeleton, animation bones hierarchy
class ModelSkeleton extends RaylibStruct<ModelSkeleton> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final StructType<ModelSkeleton> struct = ._builtin(
    factory: ModelSkeleton.new,
    layout: .aligned<ModelSkeletonField>({
      .boneCount: RInt(), // Number of bones
      .bones:     RPointer(RStruct(BoneInfo.struct)), // Bones information (skeleton)
      .bindPose:  RPointer(RStruct(Transform.struct)), // Bones base transformation (Transform[])
    }),
  );

  /// Raw memory layout of this object.
  static final StructLayout<ModelSkeletonField> structLayout = struct.layoutOf();

  /// Field descriptor for [boneCount].
  static final field_boneCount = structLayout.scalar<int, RInt>(.boneCount);
  /// Field descriptor for [bones].
  static final field_bones = structLayout.pointerStructArray<BoneInfo>(.bones);
  /// Field descriptor for [bindPose].
  static final field_bindPose = structLayout.pointerStructArray<Transform>(.bindPose);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  int _boneCount;
  /// Number of bones
  int get boneCount => _boneCount = field_boneCount.readOr(op, _boneCount);
  set boneCount(int value) => _boneCount = field_boneCount.writeOr(op, value);

  late final StructLiveListStruct<BoneInfo> _bones;
  /// Bones information (skeleton)
  StructLiveListStruct<BoneInfo> get bones => _bones;
  set bones(List<BoneInfo> value) => _bones.inner = value;

  late final StructLiveListStruct<Transform> _bindPose;
  /// Bones base transformation (Transform[])
  StructLiveListStruct<Transform> get bindPose => _bindPose;
  set bindPose(List<Transform> value) => _bindPose.inner = value;
  
  ModelSkeleton({
    super.op,
    int? boneCount,
    List<BoneInfo>? bones,
    List<Transform>? bindPose,
  }) : _boneCount = boneCount ?? bones?.length ?? 0 {
    _bones = field_bones.live(() => op, bones ?? []);
    _bindPose = field_bindPose.live(() => op, bindPose ?? []);
  }

  factory ModelSkeleton.zero() => .new();

  @override
  ModelSkeleton setDart(ModelSkeleton o) {
    boneCount = o.boneCount;
    bones = .from(o.bones);
    bindPose = .from(o.bindPose); 
    return this;
  }

  @override
  void structAllocateInto(RaylibTemp temp, MemoryPointer p, String key) {
    field_bones.allocate(temp, p, '${key}_bones', count: boneCount);
    field_bindPose.allocate(temp, p, '${key}_bindPose', count: boneCount);
  }

  @override
  void structWriteInto(MemoryPointer p) {
    field_boneCount.write(p, _boneCount);
    _bones.writeInto(p);
    _bindPose.writeInto(p);
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _boneCount = field_boneCount.read(p);
    _bones.readFrom(p, count: boneCount);
    _bindPose.readFrom(p, count: boneCount);
  }

  @override
  ModelSkeleton clone() => .new(
    op: op,
    boneCount: boneCount,
    bones: bones.map((x) => x.clone()).toList(),
    bindPose: bindPose.map((x) => x.clone()).toList(),
  );

  @override
  String signature() => '$structName(boneCount: $boneCount, bones: ${bones.length}, bindPose: ${bindPose.length})';
}