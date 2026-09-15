part of '../../../raylib_dartified_base.dart';

enum GestureEventField with StructFields {
  touchAction,
  pointCount,
  pointId,
  position,
}

/// Gesture event
class GestureEventD extends RaylibStruct<GestureEventD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  @override
  StructLayout<GestureEventField> get structLayout => struct;

  /// Raw memory layout of the C struct (field order, offsets, and backing [RType]s).
  static final StructLayout<GestureEventField> struct = .aligned({
    .touchAction: RInt(),
    .pointCount:  RInt(),
    .pointId:     RArray(RInt(), BASE_maxTouchPoints),
    .position:    RArray(RStruct(Vector2D.struct), BASE_maxTouchPoints),
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<GestureEventD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, struct, GestureEventD.new, GestureEventD.pointer);

  static final field_touchAction = struct.scalar<int, RInt>(.touchAction);
  static final field_pointCount = struct.scalar<int, RInt>(.pointCount);
  static final field_pointId = struct.scalarArray<int, RInt>(.pointId);
  static final field_position = struct.structArray(.position, Vector2D.pointer);

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
  set touchAction(TouchAction value) => _touchAction = .fromValue(field_touchAction.writeIf(op, value.value));

  int _pointCount;
  /// Point count
  int get pointCount => _pointCount = field_pointCount.readOr(op, _pointCount);
  set pointCount(int value) => _pointCount = field_pointCount.writeIf(op, value);

  late final StructLiveList<int, RInt> _pointId;
  /// Point Id
  StructLiveList<int, RInt> get pointId => _pointId;
  set pointId(List<int> value) => _pointId.inner = value;

  late final StructLiveListStruct<Vector2D> _position;
  /// Position
  StructLiveListStruct<Vector2D> get position => _position;
  set position(List<Vector2D> value) => _position.inner = value;

  GestureEventD({
    super.op,
    TouchAction touchAction = .TOUCH_ACTION_DOWN,
    int pointCount = 0,
    List<int>? pointId,
    List<Vector2D>? position,
  }) :
    _touchAction = touchAction,
    _pointCount = pointCount
  {
    _pointId = field_pointId.live(() => op, .filled(field_pointId.codec.type.count, 0));
    _position = field_position.live(() => op, .generate(field_position.codec.type.count, (_) => .zero()));
  }

  factory GestureEventD.zero() => .new();

  @override
  GestureEventD setDart(GestureEventD o) {
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
  GestureEventD clone() => .new(
    op: op,
    touchAction: touchAction,
    pointCount: pointCount,
    pointId: .from(pointId),
    position: .from(position),
  );

  @override
  String signature() => '$structName(touchAction: $touchAction, pointCount: $pointCount, pointId: ${pointId.length}, postion: ${position.length})';
}