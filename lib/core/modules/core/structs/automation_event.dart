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

  @override
  StructLayout<AutomationEventField> get structLayout => struct;

  /// Raw memory layout of the C struct (field order, offsets, and backing [RType]s).
  static final StructLayout<AutomationEventField> struct = .aligned({
    .frame:  RUnsignedInt(), // Event frame
    .type:   RUnsignedInt(), // Event type (AutomationEventType)
    .params: RArray(RInt(), BASE_paramsCount), // Event parameters (if required)
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<AutomationEventD> pointer(MemoryPointerHandle? ptr)
    => .nullable(ptr, struct, AutomationEventD.new, AutomationEventD.pointer);

  static final _frameF = struct.scalar<int, RUnsignedInt>(.frame);
  static final _typeF = struct.enumValue(.type, AutomationEventType.fromValue);
  static final _paramsF = struct.scalarArray<int, RInt>(.params);

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
  int get frame => _frame = _frameF.readOr(op, _frame);
  set frame(int value) => _frame = _frameF.writeIf(op, value);

  AutomationEventType _type;
  /// Event type
  AutomationEventType get type => _type = _typeF.readOr(op, _type);
  set type(AutomationEventType value) => _type = _typeF.writeIf(op, value);

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
    _params = _paramsF.live(
      () => op,
      .filled(_paramsF.codec.type.count, 0),
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
  void structWriteInto(MemoryPointerHandle p) {
    _frameF.write(p, _frame);
    _typeF.write(p, _type);
    _params.writeInto(p);
  }

  @override
  void structReadFrom(MemoryPointerHandle p) {
    _frame = _frameF.read(p);
    _type = _typeF.read(p);
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