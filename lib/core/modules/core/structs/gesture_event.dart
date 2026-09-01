part of '../../../raylib_dartified_base.dart';

enum GestureEventField with StructFields {
  touchAction,
  pointCount,
  pointId,
  position,
}

// TODO: translate

/// Gesture event
class GestureEventD extends RaylibStruct<GestureEventD> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

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

  static final _touchActionF = struct.scalar<int, RInt>(.touchAction);
  static final _pointCountF = struct.scalar<int, RInt>(.pointCount);
  // TODO: this
  // static final _pointIdF = struct.scalarArray<int, RInt>(.pointId);
  // static final _positionF = struct.structArray<Vector2D>(.position, Vector2D.pointer);

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
  TouchAction get touchAction => _touchAction = .fromValue(_touchActionF.readOr(op?.ptr, _touchAction.value));
  set touchAction(TouchAction value) => _touchAction = .fromValue(_touchActionF.writeIf(op?.ptr, value.value));

  int _pointCount;
  /// Point count
  int get pointCount => _pointCount = _pointCountF.readOr(op?.ptr, _pointCount);
  set pointCount(int value) => _pointCount = _pointCountF.writeIf(op?.ptr, value);

  // TOOD: live list
  late LiveListInlineScalar<int, RInt> _pointId;
  LiveListInlineScalar<int, RInt> get pointId => _pointId;
  set pointId(List<int> value) {
    assert(value.length <= maxTouchPoints);
    _pointId.inner = value;
  }

  // TOOD: live list
  late LiveListInlineStruct<Vector2D> _position;
  LiveListInlineStruct<Vector2D> get position => _position;
  set position(List<Vector2D> value) {
    assert(value.length <= maxTouchPoints);
    _position.inner = value;
  }

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
    _pointId = .new(
      () => op?.cast(),
      struct.offset(.pointId),
      (p, i) => p[i],
      (p, i, v) => p[i] = v,
      pointId ?? .filled(maxTouchPoints, 0),
    );

    _position = .new(
      () => op?.cast(),
      struct.offset(.position),
      Vector2D.pointer,
      position ?? .generate(maxTouchPoints, (_) => .zero()),
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
  void structWriteInto(MemoryPointer<RStruct> p) {
    // _touchActionF.write(p, _touchAction.value);
    // _pointCountF.write(p, _pointCount);
    // _pointIdF.write(p, _pointId);
    // _positionF.write(p, _position);

    // p.writeInt(_touchAction.value, struct.offset(.touchAction));
    // p.writeInt(_pointCount, struct.offset(.pointCount));
    // p.offsetBy(struct.offset(.pointId)).cast<RInt>().writeArray(_pointId.inner);
    // Vector2D.pointer(p.offsetBy(struct.offset(.position))).writeArray(_position.inner);
  }

  @override
  void structReadFrom(MemoryPointer<RStruct> p) {
    // _touchAction = _touchActionF.read(p);
    // _pointCount = _pointCountF.read(p);
    // _pointId = _pointIdF.read(p);
    // _position = _positionF.read(p);

    // _touchAction = .fromValue(p.readInt(struct.offset(.touchAction)));
    // _pointCount = p.readInt(struct.offset(.pointCount));
    // _pointId.raw = p.offsetBy(struct.offset(.pointId)).cast<RInt>().readArray(maxTouchPoints);
    // _position.raw = Vector2D.pointer(p.offsetBy(struct.offset(.position))).readArray(maxTouchPoints);
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