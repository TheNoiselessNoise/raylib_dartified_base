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

  static final StructLayout<GestureEventField> structLayout = .aligned({
    .touchAction: RInt32(),
    .pointCount:  RInt32(),
    .pointId:     RInt32(BASE_maxTouchPoints),
    .position:    RStruct(Vector2D.structLayout, BASE_maxTouchPoints),
  });

  static StructPointer<GestureEventD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, structLayout, GestureEventD.new, GestureEventD.pointer);

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
  TouchAction get touchAction {
    structOnOp((p) => _touchAction = .fromValue(p.readInt32(structLayout.offset(.touchAction))));
    return _touchAction;
  }
  set touchAction(TouchAction value) {
    _touchAction = value;
    structOnOp((p) => p.writeInt32(value.value, structLayout.offset(.touchAction)));
  }

  int _pointCount;
  int get pointCount {
    structOnOp((p) => _pointCount = p.readInt32(structLayout.offset(.pointCount)));
    return _pointCount;
  }
  set pointCount(int value) {
    _pointCount = value;
    structOnOp((p) => p.writeInt32(value, structLayout.offset(.pointCount)));
  }

  late LiveListInlineScalar<int, RInt32> _pointId;
  LiveListInlineScalar<int, RInt32> get pointId => _pointId;
  set pointId(List<int> value) {
    assert(value.length <= maxTouchPoints);
    _pointId.inner = value;
  }

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
      pointId ?? .filled(maxTouchPoints, 0),
      () => op?.cast(),
      structLayout.offset(.pointId),
      (p, i) => p[i],
      (p, i, v) => p[i] = v,
    );

    _position = .new(
      position ?? .generate(maxTouchPoints, (_) => .zero()),
      () => op?.cast(),
      structLayout.offset(.position),
      Vector2D.pointer,
    );
  }

  factory GestureEventD.zero() => .new();

  @override
  GestureEventD setD(GestureEventD o) {
    touchAction = o.touchAction;
    pointCount = o.pointCount;
    pointId = .from(o.pointId);
    position = .from(o.position);
    return this;
  }

  @override
  void structWriteInto(MemoryPointer<RStruct> p) {
    p.writeInt32(_touchAction.value, structLayout.offset(.touchAction));
    p.writeInt32(_pointCount, structLayout.offset(.pointCount));
    p.offsetBy(structLayout.offset(.pointId)).cast<RInt32>().writeArray(_pointId.inner);
    Vector2D.pointer(p.offsetBy(structLayout.offset(.position))).writeArray(_position.inner);
  }

  @override
  void structReadFrom(MemoryPointer<RStruct> p) {
    _touchAction = .fromValue(p.readInt32(structLayout.offset(.touchAction)));
    _pointCount = p.readInt32(structLayout.offset(.pointCount));
    _pointId.raw = p.offsetBy(structLayout.offset(.pointId)).cast<RInt32>().readArray(maxTouchPoints);
    _position.raw = Vector2D.pointer(p.offsetBy(structLayout.offset(.position))).readArray(maxTouchPoints);
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