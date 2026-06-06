part of '../../raylib_dartified_base.dart';

/// Dart-side mirror of Raylib's compile-time constants (`RAYLIB_VERSION`, `PI`, etc.),
/// kept in the base package so all backends share a single source of truth.
class RaylibConstants {
  
  /// Predefined constant `RAYLIB_VERSION_MAJOR`.
  static final int RAYLIB_VERSION_MAJOR = 5;

  /// Predefined constant `RAYLIB_VERSION_MINOR`.
  static final int RAYLIB_VERSION_MINOR = 5;

  /// Predefined constant `RAYLIB_VERSION_PATCH`.
  static final int RAYLIB_VERSION_PATCH = 0;

  /// Predefined constant `RAYLIB_VERSION`.
  static final String RAYLIB_VERSION = '5.5.0';

  /// Predefined constant `PI`.
  static final double PI = 3.1415927410125732;

  /// Predefined constant `DEG2RAD`.
  static final double DEG2RAD = 0.01745329238474369;

  /// Predefined constant `RAD2DEG`.
  static final double RAD2DEG = 57.2957763671875;

  /// Predefined constant `MATERIAL_MAP_DIFFUSE`.
  static final MaterialMapIndex MATERIAL_MAP_DIFFUSE = .MATERIAL_MAP_ALBEDO;

  /// Predefined constant `MATERIAL_MAP_SPECULAR`.
  static final MaterialMapIndex MATERIAL_MAP_SPECULAR = .MATERIAL_MAP_METALNESS;

  /// Predefined constant `MAX_MATERIAL_MAPS`.
  static final int MAX_MATERIAL_MAPS = 12;

  /// Predefined constant `SHADER_LOC_MAP_DIFFUSE`.
  static final int SHADER_LOC_MAP_DIFFUSE = 15;

  /// Predefined constant `SHADER_LOC_MAP_SPECULAR`.
  static final int SHADER_LOC_MAP_SPECULAR = 16;

  /// Predefined constant `EPSILON`.
  static final double EPSILON = 9.999999974752427e-7;

  /// Predefined constant `M_E`.
  static final double M_E = 2.718281828459045;

  /// Predefined constant `M_LOG2E`.
  static final double M_LOG2E = 1.4426950408889634;

  /// Predefined constant `M_LOG10E`.
  static final double M_LOG10E = 0.4342944819032518;

  /// Predefined constant `M_LN2`.
  static final double M_LN2 = 0.6931471805599453;

  /// Predefined constant `M_LN10`.
  static final double M_LN10 = 2.302585092994046;

  /// Predefined constant `M_PI`.
  static final double M_PI = 3.141592653589793;

  /// Predefined constant `M_PI_2`.
  static final double M_PI_2 = 1.5707963267948966;

  /// Predefined constant `M_PI_4`.
  static final double M_PI_4 = 0.7853981633974483;

  /// Predefined constant `M_1_PI`.
  static final double M_1_PI = 0.3183098861837907;

  /// Predefined constant `M_2_PI`.
  static final double M_2_PI = 0.6366197723675814;

  /// Predefined constant `M_2_SQRTPI`.
  static final double M_2_SQRTPI = 1.1283791670955126;

  /// Predefined constant `M_SQRT2`.
  static final double M_SQRT2 = 1.4142135623730951;

  /// Predefined constant `M_SQRT1_2`.
  static final double M_SQRT1_2 = 0.7071067811865476;

  /// Predefined constant `M_SQRT1_2`.
  static final int RAND_MAX = 2147483647;
  
}

/// Pure Dart implementations of Raylib's inline/math utility functions,
/// shared across backends to avoid duplicating logic that doesn't touch native memory.
class RaylibFunctions {

  /// Clamps [value] to the range `[min, max]`.
  static double Clamp(num value, num min, num max) {
    num result = (value < min) ? min : value;
    if (result > max) result = max;
    return result.toDouble();
  }

  /// Linear interpolation between [start] and [end] by [amount].
  ///
  /// [amount] should be in the range `[0.0, 1.0]`.
  static double Lerp(num start, num end, num amount) {
    return (start + amount*(end - start)).toDouble();
  }

  /// Normalizes [value] from the range `[start, end]` to `[0.0, 1.0]`.
  static double Normalize(num value, num start, num end) {
    return (value - start)/(end - start);
  }

  /// Remaps [value] from the input range `[inputStart, inputEnd]`
  /// to the output range `[outputStart, outputEnd]`.
  static double Remap(num value, num inputStart, num inputEnd, num outputStart, num outputEnd) {
    return (value - inputStart)/(inputEnd - inputStart)*(outputEnd - outputStart) + outputStart;
  }

  /// Wraps [value] within the range `[min, max]`.
  static double Wrap(num value, num min, num max) {
    return value - (max - min)*((value - min)/(max - min)).floorToDouble();
  }

  /// Returns `true` if [x] and [y] are approximately equal.
  ///
  /// Uses epsilon-based comparison scaled to the magnitude of the compared values.
  static bool FloatEquals(double x, double y) {
    return ((x - y).abs()) <= (RaylibConstants.EPSILON*math.max(1.0, math.max(x.abs(), y.abs())));
  }

}