part of '../../../raylib_dartified_base.dart';

enum ModelSkeletonField with StructFields {
  boneCount,
  bones,
  bindPose,
}

/// Skeleton, animation bones hierarchy
class ModelSkeletonD extends RaylibStruct<ModelSkeletonD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  @override
  StructLayout<ModelSkeletonField> get structLayout => struct;

  /// Raw memory layout of the C struct (field order, offsets, and backing [RType]s).
  static final StructLayout<ModelSkeletonField> struct = .aligned({
    .boneCount: RInt(), // Number of bones
    .bones:     RPointer(RStruct(BoneInfoD.struct)), // Bones information (skeleton)
    .bindPose:  RPointer(RStruct(TransformD.struct)), // Bones base transformation (Transform[])
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<ModelSkeletonD> pointer(MemoryPointerHandle? ptr)
    => .nullable(ptr, struct, ModelSkeletonD.new, ModelSkeletonD.pointer);

  static final _boneCountF = struct.scalar<int, RInt>(.boneCount);
  static final _bonesF = struct.pointerStructArray(.bones, BoneInfoD.pointer);
  static final _bindPoseF = struct.pointerStructArray(.bindPose, TransformD.pointer);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  int _boneCount;
  /// Number of bones
  int get boneCount => _boneCount = _boneCountF.readOr(op, _boneCount);
  set boneCount(int value) => _boneCount = _boneCountF.writeIf(op, value);

  late final StructLiveListStruct<BoneInfoD> _bones;
  /// Bones information (skeleton)
  StructLiveListStruct<BoneInfoD> get bones => _bones;
  set bones(List<BoneInfoD> value) => _bones.inner = value;

  late final StructLiveListStruct<TransformD> _bindPose;
  /// Bones base transformation (Transform[])
  StructLiveListStruct<TransformD> get bindPose => _bindPose;
  set bindPose(List<TransformD> value) => _bindPose.inner = value;
  
  ModelSkeletonD({
    super.op,
    int? boneCount,
    List<BoneInfoD>? bones,
    List<TransformD>? bindPose,
  }) : _boneCount = boneCount ?? bones?.length ?? 0 {
    _bones = _bonesF.live(() => op, bones ?? []);
    _bindPose = _bindPoseF.live(() => op, bindPose ?? []);
  }

  factory ModelSkeletonD.zero() => .new();

  @override
  ModelSkeletonD setDart(ModelSkeletonD o) {
    boneCount = o.boneCount;
    bones = .from(o.bones);
    bindPose = .from(o.bindPose); 
    return this;
  }

  @override
  void structAllocateInto(RaylibTemp temp, MemoryPointerHandle p, String key) {
    if (bones.inner.isNotEmpty) {
      _bonesF.allocate(temp, p, '${key}_bones', count: _bones.inner.length);
    }
    if (bindPose.inner.isNotEmpty) {
      _bindPoseF.allocate(temp, p, '${key}_bindPose', count: _bindPose.inner.length);
    }
  }

  @override
  void structWriteInto(MemoryPointerHandle p) {
    _boneCountF.write(p, _boneCount);
    _bones.writeInto(p);
    _bindPose.writeInto(p);
  }

  @override
  void structReadFrom(MemoryPointerHandle p) {
    _boneCount = _boneCountF.read(p);
    _bones.readFrom(p, count: boneCount);
    _bindPose.readFrom(p, count: boneCount);
  }

  @override
  ModelSkeletonD clone() => .new(
    op: op,
    boneCount: boneCount,
    bones: bones.map((x) => x.clone()).toList(),
    bindPose: bindPose.map((x) => x.clone()).toList(),
  );

  @override
  String signature() => '$structName(boneCount: $boneCount, bones: ${bones.length}, bindPose: ${bindPose.length})';
}