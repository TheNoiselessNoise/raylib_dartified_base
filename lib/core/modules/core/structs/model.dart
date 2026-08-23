part of '../../../raylib_dartified_base.dart';

enum ModelField {
  transform,
  meshCount,
  materialCount,
  meshes,
  materials,
  meshMaterial,
  skeleton,
  currentPose,
  boneMatrices
}

/// Meshes, materials and animation data.
class ModelD extends RaylibStruct<ModelD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  static final int byteSize = structLayout.byteSize;
  static final int alignment = structLayout.alignment;
  static final StructLayout<ModelField> structLayout = .aligned(structFields);
  static final Map<ModelField, RType> structFields = {
    .transform:     RStruct(MatrixD.structLayout),
    .meshCount:     RInt32(),
    .materialCount: RInt32(),
    .meshes:        RPointer<RStruct>(),
    .materials:     RPointer<RStruct>(),
    .meshMaterial:  RPointer<RInt32>(),
    .skeleton:      RStruct(ModelSkeletonD.structLayout),
    .currentPose:   RPointer<RStruct>(),
    .boneMatrices:  RPointer<RStruct>(),
  };

  static StructPointer<ModelD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, structLayout, ModelD.new);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  MatrixD _transform;
  /// Local transform matrix
  MatrixD get transform {
    structOnOp((p) => _transform.readFrom(p.offsetBy(structLayout.offset(.transform))));
    return _transform;
  }
  set transform(MatrixD value) {
    _transform = value;
    structOnOp((p) => value.writeInto(p.offsetBy(structLayout.offset(.transform))));
  }

  int _meshCount;
  /// Number of meshes
  int get meshCount {
    structOnOp((p) => _meshCount = p.readInt32(structLayout.offset(.meshCount)));
    return _meshCount;
  }
  set meshCount(int value) {
    _meshCount = value;
    structOnOp((p) => p.writeInt32(value, structLayout.offset(.meshCount)));
  }

  int _materialCount;
  /// Number of materials
  int get materialCount {
    structOnOp((p) => _materialCount = p.readInt32(structLayout.offset(.materialCount)));
    return _materialCount;
  }
  set materialCount(int value) {
    _materialCount = value;
    structOnOp((p) => p.writeInt32(value, structLayout.offset(.materialCount)));
  }
  
  late LiveListPointerStruct<MeshD> _meshes;
  /// Meshes array
  LiveListPointerStruct<MeshD> get meshes {
    structOnOp((p) => _meshes.ptr = p.readPtr(structLayout.offset(.meshes)));
    return _meshes;
  }
  set meshes(List<MeshD> value) {
    structOnOp((p) => _meshes.ptr = p.readPtr(structLayout.offset(.meshes)));
    _meshes.inner = value;
  }
  
  late LiveListPointerStruct<MaterialD> _materials;
  /// Materials array
  LiveListPointerStruct<MaterialD> get materials {
    structOnOp((p) => _materials.ptr = p.readPtr(structLayout.offset(.materials)));
    return _materials;
  }
  set materials(List<MaterialD> value) {
    structOnOp((p) => _materials.ptr = p.readPtr(structLayout.offset(.materials)));
    _materials.inner = value;
  }

  late LiveListPointerScalar<int, RInt32> _meshMaterial;
  /// Mesh-to-material index mapping
  LiveListPointerScalar<int, RInt32> get meshMaterial {
    structOnOp((p) => _meshMaterial.ptr = p.readPtr(structLayout.offset(.meshMaterial)));
    return _meshMaterial;
  }
  set meshMaterial(List<int> value) {
    structOnOp((p) => _meshMaterial.ptr = p.readPtr(structLayout.offset(.meshMaterial)));
    _meshMaterial.inner = value;
  }

  ModelSkeletonD _skeleton;
  /// Skeleton for animation
  ModelSkeletonD get skeleton {
    structOnOp((p) => _skeleton.readFrom(p.offsetBy(structLayout.offset(.skeleton))));
    return _skeleton;
  }
  set skeleton(ModelSkeletonD value) {
    _skeleton = value;
    structOnOp((p) => value.writeInto(p.offsetBy(structLayout.offset(.skeleton))));
  }
  
  late LiveListPointerStruct<TransformD> _currentPose;
  /// Current animation pose
  LiveListPointerStruct<TransformD> get currentPose {
    structOnOp((p) => _currentPose.ptr = p.readPtr(structLayout.offset(.currentPose)));
    return _currentPose;
  }
  set currentPose(List<TransformD> value) {
    structOnOp((p) => _currentPose.ptr = p.readPtr(structLayout.offset(.currentPose)));
    _currentPose.inner = value;
  }
  
  late LiveListPointerStruct<MatrixD> _boneMatrices;
  /// Bones animated transformation matrices
  LiveListPointerStruct<MatrixD> get boneMatrices {
    structOnOp((p) => _boneMatrices.ptr = p.readPtr(structLayout.offset(.boneMatrices)));
    return _boneMatrices;
  }
  set boneMatrices(List<MatrixD> value) {
    structOnOp((p) => _boneMatrices.ptr = p.readPtr(structLayout.offset(.boneMatrices)));
    _boneMatrices.inner = value;
  }

  ModelD({
    super.op,
    MatrixD? transform,
    List<MeshD>? meshes,
    List<MaterialD>? materials,
    List<int>? meshMaterial,
    ModelSkeletonD? skeleton,
    List<TransformD>? currentPose,
    List<MatrixD>? boneMatrices,
  }) :
    _transform = transform ?? .new(),
    _meshCount = meshes?.length ?? 0,
    _materialCount = materials?.length ?? 0,
    _skeleton = skeleton ?? .new()
  {
    _meshes = .new(
      meshes ?? [],
      MeshD.pointer(op?.readPtr(structLayout.offset(.meshes))),
    );

    _materials = .new(
      materials ?? [],
      MaterialD.pointer(op?.readPtr(structLayout.offset(.materials))),
    );

    _meshMaterial = .new(
      meshMaterial ?? [], RInt32.scalarByteSize,
      (p, i) => p[i],
      (p, i, v) => p[i] = v,
      op?.offsetBy(structLayout.offset(.meshMaterial)),
    );

    _currentPose = .new(
      currentPose ?? [],
      TransformD.pointer(op?.readPtr(structLayout.offset(.currentPose))),
    );

    _boneMatrices = .new(
      boneMatrices ?? [],
      MatrixD.pointer(op?.readPtr(structLayout.offset(.boneMatrices))),
    );
  }

  factory ModelD.zero() => .new();

  @override
  ModelD setD(ModelD o) {
    transform.setD(o.transform);
    meshes = .from(o.meshes);
    materials = .from(o.materials);
    meshMaterial = .from(o.meshMaterial);
    currentPose = .from(o.currentPose);
    boneMatrices = .from(o.boneMatrices);
    return this;
  }

  @override
  void structAllocateInto(RaylibTemp temp, MemoryPointer<RStruct> p, String key) {
    if (meshes.inner.isNotEmpty) {
      _meshes.structPtr = temp.Mesh$.Array(_meshes.inner, key: '${key}_meshes');
    }
    if (materials.inner.isNotEmpty) {
      _materials.structPtr = temp.Material$.Array(_materials.inner, key: '${key}_materials');
    }
    if (meshMaterial.inner.isNotEmpty) {
      _meshMaterial.ptr = temp.Int32$.Array(_meshMaterial.inner, key: '${key}_meshMaterial').cast();
    }
    if (currentPose.inner.isNotEmpty) {
      _currentPose.structPtr = temp.Transform$.Array(_currentPose.inner, key: '${key}_currentPose');
    }
    if (boneMatrices.inner.isNotEmpty) {
      _boneMatrices.structPtr = temp.Matrix$.Array(_boneMatrices.inner, key: '${key}_boneMatrices');
    }
  }

  @override
  void writeInto(MemoryPointer<RStruct> p) {
    _transform.writeInto(p.offsetBy(structLayout.offset(.transform)));
    p.writeInt32(_meshCount, structLayout.offset(.meshCount));
    p.writeInt32(_materialCount, structLayout.offset(.materialCount));
    p.writePtr(_meshes.ptr, structLayout.offset(.meshes));
    p.writePtr(_materials.ptr, structLayout.offset(.materials));
    p.writePtr(_meshMaterial.ptr, structLayout.offset(.meshMaterial));
    _skeleton.writeInto(p.offsetBy(structLayout.offset(.skeleton)));
    p.writePtr(_currentPose.ptr, structLayout.offset(.currentPose));
    p.writePtr(_boneMatrices.ptr, structLayout.offset(.boneMatrices));

    _meshes.onStructPointer((p) => p.writeArray(_meshes.inner));
    _materials.onStructPointer((p) => p.writeArray(_materials.inner));
    _meshMaterial.onPointer((p) => p.writeArray(_meshMaterial.inner));
    _currentPose.onStructPointer((p) => p.writeArray(_currentPose.inner));
    _boneMatrices.onStructPointer((p) => p.writeArray(_boneMatrices.inner));
  }

  @override
  void readFrom(MemoryPointer<RStruct> p) {
    _transform.readFrom(p.offsetBy(structLayout.offset(.transform)));
    _meshCount = p.readInt32(structLayout.offset(.meshCount));
    _materialCount = p.readInt32(structLayout.offset(.materialCount));
    _meshes.ptr = p.readPtr(structLayout.offset(.meshes));
    _materials.ptr = p.readPtr(structLayout.offset(.materials));
    _meshMaterial.ptr = p.readPtr(structLayout.offset(.meshMaterial));
    _skeleton.readFrom(p.offsetBy(structLayout.offset(.skeleton)));
    _currentPose.ptr = p.readPtr(structLayout.offset(.currentPose));
    _boneMatrices.ptr = p.readPtr(structLayout.offset(.boneMatrices));

    _meshes.onStructPointer((p) => _meshes.raw = p.readArray(_meshCount));
    _materials.onStructPointer((p) => _materials.raw = p.readArray(_materialCount));
    _meshMaterial.onPointer((p) => _meshMaterial.raw = p.readArray(_meshCount));
    _currentPose.onStructPointer((p) => _currentPose.raw = p.readArray(_skeleton.boneCount));
    _boneMatrices.onStructPointer((p) => _boneMatrices.raw = p.readArray(_skeleton.boneCount));
  }

  @override
  ModelD clone() => .new(
    op: op,
    transform: transform.clone(),
    meshes: meshes.map((x) => x.clone()).toList(),
    materials: materials.map((x) => x.clone()).toList(),
    meshMaterial: .from(meshMaterial),
    currentPose: currentPose.map((x) => x.clone()).toList(),
    boneMatrices: boneMatrices.map((x) => x.clone()).toList(),
  );

  @override
  String signature() => '$structName(transform: $transform, meshes: $meshCount, materials: $materialCount)';
}