part of '../../../raylib_dartified_base.dart';

enum RectangleField with StructFields {
  x,
  y,
  width,
  height,
}

/// Rectangle, 4 components
class RectangleD extends RaylibStructLiteral<RectangleD> {
  
  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  /// Raw memory layout of the C struct (field order, offsets, and backing [RType]s).
  static final StructLayout<RectangleField> structLayout = .aligned({
    .x:      RFloat(), // Rectangle top-left corner position x
    .y:      RFloat(), // Rectangle top-left corner position y
    .width:  RFloat(), // Rectangle width
    .height: RFloat(), // Rectangle height
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<RectangleD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, structLayout, RectangleD.new, RectangleD.pointer);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        

  double _x;
  /// Rectangle top-left corner position x
  double get x {
    structOnOp((p) => _x = p.readFloat(structLayout.offset(.x)));
    return _x;
  }
  set x(double value) {
    _x = value;
    structOnOp((p) => p.writeFloat(value, structLayout.offset(.x)));
  }

  double _y;
  /// Rectangle top-left corner position y
  double get y {
    structOnOp((p) => _y = p.readFloat(structLayout.offset(.y)));
    return _y;
  }
  set y(double value) {
    _y = value;
    structOnOp((p) => p.writeFloat(value, structLayout.offset(.y)));
  }

  double _width;
  /// Rectangle width
  double get width {
    structOnOp((p) => _width = p.readFloat(structLayout.offset(.width)));
    return _width;
  }
  set width(double value) {
    _width = value;
    structOnOp((p) => p.writeFloat(value, structLayout.offset(.width)));
  }

  double _height;
  /// Rectangle height
  double get height {
    structOnOp((p) => _height = p.readFloat(structLayout.offset(.height)));
    return _height;
  }
  set height(double value) {
    _height = value;
    structOnOp((p) => p.writeFloat(value, structLayout.offset(.height)));
  }
  
  RectangleD({
    super.op,
    double x = 0,
    double y = 0,
    double width = 0,
    double height = 0,
  }) :
    _x = x,
    _y = y,
    _width = width,
    _height = height;

  factory RectangleD.zero() => .new();

  factory RectangleD.rect(
    num x,
    num y,
    num width,
    num height
  ) => .new(
    x: x.toDouble(),
    y: y.toDouble(),
    width: width.toDouble(),
    height: height.toDouble(),
  );

  @override
  RectangleD setD(RectangleD o) {
    return set(o.x, o.y, o.width, o.height);
  }

  @override
  void structWriteInto(MemoryPointer<RStruct> p) {
    p.writeFloat(_x, structLayout.offset(.x));
    p.writeFloat(_y, structLayout.offset(.y));
    p.writeFloat(_width, structLayout.offset(.width));
    p.writeFloat(_height, structLayout.offset(.height));
  }

  @override
  void structReadFrom(MemoryPointer<RStruct> p) {
    _x = p.readFloat(structLayout.offset(.x));
    _y = p.readFloat(structLayout.offset(.y));
    _width = p.readFloat(structLayout.offset(.width));
    _height = p.readFloat(structLayout.offset(.height));
  }

  @override
  RectangleD clone() => .new(
    op: op,
    x: x,
    y: y,
    width: width,
    height: height,
  );

  /// Sets all components at once.
  ///
  /// Values are converted using [num.toDouble].
  ///
  /// Returns this instance for fluent chaining.
  RectangleD set(num x, num y, num width, num height) {
    this.x = x.toDouble();
    this.y = y.toDouble();
    this.width = width.toDouble();
    this.height = height.toDouble();
    return this;
  }

  /// Returns the Rectangle components as a new double list.
  ///
  /// Order: `[x, y, width, height]`
  List<double> toArray() => [x, y, width, height];

  /// Returns a formatted string representation of this rectangle.
  ///
  /// Each component is formatted to a fixed number of decimal places.
  /// [x0] sets the default precision for all components; individual overrides
  /// can be provided via [y0], [w0], and [h0].
  ///
  /// Example: `[ X:<x>, Y:<y>, W:<width>, H:<height> ]`
  String format([int x0 = 0, int? y0, int? w0, int? h0]) =>
    '[ '
      'X:${x.toStringAsFixed(x0)}, '
      'Y:${y.toStringAsFixed(y0 ?? x0)}, '
      'W:${width.toStringAsFixed(w0 ?? x0)}, '
      'H:${height.toStringAsFixed(h0 ?? x0)} '
    ']';

  @override
  String signature() => '$structName(x: ${x.f1}, y: ${y.f1}, w: ${width.f1}, h: ${height.f1})';
}