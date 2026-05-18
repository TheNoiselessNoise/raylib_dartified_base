part of '../../raylib_dartified_base.dart';

/// Dart-side mirror of Raylib's compile-time constants (`RAYLIB_VERSION`, `PI`, etc.),
/// kept in the base package so both backends share a single source of truth.
class RaylibConstants {
  static final int RAYLIB_VERSION_MAJOR = 5;
  static final int RAYLIB_VERSION_MINOR = 5;
  static final int RAYLIB_VERSION_PATCH = 0;
  static final String RAYLIB_VERSION = '5.5.0';
  static final double PI = 3.1415927410125732;
  static final double DEG2RAD = 0.01745329238474369;
  static final double RAD2DEG = 57.2957763671875;
  static final MaterialMapIndex MATERIAL_MAP_DIFFUSE = .MATERIAL_MAP_ALBEDO;
  static final MaterialMapIndex MATERIAL_MAP_SPECULAR = .MATERIAL_MAP_METALNESS;
  static final int MAX_MATERIAL_MAPS = 12;
  static final int SHADER_LOC_MAP_DIFFUSE = 15;
  static final int SHADER_LOC_MAP_SPECULAR = 16;
  static final double EPSILON = 9.999999974752427e-7;
  static final double M_E = 2.718281828459045;
  static final double M_LOG2E = 1.4426950408889634;
  static final double M_LOG10E = 0.4342944819032518;
  static final double M_LN2 = 0.6931471805599453;
  static final double M_LN10 = 2.302585092994046;
  static final double M_PI = 3.141592653589793;
  static final double M_PI_2 = 1.5707963267948966;
  static final double M_PI_4 = 0.7853981633974483;
  static final double M_1_PI = 0.3183098861837907;
  static final double M_2_PI = 0.6366197723675814;
  static final double M_2_SQRTPI = 1.1283791670955126;
  static final double M_SQRT2 = 1.4142135623730951;
  static final double M_SQRT1_2 = 0.7071067811865476;
  static final int RAND_MAX = 2147483647;
}

/// Pure Dart implementations of Raylib's inline/math utility functions,
/// shared across backends to avoid duplicating logic that doesn't touch native memory.
class RaylibFunctions {
  static double Clamp(num value, num min, num max) {
    num result = (value < min) ? min : value;
    if (result > max) result = max;
    return result.toDouble();
  }
  static double Lerp(num start, num end, num amount) {
    return (start + amount*(end - start)).toDouble();
  }
  static double Normalize(num value, num start, num end) {
    return (value - start)/(end - start);
  }
  static double Remap(num value, num inputStart, num inputEnd, num outputStart, num outputEnd) {
    return (value - inputStart)/(inputEnd - inputStart)*(outputEnd - outputStart) + outputStart;
  }
  static double Wrap(num value, num min, num max) {
    return value - (max - min)*((value - min)/(max - min)).floorToDouble();
  }
  static bool FloatEquals(double x, double y) {
    return ((x - y).abs()) <= (RaylibConstants.EPSILON*math.max(1.0, math.max(x.abs(), y.abs())));
  }
}