part of '../../../raylib_dartified_base.dart';

enum AutomationEventField with StructFields {
  frame,
  type,
  params,
}

/// Automation event
class AutomationEventD extends RaylibStruct<AutomationEventD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Raw memory layout of the C struct (field order, offsets, and backing [RType]s).
  static final StructLayout<AutomationEventField> struct = .aligned({
    .frame:  RUnsignedInt(), // Event frame
    .type:   RUnsignedInt(), // Event type (AutomationEventType)
    .params: RInt(BASE_paramsCount), // Event parameters (if required)
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<AutomationEventD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, struct, AutomationEventD.new, AutomationEventD.pointer);

  //   ░██████    ░██████   ░███    ░██   ░██████   ░██████████
  //  ░██   ░██  ░██   ░██  ░████   ░██  ░██   ░██      ░██    
  // ░██        ░██     ░██ ░██░██  ░██ ░██             ░██    
  // ░██        ░██     ░██ ░██ ░██ ░██  ░████████      ░██    
  // ░██        ░██     ░██ ░██  ░██░██         ░██     ░██    
  //  ░██   ░██  ░██   ░██  ░██   ░████  ░██   ░██      ░██    
  //   ░██████    ░██████   ░██    ░███   ░██████       ░██    

  /// Number of components in the [params] array.
  static int get BASE_paramsCount => 4;

  /// Number of components in the [params] array.
  int get paramsCount => BASE_paramsCount;

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  int _frame;
  /// Event frame
  int get frame {
    structOnOp((p) => _frame = p.readUnsignedInt(struct.offset(.frame)));
    return _frame;
  }
  set frame(int value) {
    _frame = value;
    structOnOp((p) => p.writeUnsignedInt(value, struct.offset(.frame)));
  }

  AutomationEventType _type;
  /// Event type
  AutomationEventType get type {
    structOnOp((p) => _type = .fromValue(p.readUnsignedInt(struct.offset(.type))));
    return _type;
  }
  set type(AutomationEventType value) {
    _type = value;
    structOnOp((p) => p.writeUnsignedInt(value.value, struct.offset(.type)));
  }

  late LiveListInlineScalar<int, RInt> _params;
  /// Event parameters (if required)
  LiveListInlineScalar<int, RInt> get params => _params;
  set params(List<int> value) {
    assert(value.length <= paramsCount);
    _params.inner = value;
  }

  AutomationEventD({
    super.op,
    int frame = 0,
    AutomationEventType type = .EVENT_NONE,
    List<int>? params,
  }) :
    _frame = frame,
    _type = type
  {
    _params = .new(
      () => op?.cast(),
      struct.offset(.params),
      (p, i) => p[i],
      (p, i, v) => p[i] = v,
      params ?? .filled(BASE_paramsCount, 0),
    );
  }

  factory AutomationEventD.zero() => .new();

  @override
  AutomationEventD setD(AutomationEventD o) {
    frame = o.frame;
    type = o.type;
    params = .from(o.params);
    return this;
  }

  @override
  void structWriteInto(MemoryPointer<RStruct> p) {
    p.writeUnsignedInt(_frame, struct.offset(.frame));
    p.writeUnsignedInt(_type.value, struct.offset(.type));
    p.offsetBy(struct.offset(.params)).cast<RInt>().writeArray(_params.inner);
  }

  @override
  void structReadFrom(MemoryPointer<RStruct> p) {
    _frame = p.readUnsignedInt(struct.offset(.frame));
    _type = .fromValue(p.readUnsignedInt(struct.offset(.type)));
    _params.raw = p.offsetBy(struct.offset(.params)).cast<RInt>().readArray(paramsCount);
  }

  @override
  AutomationEventD clone() => .new(
    op: op,
    frame: frame,
    type: type,
    params: .from(params),
  );

  @override
  String signature() => '$structName(frame: $frame, type: $type, params: $params)';
}