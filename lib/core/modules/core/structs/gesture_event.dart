part of '../../../raylib_dartified_base.dart';

enum GestureEventField with StructFields {
  touchAction,
  pointCount,
  pointId,
  position,
}

/// Gesture event
class GestureEvent extends RaylibStruct<GestureEvent> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final StructType<GestureEvent> struct = ._builtin(
    factory: GestureEvent.new,
    layout: .aligned<GestureEventField>({
      .touchAction: RInt(),
      .pointCount:  RInt(),
      .pointId:     RArray(RInt(), BASE_maxTouchPoints),
      .position:    RArray(RStruct(Vector2.struct), BASE_maxTouchPoints),
    }),
  );

  /// Raw memory layout of this object.
  static final StructLayout<GestureEventField> structLayout = struct.layoutOf();

  /// Field descriptor for [touchAction].
  static final field_touchAction = structLayout.scalar<int, RInt>(.touchAction);
  /// Field descriptor for [pointCount].
  static final field_pointCount = structLayout.scalar<int, RInt>(.pointCount);
  /// Field descriptor for [pointId].
  static final field_pointId = structLayout.scalarArray<int, RInt>(.pointId);
  /// Field descriptor for [position].
  static final field_position = structLayout.structArray<Vector2>(.position);

  //   ░██████    ░██████   ░███    ░██   ░██████   ░██████████
  //  ░██   ░██  ░██   ░██  ░████   ░██  ░██   ░██      ░██    
  // ░██        ░██     ░██ ░██░██  ░██ ░██             ░██    
  // ░██        ░██     ░██ ░██ ░██ ░██  ░████████      ░██    
  // ░██        ░██     ░██ ░██  ░██░██         ░██     ░██    
  //  ░██   ░██  ░██   ░██  ░██   ░████  ░██   ░██      ░██    
  //   ░██████    ░██████   ░██    ░███   ░██████       ░██    
  
  /// Number of components in the [pointId] and [position] arrays.
  static int get BASE_maxTouchPoints => RaylibConstants.MAX_TOUCH_POINTS;

  /// Number of components in the [pointId] and [position] arrays.
  int get maxTouchPoints => BASE_maxTouchPoints;

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        
  
  TouchAction _touchAction;
  /// Touch action
  TouchAction get touchAction => _touchAction = .fromValue(field_touchAction.readOr(op, _touchAction.value));
  set touchAction(TouchAction value) => _touchAction = .fromValue(field_touchAction.writeOr(op, value.value));

  int _pointCount;
  /// Point count
  int get pointCount => _pointCount = field_pointCount.readOr(op, _pointCount);
  set pointCount(int value) => _pointCount = field_pointCount.writeOr(op, value);

  late final StructLiveList<int, RInt> _pointId;
  /// Point Id
  StructLiveList<int, RInt> get pointId => _pointId;
  set pointId(List<int> value) => _pointId.inner = value;

  late final StructLiveListStruct<Vector2> _position;
  /// Position
  StructLiveListStruct<Vector2> get position => _position;
  set position(List<Vector2> value) => _position.inner = value;

  GestureEvent({
    super.op,
    TouchAction touchAction = .TOUCH_ACTION_DOWN,
    int pointCount = 0,
    List<int>? pointId,
    List<Vector2>? position,
  }) :
    _touchAction = touchAction,
    _pointCount = pointCount
  {
    _pointId = field_pointId.live(() => op, pointId ?? .filled(field_pointId.codec.type.count, 0));
    _position = field_position.live(() => op, position ?? .generate(field_position.codec.type.count, (_) => .zero()));
  }

  factory GestureEvent.zero() => .new();

  @override
  GestureEvent setDart(GestureEvent o) {
    touchAction = o.touchAction;
    pointCount = o.pointCount;
    pointId = .from(o.pointId);
    position = .from(o.position);
    return this;
  }

  @override
  void structWriteInto(MemoryPointer p) {
    field_touchAction.write(p, _touchAction.value);
    field_pointCount.write(p, _pointCount);
    _pointId.writeInto(p);
    _position.writeInto(p);
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _touchAction = .fromValue(field_touchAction.read(p));
    _pointCount = field_pointCount.read(p);
    _pointId.readFrom(p);
    _position.readFrom(p);
  }

  @override
  GestureEvent clone() => .new(
    op: op,
    touchAction: touchAction,
    pointCount: pointCount,
    pointId: .from(pointId),
    position: .from(position),
  );

  @override
  String signature() => '$structName(touchAction: $touchAction, pointCount: $pointCount, pointId: ${pointId.length}, postion: ${position.length})';
}