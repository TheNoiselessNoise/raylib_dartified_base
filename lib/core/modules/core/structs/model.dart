part of '../../../raylib_dartified_base.dart';

enum ModelField with StructFields {
  transform,
  meshCount,
  materialCount,
  meshes,
  materials,
  meshMaterial,
  skeleton,
  currentPose,
  boneMatrices,
}

// TODO: translate

/// Model, meshes, materials and animation data
class ModelD extends RaylibStruct<ModelD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Raw memory layout of the C struct (field order, offsets, and backing [RType]s).
  static final StructLayout<ModelField> struct = .aligned({
    .transform:     RStruct(MatrixD.struct), // Local transform matrix
    .meshCount:     RInt(), // Number of meshes
    .materialCount: RInt(), // Number of materials
    .meshes:        RPointer(RStruct(MeshD.struct)), // Meshes array
    .materials:     RPointer(RStruct(MaterialD.struct)), // Materials array
    .meshMaterial:  RPointer(RInt()), // Mesh material number

    // Animation data
    .skeleton:      RStruct(ModelSkeletonD.struct), // Skeleton for animation

    // Runtime animation data (CPU/GPU skinning)
    .currentPose:   RPointer(RStruct(TransformD.struct)), // Current animation pose (Transform[])
    .boneMatrices:  RPointer(RStruct(MatrixD.struct)), // Bones animated transformation matrices
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<ModelD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, struct, ModelD.new, ModelD.pointer);

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
    structOnOp((p) => _transform.structReadFrom(p.offsetBy(struct.offset(.transform))));
    return _transform;
  }
  set transform(MatrixD value) {
    _transform = value;
    structOnOp((p) => value.structWriteInto(p.offsetBy(struct.offset(.transform))));
  }

  int _meshCount;
  /// Number of meshes
  int get meshCount {
    structOnOp((p) => _meshCount = p.readInt(struct.offset(.meshCount)));
    return _meshCount;
  }
  set meshCount(int value) {
    _meshCount = value;
    structOnOp((p) => p.writeInt(value, struct.offset(.meshCount)));
  }

  int _materialCount;
  /// Number of materials
  int get materialCount {
    structOnOp((p) => _materialCount = p.readInt(struct.offset(.materialCount)));
    return _materialCount;
  }
  set materialCount(int value) {
    _materialCount = value;
    structOnOp((p) => p.writeInt(value, struct.offset(.materialCount)));
  }
  
  late LiveListPointerStruct<MeshD> _meshes;
  /// Meshes array
  LiveListPointerStruct<MeshD> get meshes {
    structOnOp((p) => _meshes.ptr = p.readPtr(struct.offset(.meshes)));
    return _meshes;
  }
  set meshes(List<MeshD> value) {
    structOnOp((p) => _meshes.ptr = p.readPtr(struct.offset(.meshes)));
    _meshes.inner = value;
  }
  
  late LiveListPointerStruct<MaterialD> _materials;
  /// Materials array
  LiveListPointerStruct<MaterialD> get materials {
    structOnOp((p) => _materials.ptr = p.readPtr(struct.offset(.materials)));
    return _materials;
  }
  set materials(List<MaterialD> value) {
    structOnOp((p) => _materials.ptr = p.readPtr(struct.offset(.materials)));
    _materials.inner = value;
  }

  late LiveListPointerScalar<int, RInt> _meshMaterial;
  /// Mesh material number
  LiveListPointerScalar<int, RInt> get meshMaterial {
    structOnOp((p) => _meshMaterial.ptr = p.readPtr(struct.offset(.meshMaterial)));
    return _meshMaterial;
  }
  set meshMaterial(List<int> value) {
    structOnOp((p) => _meshMaterial.ptr = p.readPtr(struct.offset(.meshMaterial)));
    _meshMaterial.inner = value;
  }

  ModelSkeletonD _skeleton;
  /// Skeleton for animation
  ModelSkeletonD get skeleton {
    structOnOp((p) => _skeleton.structReadFrom(p.offsetBy(struct.offset(.skeleton))));
    return _skeleton;
  }
  set skeleton(ModelSkeletonD value) {
    _skeleton = value;
    structOnOp((p) => value.structWriteInto(p.offsetBy(struct.offset(.skeleton))));
  }
  
  late LiveListPointerStruct<TransformD> _currentPose;
  /// Current animation pose (Transform[])
  LiveListPointerStruct<TransformD> get currentPose {
    structOnOp((p) => _currentPose.ptr = p.readPtr(struct.offset(.currentPose)));
    return _currentPose;
  }
  set currentPose(List<TransformD> value) {
    structOnOp((p) => _currentPose.ptr = p.readPtr(struct.offset(.currentPose)));
    _currentPose.inner = value;
  }
  
  late LiveListPointerStruct<MatrixD> _boneMatrices;
  /// Bones animated transformation matrices
  LiveListPointerStruct<MatrixD> get boneMatrices {
    structOnOp((p) => _boneMatrices.ptr = p.readPtr(struct.offset(.boneMatrices)));
    return _boneMatrices;
  }
  set boneMatrices(List<MatrixD> value) {
    structOnOp((p) => _boneMatrices.ptr = p.readPtr(struct.offset(.boneMatrices)));
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
    _meshes = .new(MeshD.pointer, meshes, MeshD.pointer(op?.readPtr(struct.offset(.meshes))));
    _materials = .new(MaterialD.pointer, materials, MaterialD.pointer(op?.readPtr(struct.offset(.materials))));

    _meshMaterial = .new(
      (p, i) => p[i],
      (p, i, v) => p[i] = v,
      meshMaterial ?? [],
      op?.offsetBy(struct.offset(.meshMaterial)),
    );

    _currentPose = .new(TransformD.pointer, currentPose, TransformD.pointer(op?.readPtr(struct.offset(.currentPose))));
    _boneMatrices = .new(MatrixD.pointer, boneMatrices, MatrixD.pointer(op?.readPtr(struct.offset(.boneMatrices))));
  }

  factory ModelD.zero() => .new();

  @override
  ModelD setDart(ModelD o) {
    transform.setDart(o.transform);
    meshes = .from(o.meshes);
    materials = .from(o.materials);
    meshMaterial = .from(o.meshMaterial);
    currentPose = .from(o.currentPose);
    boneMatrices = .from(o.boneMatrices);
    return this;
  }

  @override
  void structAllocateInto(RaylibTemp temp, MemoryPointer p, String key) {
    if (meshes.inner.isNotEmpty) {
      _meshes.structPtr = temp.Mesh$.ArrayStruct(_meshes.inner, key: '${key}_meshes');
    }
    if (materials.inner.isNotEmpty) {
      _materials.structPtr = temp.Material$.ArrayStruct(_materials.inner, key: '${key}_materials');
    }
    if (meshMaterial.inner.isNotEmpty) {
      _meshMaterial.ptr = temp.Int$.Array(_meshMaterial.inner, key: '${key}_meshMaterial').cast();
    }
    if (currentPose.inner.isNotEmpty) {
      _currentPose.structPtr = temp.Transform$.ArrayStruct(_currentPose.inner, key: '${key}_currentPose');
    }
    if (boneMatrices.inner.isNotEmpty) {
      _boneMatrices.structPtr = temp.Matrix$.ArrayStruct(_boneMatrices.inner, key: '${key}_boneMatrices');
    }
  }

  @override
  void structWriteInto(MemoryPointer p) {
    _transform.structWriteInto(p.offsetBy(struct.offset(.transform)));
    p.writeInt(_meshCount, struct.offset(.meshCount));
    p.writeInt(_materialCount, struct.offset(.materialCount));
    p.writePtr(_meshes.ptr, struct.offset(.meshes));
    p.writePtr(_materials.ptr, struct.offset(.materials));
    p.writePtr(_meshMaterial.ptr, struct.offset(.meshMaterial));
    _skeleton.structWriteInto(p.offsetBy(struct.offset(.skeleton)));
    p.writePtr(_currentPose.ptr, struct.offset(.currentPose));
    p.writePtr(_boneMatrices.ptr, struct.offset(.boneMatrices));

    _meshes.onStructPointer((p) => p.writeArray(_meshes.inner));
    _materials.onStructPointer((p) => p.writeArray(_materials.inner));
    _meshMaterial.onPointer((p) => p.writeArray(_meshMaterial.inner));
    _currentPose.onStructPointer((p) => p.writeArray(_currentPose.inner));
    _boneMatrices.onStructPointer((p) => p.writeArray(_boneMatrices.inner));
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _transform.structReadFrom(p.offsetBy(struct.offset(.transform)));
    _meshCount = p.readInt(struct.offset(.meshCount));
    _materialCount = p.readInt(struct.offset(.materialCount));
    _meshes.ptr = p.readPtr(struct.offset(.meshes));
    _materials.ptr = p.readPtr(struct.offset(.materials));
    _meshMaterial.ptr = p.readPtr(struct.offset(.meshMaterial));
    _skeleton.structReadFrom(p.offsetBy(struct.offset(.skeleton)));
    _currentPose.ptr = p.readPtr(struct.offset(.currentPose));
    _boneMatrices.ptr = p.readPtr(struct.offset(.boneMatrices));

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