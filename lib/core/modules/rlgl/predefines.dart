part of '../../raylib_dartified_base.dart';

/// Dart-side mirror of Rlgl's compile-time constants (`RLGL_VERSION`, `RL_DEFAULT_BATCH_BUFFER_ELEMENTS`, etc.),
/// kept in the base package so all backends share a single source of truth.
class RaylibRlglConstants {
  
  /// Predefined constant `RLGL_VERSION`.
  static final String RLGL_VERSION = '5.0';

  /// Predefined constant `RL_DEFAULT_BATCH_BUFFER_ELEMENTS`.
  static final int RL_DEFAULT_BATCH_BUFFER_ELEMENTS = 8192;

  /// Predefined constant `RL_DEFAULT_BATCH_BUFFERS`.
  static final int RL_DEFAULT_BATCH_BUFFERS = 1;

  /// Predefined constant `RL_DEFAULT_BATCH_DRAWCALLS`.
  static final int RL_DEFAULT_BATCH_DRAWCALLS = 256;

  /// Predefined constant `RL_DEFAULT_BATCH_MAX_TEXTURE_UNITS`.
  static final int RL_DEFAULT_BATCH_MAX_TEXTURE_UNITS = 4;

  /// Predefined constant `RL_MAX_MATRIX_STACK_SIZE`.
  static final int RL_MAX_MATRIX_STACK_SIZE = 32;

  /// Predefined constant `RL_MAX_SHADER_LOCATIONS`.
  static final int RL_MAX_SHADER_LOCATIONS = 32;

  /// Predefined constant `RL_CULL_DISTANCE_NEAR`.
  static final double RL_CULL_DISTANCE_NEAR = 0.01;

  /// Predefined constant `RL_CULL_DISTANCE_FAR`.
  static final double RL_CULL_DISTANCE_FAR = 1000.0;

  /// Predefined constant `RL_TEXTURE_WRAP_S`.
  static final int RL_TEXTURE_WRAP_S = 10242;

  /// Predefined constant `RL_TEXTURE_WRAP_T`.
  static final int RL_TEXTURE_WRAP_T = 10243;

  /// Predefined constant `RL_TEXTURE_MAG_FILTER`.
  static final int RL_TEXTURE_MAG_FILTER = 10240;

  /// Predefined constant `RL_TEXTURE_MIN_FILTER`.
  static final int RL_TEXTURE_MIN_FILTER = 10241;

  /// Predefined constant `RL_TEXTURE_FILTER_NEAREST`.
  static final int RL_TEXTURE_FILTER_NEAREST = 9728;

  /// Predefined constant `RL_TEXTURE_FILTER_LINEAR`.
  static final int RL_TEXTURE_FILTER_LINEAR = 9729;

  /// Predefined constant `RL_TEXTURE_FILTER_MIP_NEAREST`.
  static final int RL_TEXTURE_FILTER_MIP_NEAREST = 9984;

  /// Predefined constant `RL_TEXTURE_FILTER_NEAREST_MIP_LINEAR`.
  static final int RL_TEXTURE_FILTER_NEAREST_MIP_LINEAR = 9986;

  /// Predefined constant `RL_TEXTURE_FILTER_LINEAR_MIP_NEAREST`.
  static final int RL_TEXTURE_FILTER_LINEAR_MIP_NEAREST = 9985;

  /// Predefined constant `RL_TEXTURE_FILTER_MIP_LINEAR`.
  static final int RL_TEXTURE_FILTER_MIP_LINEAR = 9987;

  /// Predefined constant `RL_TEXTURE_FILTER_ANISOTROPIC`.
  static final int RL_TEXTURE_FILTER_ANISOTROPIC = 12288;

  /// Predefined constant `RL_TEXTURE_MIPMAP_BIAS_RATIO`.
  static final int RL_TEXTURE_MIPMAP_BIAS_RATIO = 16384;

  /// Predefined constant `RL_TEXTURE_WRAP_REPEAT`.
  static final int RL_TEXTURE_WRAP_REPEAT = 10497;

  /// Predefined constant `RL_TEXTURE_WRAP_CLAMP`.
  static final int RL_TEXTURE_WRAP_CLAMP = 33071;

  /// Predefined constant `RL_TEXTURE_WRAP_MIRROR_REPEAT`.
  static final int RL_TEXTURE_WRAP_MIRROR_REPEAT = 33648;

