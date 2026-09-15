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

/// Model, meshes, materials and animation data
class ModelD extends RaylibStruct<ModelD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  @override
  StructLayout<ModelField> get structLayout => struct;

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

  static final field_transform = struct.struct(.transform, MatrixD.pointer);
  static final field_meshCount = struct.scalar<int, RInt>(.meshCount);
  static final field_materialCount = struct.scalar<int, RInt>(.materialCount);
  static final field_meshes = struct.pointerStructArray(.meshes, MeshD.pointer);
  static final field_materials = struct.pointerStructArray(.materials, MaterialD.pointer);
  static final field_meshMaterial = struct.pointerScalarArray<int, RInt>(.meshMaterial);
  static final field_skeleton = struct.struct(.skeleton, ModelSkeletonD.pointer);
  static final field_currentPose = struct.pointerStructArray(.currentPose, TransformD.pointer);
  static final field_boneMatrices = struct.pointerStructArray(.boneMatrices, MatrixD.pointer);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  MatrixD _transform;
  /// Local transform matrix
  MatrixD get transform => _transform = field_transform.readOr(op, _transform);
  set transform(MatrixD value) => _transform = field_transform.writeIf(op, value);
  
  int _meshCount;
  /// Number of meshes
  int get meshCount => _meshCount = field_meshCount.readOr(op, _meshCount);
  set meshCount(int value) => _meshCount = field_meshCount.writeIf(op, value);

  int _materialCount;
  /// Number of materials
  int get materialCount => _materialCount = field_materialCount.readOr(op, _materialCount);
  set materialCount(int value) => _materialCount = field_materialCount.writeIf(op, value);

  late final StructLiveListStruct<MeshD> _meshes;
  /// Meshes array
  StructLiveListStruct<MeshD> get meshes => _meshes;
  set meshes(List<MeshD> value) => _meshes.inner = value;
  
  late final StructLiveListStruct<MaterialD> _materials;
  /// Materials array
  StructLiveListStruct<MaterialD> get materials => _materials;
  set materials(List<MaterialD> value) => _materials.inner = value;

  late final StructLiveList<int, RInt> _meshMaterial;
  /// Mesh material number
  StructLiveList<int, RInt> get meshMaterial => _meshMaterial;
  set meshMaterial(List<int> value) => _meshMaterial.inner = value;

  ModelSkeletonD _skeleton;
  /// Skeleton for animation
  ModelSkeletonD get skeleton => _skeleton = field_skeleton.readOr(op, _skeleton);
  set skeleton(ModelSkeletonD value) => _skeleton = field_skeleton.writeIf(op, value);

  late final StructLiveListStruct<TransformD> _currentPose;
  /// Current animation pose (Transform[])
  StructLiveListStruct<TransformD> get currentPose => _currentPose;
  set currentPose(List<TransformD> value) => _currentPose.inner = value;
  
  late final StructLiveListStruct<MatrixD> _boneMatrices;
  /// Bones animated transformation matrices
  StructLiveListStruct<MatrixD> get boneMatrices => _boneMatrices;
  set boneMatrices(List<MatrixD> value) => _boneMatrices.inner = value;

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
    _meshes = field_meshes.live(() => op, meshes ?? []);
    _materials = field_materials.live(() => op, materials ?? []);
    _meshMaterial = field_meshMaterial.live(() => op, meshMaterial ?? []);
    _currentPose = field_currentPose.live(() => op, currentPose ?? []);
    _boneMatrices = field_boneMatrices.live(() => op, boneMatrices ?? []);
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
    field_meshes.allocate(temp, p, '${key}_meshes', count: meshCount);
    field_materials.allocate(temp, p, '${key}_materials', count: materialCount);
    field_meshMaterial.allocate(temp, p, '${key}_meshMaterial', count: materialCount);
    field_currentPose.allocate(temp, p, '${key}_currentPose', count: skeleton.boneCount);
    field_boneMatrices.allocate(temp, p, '${key}_boneMatrices', count: skeleton.boneCount);
  }

  @override
  void structWriteInto(MemoryPointer p) {
    field_transform.write(p, _transform);
    field_meshCount.write(p, _meshCount);
    field_materialCount.write(p, _materialCount);
    _meshes.writeInto(p);
    _materials.writeInto(p);
    _meshMaterial.writeInto(p);
    field_skeleton.write(p, _skeleton);
    _currentPose.writeInto(p);
    _boneMatrices.writeInto(p);
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _transform = field_transform.read(p);
    _meshCount = field_meshCount.read(p);
    _materialCount = field_materialCount.read(p);
    _meshes.readFrom(p, count: meshCount);
    _materials.readFrom(p, count: materialCount);
    _meshMaterial.readFrom(p, count: materialCount);
    _skeleton = field_skeleton.read(p);
    _currentPose.readFrom(p, count: skeleton.boneCount);
    _boneMatrices.readFrom(p, count: skeleton.boneCount);
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