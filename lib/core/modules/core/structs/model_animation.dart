part of '../../../raylib_dartified_base.dart';

enum ModelAnimationField {
  name,
  boneCount,
  keyframeCount,
  keyframePoses,
}

/// ModelAnimation, contains a full animation sequence
class ModelAnimationD extends RaylibStruct<ModelAnimationD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  static final int byteSize = structLayout.byteSize;
  static final int alignment = structLayout.alignment;
  static final StructLayout<ModelAnimationField> structLayout = .aligned(structFields);
  static final Map<ModelAnimationField, RType> structFields = {
    .name:          RChar(BASE_nameLength),
    .boneCount:     RInt32(),
    .keyframeCount: RInt32(),
    .keyframePoses: RPointer<RPointer<RStruct>>(),
  };

  static StructPointer<ModelAnimationD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, structLayout, ModelAnimationD.new);

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
  String get name {
    structOnOp((p) => _name = p.offsetBy(structLayout.offset(.name)).readString(nameLength));
    return _name;
  }
  set name(String value) {
    assert(value.length <= nameLength);
    _name = value;
    structOnOp((p) => p.offsetBy(structLayout.offset(.name)).writeString(value, nameLength));
  }

  int _boneCount;
  /// Number of bones (per pose)
  int get boneCount {
    structOnOp((p) => _boneCount = p.readInt32(structLayout.offset(.boneCount)));
    return _boneCount;
  }
  set boneCount(int value) {
    _boneCount = value;
    structOnOp((p) => p.writeInt32(value, structLayout.offset(.boneCount)));
  }

  int _keyframeCount;
  /// Number of animation key frames
  int get keyframeCount {
    structOnOp((p) => _keyframeCount = p.readInt32(structLayout.offset(.keyframeCount)));
    return _keyframeCount;
  }
  set keyframeCount(int value) {
    _keyframeCount = value;
    structOnOp((p) => p.writeInt32(value, structLayout.offset(.keyframeCount)));
  }

  late LiveListPointerPointerStruct<TransformD> _keyframePoses;
  /// Poses array by frame
  LiveListPointerPointerStruct<TransformD> get keyframePoses {
    structOnOp((p) => _keyframePoses.ptr = p.readPtr(structLayout.offset(.keyframePoses)));
    return _keyframePoses;
  }
  set keyframePoses(List<List<TransformD>> value) {
    structOnOp((p) {
      _keyframePoses.ptr = p.readPtr(structLayout.offset(.keyframePoses));
      p.writeInt32(value.length, structLayout.offset(.keyframeCount));
    });

    _keyframePoses.inner = .generate(value.length,
      (i) => .new(value[i], TransformD.pointer(_keyframePoses.innerPointer(i)))
    );
  }

  ModelAnimationD({
    super.op,
    List<List<TransformD>>? keyframePoses,
    String name = '',
  }) :
    _name = name,
    _boneCount = keyframePoses?.firstOrNull?.length ?? 0,
    _keyframeCount = keyframePoses?.length ?? 0
  {
    _keyframePoses = .new(
      [], TransformD.byteSize, TransformD.new,
      op?.readPtr(structLayout.offset(.keyframePoses)),
    );
    if (keyframePoses != null) this.keyframePoses = keyframePoses;
  }

  factory ModelAnimationD.zero() => .new();

  @override
  ModelAnimationD setD(ModelAnimationD o) {
    keyframePoses = .from(o.keyframePoses); 
    name = o.name;
    return this;
  }

  @override
  void writeInto(MemoryPointer<RStruct> p) {
    p.writeString(_name, nameLength, structLayout.offset(.name));
    p.writeInt32(_boneCount, structLayout.offset(.boneCount));
    p.writeInt32(_keyframeCount, structLayout.offset(.keyframeCount));
    p.writePtr(_keyframePoses.ptr, structLayout.offset(.keyframePoses));
    
    _keyframePoses.onPointer((outer) => outer.cast<RPointer>().writeStructMatrix(_keyframePoses.inner));
  }

  @override
  void readFrom(MemoryPointer<RStruct> p) {
    _name = p.readString(nameLength, structLayout.offset(.name));
    _boneCount = p.readInt32(structLayout.offset(.boneCount));
    _keyframeCount = p.readInt32(structLayout.offset(.keyframeCount));
    _keyframePoses.ptr = p.readPtr(structLayout.offset(.keyframePoses));

    _keyframePoses.onPointer((outer) {
      final rows = outer.cast<RPointer>().readStructMatrix(_keyframeCount, boneCount, TransformD.pointer);
      _keyframePoses.raw = .generate(_keyframeCount,
        (i) => .new(rows[i], TransformD.pointer(outer.readPtr(i * RType.nativeWordSize)))
      );
    });
  }

  @override
  ModelAnimationD clone() => .new(
    op: op,
    keyframePoses: keyframePoses.map((frame) => 
      frame.map((transform) => transform.clone()).toList()
    ).toList(),
    name: name,
  );

  @override
  String signature() => '$structName(name: $name, boneCount: $boneCount, keyframeCount: $keyframeCount)';
}