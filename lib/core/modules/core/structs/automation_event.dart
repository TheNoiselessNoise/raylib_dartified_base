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

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final StructType<AutomationEventD> struct = .new(
    factory: AutomationEventD.new,
    layout: .aligned<AutomationEventField>({
      .frame:  RUnsignedInt(), // Event frame
      .type:   RUnsignedInt(), // Event type (AutomationEventType)
      .params: RArray(RInt(), BASE_paramsCount), // Event parameters (if required)
    }),
  );
  
  /// Raw memory layout of this object.
  static final StructLayout<AutomationEventField> structLayout = struct.layoutOf();

  /// Field descriptor for [frame].
  static final field_frame = structLayout.scalar<int, RUnsignedInt>(.frame);
  /// Field descriptor for [type].
  static final field_type = structLayout.enumValue(.type, AutomationEventType.fromValue);
  /// Field descriptor for [params].
  static final field_params = structLayout.scalarArray<int, RInt>(.params);

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
  int get frame => _frame = field_frame.readOr(op, _frame);
  set frame(int value) => _frame = field_frame.writeOr(op, value);

  AutomationEventType _type;
  /// Event type
  AutomationEventType get type => _type = field_type.readOr(op, _type);
  set type(AutomationEventType value) => _type = field_type.writeOr(op, value);

  late final StructLiveList<int, RInt> _params;
  /// Event parameters (if required)
  StructLiveList<int, RInt> get params => _params;
  set params(List<int> value) => _params.inner = value;

  AutomationEventD({
    super.op,
    int frame = 0,
    AutomationEventType type = .EVENT_NONE,
    List<int>? params,
  }) :
    _frame = frame,
    _type = type
  {
    _params = field_params.live(
      () => op,
      .filled(field_params.codec.type.count, 0),
    );
  }

  factory AutomationEventD.zero() => .new();

  @override
  AutomationEventD setDart(AutomationEventD o) {
    frame = o.frame;
    type = o.type;
    params = .from(o.params);
    return this;
  }

  @override
  void structWriteInto(MemoryPointer p) {
    field_frame.write(p, _frame);
    field_type.write(p, _type);
    _params.writeInto(p);
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _frame = field_frame.read(p);
    _type = field_type.read(p);
    _params.readFrom(p);
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