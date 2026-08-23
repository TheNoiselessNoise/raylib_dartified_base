part of '../../../raylib_dartified_base.dart';

enum ModelSkeletonField {
  boneCount,
  bones,
  bindPose
}

/// Skeleton, animation bones hierarchy.
class ModelSkeletonD extends RaylibStruct<ModelSkeletonD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  static final int byteSize = structLayout.byteSize;
  static final int alignment = structLayout.alignment;
  static final StructLayout<ModelSkeletonField> structLayout = .aligned(structFields);
  static final Map<ModelSkeletonField, RType> structFields = {
    .boneCount: RInt32(),
    .bones:     RPointer<RStruct>(),
    .bindPose:  RPointer<RStruct>(),
  };

  static StructPointer<ModelSkeletonD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, structLayout, ModelSkeletonD.new);

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
    structOnOp((p) => _boneCount = p.readInt32(structLayout.offset(.boneCount)));
    return _boneCount;
  }
  set boneCount(int value) {
    _boneCount = value;
    structOnOp((p) => p.writeInt32(value, structLayout.offset(.boneCount)));
  }

  late LiveListPointerStruct<BoneInfoD> _bones;
  /// Bones information (skeleton)
  LiveListPointerStruct<BoneInfoD> get bones {
    structOnOp((p) => _bones.ptr = p.readPtr(structLayout.offset(.bones)));
    return _bones;
  }
  set bones(List<BoneInfoD> value) {
    _bones.inner = value;
    structOnOp((p) {
      _bones.ptr = p.readPtr(structLayout.offset(.bones));
      p.writeInt32(value.length, structLayout.offset(.boneCount));
    });
  }

  late LiveListPointerStruct<TransformD> _bindPose;
  /// Bones base transformation
  LiveListPointerStruct<TransformD> get bindPose {
    structOnOp((p) => _bindPose.ptr = p.readPtr(structLayout.offset(.bindPose)));
    return _bindPose;
  }
  set bindPose(List<TransformD> value) {
    structOnOp((p) {
      _bindPose.ptr = p.readPtr(structLayout.offset(.bindPose));
      p.writeInt32(value.length, structLayout.offset(.boneCount));
    });
    _bindPose.inner = value;
  }

  ModelSkeletonD({
    super.op,
    List<BoneInfoD>? bones,
    List<TransformD>? bindPose,
  }) : _boneCount = bones?.length ?? 0 {
    _bones = .new(
      bones ?? [],
      BoneInfoD.pointer(op?.readPtr(structLayout.offset(.bones))),
    );
    _bindPose = .new(
      bindPose ?? [],
      TransformD.pointer(op?.readPtr(structLayout.offset(.bindPose))),
    );
  }

  factory ModelSkeletonD.zero() => .new();

  @override
  ModelSkeletonD setD(ModelSkeletonD o) {
    boneCount = o.boneCount;
    bones = .from(o.bones);
    bindPose = .from(o.bindPose); 
    return this;
  }

  @override
  void structAllocateInto(RaylibTemp temp, MemoryPointer<RStruct> p, String key) {
    if (_bones.inner.isNotEmpty) {
      _bones.structPtr = temp.BoneInfo$.Array(_bones.inner, key: '${key}_bones');
    }
    if (_bindPose.inner.isNotEmpty) {
      _bindPose.structPtr = temp.Transform$.Array(_bindPose.inner, key: '${key}_bindPose');
    }
  }

  @override
  void writeInto(MemoryPointer<RStruct> p) {
    p.writeInt32(_boneCount, structLayout.offset(.boneCount));
    p.writePtr(_bones.ptr, structLayout.offset(.bones));
    p.writePtr(_bindPose.ptr, structLayout.offset(.bindPose));

    _bones.onStructPointer((p) => p.writeArray(_bones.inner));
    _bindPose.onStructPointer((p) => p.writeArray(_bindPose.inner));
  }

  @override
  void readFrom(MemoryPointer<RStruct> p) {
    _boneCount = p.readInt32(structLayout.offset(.boneCount));
    _bones.ptr = p.readPtr(structLayout.offset(.bones));
    _bindPose.ptr = p.readPtr(structLayout.offset(.bindPose));

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