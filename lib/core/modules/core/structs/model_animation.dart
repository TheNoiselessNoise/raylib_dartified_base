part of '../../../raylib_dartified_base.dart';

enum ModelAnimationField with StructFields {
  name,
  boneCount,
  keyframeCount,
  keyframePoses,
}

// TODO: translate

/// ModelAnimation, contains a full animation sequence
class ModelAnimationD extends RaylibStruct<ModelAnimationD> {

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

  static final _nameF = struct.stringAsCharArray(.name);
  static final _boneCountF = struct.scalar<int, RInt>(.boneCount);
  static final _keyframeCountF = struct.scalar<int, RInt>(.keyframeCount);
  // NOTE: no direct field **stuff (`keyframePoses`)

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

  String _name;
  /// Animation name
  String get name => _name = _nameF.readOr(op?.ptr, _name);
  set name(String value) => _name = _nameF.writeIf(op?.ptr, value);

  int _boneCount;
  /// Number of bones (per pose)
  int get boneCount => _boneCount = _boneCountF.readOr(op?.ptr, _boneCount);
  set boneCount(int value) => _boneCount = _boneCountF.writeIf(op?.ptr, value);

  int _keyframeCount;
  /// Number of animation key frames
  int get keyframeCount => _keyframeCount = _keyframeCountF.readOr(op?.ptr, _keyframeCount);
  set keyframeCount(int value) => _keyframeCount = _keyframeCountF.writeIf(op?.ptr, value);

  // TODO: _keyframePoses
  // late LiveListPointerPointerStruct<TransformD> _keyframePoses;
  // /// Animation sequence keyframe poses `[keyframe][pose]`
  // LiveListPointerPointerStruct<TransformD> get keyframePoses {
  //   structOnOp((p) => _keyframePoses.ptr = p.readPtr(struct.offset(.keyframePoses)));
  //   return _keyframePoses;
  // }
  // set keyframePoses(List<List<TransformD>> value) {
  //   structOnOp((p) {
  //     _keyframePoses.ptr = p.readPtr(struct.offset(.keyframePoses));
  //     p.writeInt(value.length, struct.offset(.keyframeCount));
  //   });

  //   _keyframePoses.inner = .generate(value.length,
  //     (i) => .new(TransformD.pointer, value[i], TransformD.pointer(_keyframePoses.innerPointer(i)))
  //   );
  // }

  ModelAnimationD({
    super.op,
    String name = '',
    int? boneCount,
    int? keyframeCount,
    List<List<TransformD>>? keyframePoses,
  }) :
    _name = name,
    _boneCount = boneCount ?? keyframePoses?.firstOrNull?.length ?? 0,
    _keyframeCount = keyframeCount ?? keyframePoses?.length ?? 0
  {
    // TODO: _keyframePoses
    // _keyframePoses = .new(
    //   TransformD.struct.byteSize, TransformD.new, [],
    //   op?.readPtr(struct.offset(.keyframePoses)),
    // );
    // if (keyframePoses != null) this.keyframePoses = keyframePoses;
  }

  factory ModelAnimationD.zero() => .new();

  @override
  ModelAnimationD setDart(ModelAnimationD o) {
    name = o.name;
    boneCount = o.boneCount;
    keyframeCount = o.keyframeCount;
    // TODO: _keyframePoses
    // keyframePoses = .from(o.keyframePoses); 
    return this;
  }

  @override
  void structAllocateInto(RaylibTemp temp, MemoryPointer p, String key) {
    // TODO: _keyframePoses
    // if (keyframePoses.inner.isNotEmpty) {
    //   _keyframePosesF.allocate(temp, p, '${key}_keyframePoses', _keyframePoses.inner.length);
    // }
  }

  @override
  void structWriteInto(MemoryPointer p) {
    _nameF.write(p, _name);
    _boneCountF.write(p, _boneCount);
    _keyframeCountF.write(p, _keyframeCount);
    // TODO: _keyframePoses
    // p.writePtr(_keyframePoses.ptr, struct.offset(.keyframePoses));
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _name = _nameF.read(p);
    _boneCount = _boneCountF.read(p);
    _keyframeCount = _keyframeCountF.read(p);
    // TODO: _keyframePoses
    // _keyframePoses.ptr = p.readPtr(struct.offset(.keyframePoses));
  }

  @override
  ModelAnimationD clone() => .new(
    op: op,
    name: name,
    boneCount: boneCount,
    keyframeCount: keyframeCount,
    // TODO: _keyframePoses
    // keyframePoses: keyframePoses.map((frame) => 
    //   frame.map((transform) => transform.clone()).toList()
    // ).toList(),
  );

  @override
  String signature() => '$structName(name: $name, boneCount: $boneCount, keyframeCount: $keyframeCount)';
}