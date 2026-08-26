part of '../../../raylib_dartified_base.dart';

enum RectangleField {
  x,
  y,
  width,
  height,
}

/// 4 components.
class RectangleD extends RaylibStructLiteral<RectangleD> {
  
  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  static final int byteSize = structLayout.byteSize;
  static final int alignment = structLayout.alignment;
  static final StructLayout<RectangleField> structLayout = .aligned(structFields);
  static final Map<RectangleField, RType> structFields = {
    .x:      RFloat32(),
    .y:      RFloat32(),
    .width:  RFloat32(),
    .height: RFloat32(),
  };

  static StructPointer<RectangleD> pointer(MemoryPointer? ptr)
    => .nullable(ptr, structLayout, RectangleD.new, RectangleD.pointer);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        
  
  /// Rectangle top-left corner position x
  double x;
  
  /// Rectangle top-left corner position y
  double y;
  
  /// Rectangle width
  double width;
  
  /// Rectangle height
  double height;

  RectangleD({
    super.op,
    this.x = 0,
    this.y = 0,
    this.width = 0,
    this.height = 0,
  });

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
    p.writeFloat32(x, structLayout.offset(.x));
    p.writeFloat32(y, structLayout.offset(.y));
    p.writeFloat32(width, structLayout.offset(.width));
    p.writeFloat32(height, structLayout.offset(.height));
  }

  @override
  void structReadFrom(MemoryPointer<RStruct> p) {
    x = p.readFloat32(structLayout.offset(.x));
    y = p.readFloat32(structLayout.offset(.y));
    width = p.readFloat32(structLayout.offset(.width));
    height = p.readFloat32(structLayout.offset(.height));
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