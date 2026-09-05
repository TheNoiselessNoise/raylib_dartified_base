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
  static StructPointer<GestureEventD> pointer(MemoryPointerHandle? ptr)
    => .nullable(ptr, struct, GestureEventD.new, GestureEventD.pointer);

  static final _touchActionF = struct.scalar<int, RInt>(.touchAction);
  static final _pointCountF = struct.scalar<int, RInt>(.pointCount);
  static final _pointIdF = struct.scalarArray<int, RInt>(.pointId);
  static final _positionF = struct.structArray(.position, Vector2D.pointer);

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
  TouchAction get touchAction => _touchAction = .fromValue(_touchActionF.readOr(op, _touchAction.value));
  set touchAction(TouchAction value) => _touchAction = .fromValue(_touchActionF.writeIf(op, value.value));

  int _pointCount;
  /// Point count
  int get pointCount => _pointCount = _pointCountF.readOr(op, _pointCount);
  set pointCount(int value) => _pointCount = _pointCountF.writeIf(op, value);

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
    _pointId = _pointIdF.live(
      () => op,
      .filled(_pointIdF.codec.type.count, 0),
    );

    _position = _positionF.live(
      () => op,
      .generate(_positionF.codec.type.count, (_) => .zero()),
    );
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
  void structWriteInto(MemoryPointerHandle p) {
    _touchActionF.write(p, _touchAction.value);
    _pointCountF.write(p, _pointCount);
    _pointId.writeInto(p);
    _position.writeInto(p);
  }

  @override
  void structReadFrom(MemoryPointerHandle p) {
    _touchAction = .fromValue(_touchActionF.read(p));
    _pointCount = _pointCountF.read(p);
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