  /// Predefined constant `RL_TEXTURE_WRAP_MIRROR_CLAMP`.
  static final int RL_TEXTURE_WRAP_MIRROR_CLAMP = 34626;

  /// Predefined constant `RL_MODELVIEW`.
  static final int RL_MODELVIEW = 5888;

  /// Predefined constant `RL_PROJECTION`.
  static final int RL_PROJECTION = 5889;

  /// Predefined constant `RL_TEXTURE`.
  static final int RL_TEXTURE = 5890;

  /// Predefined constant `RL_LINES`.
  static final int RL_LINES = 1;

  /// Predefined constant `RL_TRIANGLES`.
  static final int RL_TRIANGLES = 4;

  /// Predefined constant `RL_QUADS`.
  static final int RL_QUADS = 7;

  /// Predefined constant `RL_UNSIGNED_BYTE`.
  static final int RL_UNSIGNED_BYTE = 5121;

  /// Predefined constant `RL_FLOAT`.
  static final int RL_FLOAT = 5126;

  /// Predefined constant `RL_STREAM_DRAW`.
  static final int RL_STREAM_DRAW = 35040;

  /// Predefined constant `RL_STREAM_READ`.
  static final int RL_STREAM_READ = 35041;

  /// Predefined constant `RL_STREAM_COPY`.
  static final int RL_STREAM_COPY = 35042;

  /// Predefined constant `RL_STATIC_DRAW`.
  static final int RL_STATIC_DRAW = 35044;

  /// Predefined constant `RL_STATIC_READ`.
  static final int RL_STATIC_READ = 35045;

  /// Predefined constant `RL_STATIC_COPY`.
  static final int RL_STATIC_COPY = 35046;

  /// Predefined constant `RL_DYNAMIC_DRAW`.
  static final int RL_DYNAMIC_DRAW = 35048;

  /// Predefined constant `RL_DYNAMIC_READ`.
  static final int RL_DYNAMIC_READ = 35049;

  /// Predefined constant `RL_DYNAMIC_COPY`.
  static final int RL_DYNAMIC_COPY = 35050;

  /// Predefined constant `RL_FRAGMENT_SHADER`.
  static final int RL_FRAGMENT_SHADER = 35632;

  /// Predefined constant `RL_VERTEX_SHADER`.
  static final int RL_VERTEX_SHADER = 35633;

  /// Predefined constant `RL_COMPUTE_SHADER`.
  static final int RL_COMPUTE_SHADER = 37305;

  /// Predefined constant `RL_ZERO`.
  static final int RL_ZERO = 0;

  /// Predefined constant `RL_ONE`.
  static final int RL_ONE = 1;

  /// Predefined constant `RL_SRC_COLOR`.
  static final int RL_SRC_COLOR = 768;

  /// Predefined constant `RL_ONE_MINUS_SRC_COLOR`.
  static final int RL_ONE_MINUS_SRC_COLOR = 769;

  /// Predefined constant `RL_SRC_ALPHA`.
  static final int RL_SRC_ALPHA = 770;

  /// Predefined constant `RL_ONE_MINUS_SRC_ALPHA`.
  static final int RL_ONE_MINUS_SRC_ALPHA = 771;

  /// Predefined constant `RL_DST_ALPHA`.
  static final int RL_DST_ALPHA = 772;

  /// Predefined constant `RL_ONE_MINUS_DST_ALPHA`.
  static final int RL_ONE_MINUS_DST_ALPHA = 773;

  /// Predefined constant `RL_DST_COLOR`.
  static final int RL_DST_COLOR = 774;

  /// Predefined constant `RL_ONE_MINUS_DST_COLOR`.
  static final int RL_ONE_MINUS_DST_COLOR = 775;

  /// Predefined constant `RL_SRC_ALPHA_SATURATE`.
  static final int RL_SRC_ALPHA_SATURATE = 776;

  /// Predefined constant `RL_CONSTANT_COLOR`.
  static final int RL_CONSTANT_COLOR = 32769;

  /// Predefined constant `RL_ONE_MINUS_CONSTANT_COLOR`.
  static final int RL_ONE_MINUS_CONSTANT_COLOR = 32770;

  /// Predefined constant `RL_CONSTANT_ALPHA`.
  static final int RL_CONSTANT_ALPHA = 32771;

  /// Predefined constant `RL_ONE_MINUS_CONSTANT_ALPHA`.
  static final int RL_ONE_MINUS_CONSTANT_ALPHA = 32772;

