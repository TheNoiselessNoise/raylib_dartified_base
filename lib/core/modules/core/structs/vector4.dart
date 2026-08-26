// Portions of this file are derived from raylib.
// Original work © Ramon Santamaria and contributors.
// Used under the zlib/libpng license. See LICENSE for details.
part of '../../../raylib_dartified_base.dart';

enum Vector4Field {
  x,
  y,
  z,
  w,
}

/// A 4D vector with [x], [y], [z], and [w] components.
class Vector4D extends RaylibStructLiteral<Vector4D> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  static final int byteSize = structLayout.byteSize;
  static final int alignment = structLayout.alignment;
  static final StructLayout<Vector4Field> structLayout = .aligned(structFields);
  static final Map<Vector4Field, RType> structFields = {
    .x: RFloat32(),
    .y: RFloat32(),
    .z: RFloat32(),
    .w: RFloat32(),
  };

  static StructPointer<Vector4D> pointer(MemoryPointer? ptr)
    => .nullable(ptr, structLayout, Vector4D.new, Vector4D.pointer);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        
  
  /// X component
  double x;
  
  /// Y component
  double y;
  
  /// Z component
  double z;
  
  /// W component
  double w;

  Vector4D({
    super.op,
    this.x = 0,
    this.y = 0,
    this.z = 0,
    this.w = 0,
  });

  factory Vector4D.zero() => .new();
  factory Vector4D.one() => .vec4(1, 1, 1, 1);

  factory Vector4D.vec4(
    num x,
    num y,
    num z,
    num w,
  ) => .new(
    x: x.toDouble(),
    y: y.toDouble(),
    z: z.toDouble(),
    w: w.toDouble(),
  );

  @override
  Vector4D setD(Vector4D o) => set(o.x, o.y, o.z, o.w);

  @override
  void structWriteInto(MemoryPointer<RStruct> p) {
    p.writeFloat32(x, structLayout.offset(.x));
    p.writeFloat32(y, structLayout.offset(.y));
    p.writeFloat32(z, structLayout.offset(.z));
    p.writeFloat32(w, structLayout.offset(.w));
  }

  @override
  void structReadFrom(MemoryPointer<RStruct> p) {
    x = p.readFloat32(structLayout.offset(.x));
    y = p.readFloat32(structLayout.offset(.y));
    z = p.readFloat32(structLayout.offset(.z));
    w = p.readFloat32(structLayout.offset(.w));
  }

  @override
  Vector4D clone() => .new(
    op: op,
    x: x,
    y: y,
    z: z,
    w: w,
  );

  /// Converts [color] RGBA channels from `0–255` to normalized `0.0–1.0` components.
  factory Vector4D.colorNormalize(ColorD color) => .vec4(
    color.r/255.0,
    color.g/255.0,
    color.b/255.0,
    color.a/255.0,
  );

  /// Creates a quaternion from an [axis] and rotation [angle] (in radians).
  factory Vector4D.fromAxisAngle(Vector3D axis, double angle)
  {
    Vector4D result = .vec4(0, 0, 0, 1);

    if (axis.length != 0.0)
    {
      angle *= 0.5;

      axis = axis.normalize();

      final sinres = math.sin(angle);
      final cosres = math.cos(angle);

      return .vec4(
        axis.x*sinres,
        axis.y*sinres,
        axis.z*sinres,
        cosres,
      ).normalize();
    }

    return result;
  }

  /// Creates a [Vector4D] from the raw XYZW components of [q].
  factory Vector4D.fromQuaternion(QuaternionD q) => .vec4(
    q.x,
    q.y,
    q.z,
    q.w,
  );

  /// Sets all components at once.
  /// 
  /// Values are converted using [num.toDouble], truncating any fractional part.
  /// 
  /// Returns this instance for fluent chaining.
  Vector4D set(num x, num y, num z, num w) {
    this.x = x.toDouble();
    this.y = y.toDouble();
    this.z = z.toDouble();
    this.w = w.toDouble();
    return this;
  }

  /// Euclidean distance between this vector and [o].
  double distance(Vector4D o) => math.sqrt(distanceSqr(o));
  
  /// Squared Euclidean distance between this vector and [o].
  ///
  /// Prefer over [distance] when only relative comparison is needed.
  double distanceSqr(Vector4D o) => (x - o.x)*(x - o.x) + (y - o.y)*(y - o.y) + (z - o.z)*(z - o.z) + (w - o.w)*(w - o.w);
  
  /// Dot product of this vector and [o].
  double dotProduct(Vector4D o) => x * o.x + y * o.y + z * o.z + w * o.w;
  
  /// Euclidean length (magnitude) of this vector.
  double get length => math.sqrt(lengthSqr);
  
  /// Squared length of this vector.
  ///
  /// Prefer over [length] when only relative comparison is needed.
  double get lengthSqr => x * x + y * y + z * z + w * w;

  /// Returns a formatted string representation of this vector.
  ///
  /// [x0] sets the default precision for all components; individual overrides
  /// can be provided via [y0], [z0], and [w0].
  ///
  /// Example: `[ <x>, <y>, <z>, <w> ]`
  String format([int x0 = 0, int? y0, int? z0, int? w0]) => '[ ${x.toStringAsFixed(x0)}, ${y.toStringAsFixed(y0 ?? x0)}, ${z.toStringAsFixed(z0 ?? x0)}, ${w.toStringAsFixed(w0 ?? x0)} ]';

  /// Returns a new vector that is the component-wise sum of this and [o].
  Vector4D add(Vector4D o) => .vec4(x + o.x, y + o.y, z + o.z, w + o.w);
  
  /// Returns a new vector with [value] added to each component.
  Vector4D addValue(num value) => .vec4(x + value, y + value, z + value, w + value);
  
  /// Returns a new vector that is the component-wise difference of this and [o].
  Vector4D sub(Vector4D o) => .vec4(x - o.x, y - o.y, z - o.z, w - o.w);
  
  /// Returns a new vector with [value] subtracted from each component.
  Vector4D subValue(num value) => .vec4(x - value, y - value, z - value, w - value);
  
  /// Returns a new vector with all components scaled by [o].
  Vector4D scale(num o) => .vec4(x * o, y * o, z * o, w * o);
  
  /// Returns a new vector that is the component-wise product of this and [o].
  Vector4D mul(Vector4D o) => .vec4(x * o.x, y * o.y, z * o.z, w * o.w);
  
  /// Returns a new vector with all components divided by [o].
  Vector4D divideBy(num o) => scale(1 / o);
  
  /// Returns a new vector that is the component-wise quotient of this and [o].
  Vector4D div(Vector4D o) => .vec4(x / o.x, y / o.y, z / o.z, w / o.w);
  
  /// Returns a new vector with all components negated.
  Vector4D negate() => .vec4(-x, -y, -z, -w);
  
  /// Returns a normalized (unit-length) copy of this vector.
  ///
  /// If [length] is zero, treats it as 1 to avoid division by zero.
  Vector4D normalize() {
    double length = this.length;
    if (length == 0.0) length = 1.0;
    final ilength = 1.0/length;
    return .vec4(
      x*ilength,
      y*ilength,
      z*ilength,
      w*ilength,
    );
  }

  /// Returns a new vector with each component being the component-wise minimum of this and [o].
  Vector4D min(Vector4D o) => .vec4(
    math.min(x, o.x),
    math.min(y, o.y),
    math.min(z, o.z),
    math.min(w, o.w),
  );

  /// Returns a new vector with each component being the component-wise maximum of this and [o].
  Vector4D max(Vector4D o) => .vec4(
    math.max(x, o.x),
    math.max(y, o.y),
    math.max(z, o.z),
    math.max(w, o.w),
  );

  /// Linear interpolation between this and [o] by [amount].
  ///
  /// [amount] should be in the range `[0.0, 1.0]`.
  Vector4D lerp(Vector4D o, double amount) => .vec4(
    x + amount*(o.x - x),
    y + amount*(o.y - y),
    z + amount*(o.z - z),
    w + amount*(o.w - w),
  );

  /// Moves this vector towards [target] by at most [maxDistance].
  ///
  /// Returns [target] directly if already within [maxDistance].
  Vector4D moveTowards(Vector4D target, double maxDistance) {
    final dx = target.x - x;
    final dy = target.y - y;
    final dz = target.z - z;
    final dw = target.w - w;
    final value = (dx*dx) + (dy*dy) + (dz*dz) + (dw*dw);

    if (
      (value == 0) ||
      ((maxDistance >= 0) && (value <= maxDistance*maxDistance))
    ) return target;

    final dist = math.sqrt(value);

    return .vec4(
      x + dx/dist*maxDistance,
      y + dy/dist*maxDistance,
      z + dz/dist*maxDistance,
      w + dw/dist*maxDistance,
    );
  }

  /// Returns a new vector with each component replaced by its reciprocal.
  Vector4D invert() => .vec4(1.0/x, 1.0/y, 1.0/z, 1.0/w);

  /// Returns `true` if this vector is approximately equal to [o].
  ///
  /// Uses epsilon-based per-component comparison scaled to the magnitude
  /// of the compared values.
  bool equals(Vector4D o) =>
    (((x - o.x).abs()) <= (RaylibConstants.EPSILON*math.max(1.0, math.max((x).abs(), (o.x).abs())))) &&
    (((y - o.y).abs()) <= (RaylibConstants.EPSILON*math.max(1.0, math.max((y).abs(), (o.y).abs())))) &&
    (((z - o.z).abs()) <= (RaylibConstants.EPSILON*math.max(1.0, math.max((z).abs(), (o.z).abs())))) &&
    (((w - o.w).abs()) <= (RaylibConstants.EPSILON*math.max(1.0, math.max((w).abs(), (o.w).abs()))));

  /// Converts this vector to a quaternion with the same `(x, y, z, w)` components.
  QuaternionD toQuaternion() => .fromVector4(this);

  /// Returns the components as a new double list.
  ///
  /// Order: `[x, y, z, w]`
  List<double> toArray() => [x, y, z, w];

  @override
  String signature() => '$structName(x: ${x.f1}, y: ${y.f1}, z: ${z.f1}, w: ${w.f1})';
}