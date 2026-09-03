part of '../../../raylib_dartified_base.dart';

enum ModelSkeletonField with StructFields {
  boneCount,
  bones,
  bindPose,
}

// TODO: translate

/// Skeleton, animation bones hierarchy
class ModelSkeletonD extends RaylibStruct<ModelSkeletonD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Raw memory layout of the C struct (field order, offsets, and backing [RType]s).
  static final StructLayout<ModelSkeletonField> struct = .aligned({
    .boneCount: RInt(), // Number of bones
    .bones:     RPointer(RStruct(BoneInfoD.struct)), // Bones information (skeleton)
    .bindPose:  RPointer(RStruct(TransformD.struct)), // Bones base transformation (Transform[])
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<ModelSkeletonD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, struct, ModelSkeletonD.new, ModelSkeletonD.pointer);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        
  
  int _boneCount;
  /// Number of bones
  int get boneCount {
    structOnOp((p) => _boneCount = p.readInt(struct.offset(.boneCount)));
    return _boneCount;
  }
  set boneCount(int value) {
    _boneCount = value;
    structOnOp((p) => p.writeInt(value, struct.offset(.boneCount)));
  }

  late LiveListPointerStruct<BoneInfoD> _bones;
  /// Bones information (skeleton)
  LiveListPointerStruct<BoneInfoD> get bones {
    structOnOp((p) => _bones.ptr = p.readPtr(struct.offset(.bones)));
    return _bones;
  }
  set bones(List<BoneInfoD> value) {
    _bones.inner = value;
    structOnOp((p) {
      _bones.ptr = p.readPtr(struct.offset(.bones));
      p.writeInt(value.length, struct.offset(.boneCount));
    });
  }

  late LiveListPointerStruct<TransformD> _bindPose;
  /// Bones base transformation (Transform[])
  LiveListPointerStruct<TransformD> get bindPose {
    structOnOp((p) => _bindPose.ptr = p.readPtr(struct.offset(.bindPose)));
    return _bindPose;
  }
  set bindPose(List<TransformD> value) {
    structOnOp((p) {
      _bindPose.ptr = p.readPtr(struct.offset(.bindPose));
      p.writeInt(value.length, struct.offset(.boneCount));
    });
    _bindPose.inner = value;
  }

  ModelSkeletonD({
    super.op,
    List<BoneInfoD>? bones,
    List<TransformD>? bindPose,
  }) : _boneCount = bones?.length ?? 0 {
    _bones = .new(BoneInfoD.pointer, bones, BoneInfoD.pointer(op?.readPtr(struct.offset(.bones))));
    _bindPose = .new(TransformD.pointer, bindPose, TransformD.pointer(op?.readPtr(struct.offset(.bindPose))));
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
  void structAllocateInto(RaylibTemp temp, MemoryPointer p, String key) {
    if (_bones.inner.isNotEmpty) {
      _bones.structPtr = temp.BoneInfo$.ArrayStruct(_bones.inner, key: '${key}_bones');
    }
    if (_bindPose.inner.isNotEmpty) {
      _bindPose.structPtr = temp.Transform$.ArrayStruct(_bindPose.inner, key: '${key}_bindPose');
    }
  }

  @override
  void structWriteInto(MemoryPointer p) {
    p.writeInt(_boneCount, struct.offset(.boneCount));
    p.writePtr(_bones.ptr, struct.offset(.bones));
    p.writePtr(_bindPose.ptr, struct.offset(.bindPose));

    _bones.onStructPointer((p) => p.writeArray(_bones.inner));
    _bindPose.onStructPointer((p) => p.writeArray(_bindPose.inner));
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _boneCount = p.readInt(struct.offset(.boneCount));
    _bones.ptr = p.readPtr(struct.offset(.bones));
    _bindPose.ptr = p.readPtr(struct.offset(.bindPose));

    _bones.onStructPointer((p) => _bones.raw = p.readArray(_boneCount));
    _bindPose.onStructPointer((p) => _bindPose.raw = p.readArray(_boneCount));
  }

  @override
  ModelSkeletonD clone() => .new(
    op: op,
    bones: bones.map((x) => x.clone()).toList(),
    bindPose: bindPose.map((x) => x.clone()).toList(),
  );

  @override
  String signature() => '$structName(boneCount: $boneCount, bones: ${bones.length}, bindPose: ${bindPose.length})';
}