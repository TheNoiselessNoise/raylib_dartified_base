part of '../../../raylib_dartified_base.dart';

enum AutomationEventField {
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

  static final int byteSize = structLayout.byteSize;
  static final int alignment = structLayout.alignment;
  static final StructLayout<AutomationEventField> structLayout = .aligned(structFields);
  static final Map<AutomationEventField, RType> structFields = {
    .frame:  RUint32(),
    .type:   RUint32(),
    .params: RInt32(BASE_paramsCount),
  };

  static StructPointer<AutomationEventD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, structLayout, AutomationEventD.new);

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
    structOnOp((p) => _frame = p.readUint32(structLayout.offset(.frame)));
    return _frame;
  }
  set frame(int value) {
    _frame = value;
    structOnOp((p) => p.writeUint32(value, structLayout.offset(.frame)));
  }

  AutomationEventType _type;
  /// Event type
  AutomationEventType get type {
    structOnOp((p) => _type = .fromValue(p.readUint32(structLayout.offset(.type))));
    return _type;
  }
  set type(AutomationEventType value) {
    _type = value;
    structOnOp((p) => p.writeUint32(value.value, structLayout.offset(.type)));
  }

  late LiveListInlineScalar<int, RInt32> _params;
  /// Event parameters (if required)
  LiveListInlineScalar<int, RInt32> get params => _params;
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
      params ?? .filled(BASE_paramsCount, 0),
      () => op?.cast(),
      structLayout.offset(.params),
      (p, i) => p[i],
      (p, i, v) => p[i] = v,
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
  void writeInto(MemoryPointer<RStruct> p) {
    p.writeUint32(_frame, structLayout.offset(.frame));
    p.writeUint32(_type.value, structLayout.offset(.type));
    p.offsetBy(structLayout.offset(.params)).cast<RInt32>().writeArray(_params.inner);
  }

  @override
  void readFrom(MemoryPointer<RStruct> p) {
    _frame = p.readUint32(structLayout.offset(.frame));
    _type = .fromValue(p.readUint32(structLayout.offset(.type)));
    _params.raw = p.offsetBy(structLayout.offset(.params)).cast<RInt32>().readArray(paramsCount);
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