  /// Predefined constant `RL_FUNC_ADD`.
  static final int RL_FUNC_ADD = 32774;

  /// Predefined constant `RL_MIN`.
  static final int RL_MIN = 32775;

  /// Predefined constant `RL_MAX`.
  static final int RL_MAX = 32776;

  /// Predefined constant `RL_FUNC_SUBTRACT`.
  static final int RL_FUNC_SUBTRACT = 32778;

  /// Predefined constant `RL_FUNC_REVERSE_SUBTRACT`.
  static final int RL_FUNC_REVERSE_SUBTRACT = 32779;

  /// Predefined constant `RL_BLEND_EQUATION`.
  static final int RL_BLEND_EQUATION = 32777;

  /// Predefined constant `RL_BLEND_EQUATION_RGB`.
  static final int RL_BLEND_EQUATION_RGB = 32777;

  /// Predefined constant `RL_BLEND_EQUATION_ALPHA`.
  static final int RL_BLEND_EQUATION_ALPHA = 34877;

  /// Predefined constant `RL_BLEND_DST_RGB`.
  static final int RL_BLEND_DST_RGB = 32968;

  /// Predefined constant `RL_BLEND_SRC_RGB`.
  static final int RL_BLEND_SRC_RGB = 32969;

  /// Predefined constant `RL_BLEND_DST_ALPHA`.
  static final int RL_BLEND_DST_ALPHA = 32970;

  /// Predefined constant `RL_BLEND_SRC_ALPHA`.
  static final int RL_BLEND_SRC_ALPHA = 32971;

  /// Predefined constant `RL_BLEND_COLOR`.
  static final int RL_BLEND_COLOR = 32773;

  /// Predefined constant `RL_READ_FRAMEBUFFER`.
  static final int RL_READ_FRAMEBUFFER = 36008;

  /// Predefined constant `RL_DRAW_FRAMEBUFFER`.
  static final int RL_DRAW_FRAMEBUFFER = 36009;

  /// Predefined constant `RL_DEFAULT_SHADER_ATTRIB_LOCATION_POSITION`.
  static final int RL_DEFAULT_SHADER_ATTRIB_LOCATION_POSITION = 0;

  /// Predefined constant `RL_DEFAULT_SHADER_ATTRIB_LOCATION_TEXCOORD`.
  static final int RL_DEFAULT_SHADER_ATTRIB_LOCATION_TEXCOORD = 1;

  /// Predefined constant `RL_DEFAULT_SHADER_ATTRIB_LOCATION_NORMAL`.
  static final int RL_DEFAULT_SHADER_ATTRIB_LOCATION_NORMAL = 2;

  /// Predefined constant `RL_DEFAULT_SHADER_ATTRIB_LOCATION_COLOR`.
  static final int RL_DEFAULT_SHADER_ATTRIB_LOCATION_COLOR = 3;

  /// Predefined constant `RL_DEFAULT_SHADER_ATTRIB_LOCATION_TANGENT`.
  static final int RL_DEFAULT_SHADER_ATTRIB_LOCATION_TANGENT = 4;

  /// Predefined constant `RL_DEFAULT_SHADER_ATTRIB_LOCATION_TEXCOORD2`.
  static final int RL_DEFAULT_SHADER_ATTRIB_LOCATION_TEXCOORD2 = 5;

  /// Predefined constant `RL_DEFAULT_SHADER_ATTRIB_LOCATION_INDICES`.
  static final int RL_DEFAULT_SHADER_ATTRIB_LOCATION_INDICES = 6;

  /// Predefined constant `RL_DEFAULT_SHADER_ATTRIB_LOCATION_BONEIDS`.
  static final int RL_DEFAULT_SHADER_ATTRIB_LOCATION_BONEIDS = 7;

  /// Predefined constant `RL_DEFAULT_SHADER_ATTRIB_LOCATION_BONEWEIGHTS`.
  static final int RL_DEFAULT_SHADER_ATTRIB_LOCATION_BONEWEIGHTS = 8;

  /// Predefined constant `RL_SHADER_LOC_MAP_DIFFUSE`.
  static final int RL_SHADER_LOC_MAP_DIFFUSE = 15;

  /// Predefined constant `RL_SHADER_LOC_MAP_SPECULAR`.
  static final int RL_SHADER_LOC_MAP_SPECULAR = 16;

}