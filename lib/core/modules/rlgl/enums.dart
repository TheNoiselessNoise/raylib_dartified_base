part of '../../raylib_dartified_base.dart';

/// Rlgl `DrawMode` enum.
enum RlDrawMode {
  RL_LINES(0x0001),
  RL_TRIANGLES(0x0004),
  RL_QUADS(0x0007);

  final int value;
  const RlDrawMode(this.value);

  static RlDrawMode fromValue(int value) => switch (value) {
    0x0001 => RL_LINES,
    0x0004 => RL_TRIANGLES,
    0x0007 => RL_QUADS,
    _ => throw ArgumentError('Unknown value for rlDrawMode: $value'),
  };
}

/// Rlgl `ShaderType` enum.
enum RlShaderType {
  RL_FRAGMENT_SHADER(0x8B30),
  RL_VERTEX_SHADER(0x8B31),
  RL_COMPUTE_SHADER(0x91B9);

  final int value;
  const RlShaderType(this.value);

  static RlShaderType fromValue(int value) => switch (value) {
    0x8B30 => RL_FRAGMENT_SHADER,
    0x8B31 => RL_VERTEX_SHADER,
    0x91B9 => RL_COMPUTE_SHADER,
    _ => throw ArgumentError('Unknown value for rlShaderType: $value'),
  };
}

/// Rlgl `UsageHint` enum.
enum RlUsageHint {
  RL_STREAM_DRAW(0x88E0),
  RL_STREAM_READ(0x88E1),
  RL_STREAM_COPY(0x88E2),
  RL_STATIC_DRAW(0x88E4),
  RL_STATIC_READ(0x88E5),
  RL_STATIC_COPY(0x88E6),
  RL_DYNAMIC_DRAW(0x88E8),
  RL_DYNAMIC_READ(0x88E9),
  RL_DYNAMIC_COPY(0x88EA);

  final int value;
  const RlUsageHint(this.value);

  static RlUsageHint fromValue(int value) => switch (value) {
    0x88E0 => RL_STREAM_DRAW,
    0x88E1 => RL_STREAM_READ,
    0x88E2 => RL_STREAM_COPY,
    0x88E4 => RL_STATIC_DRAW,
    0x88E5 => RL_STATIC_READ,
    0x88E6 => RL_STATIC_COPY,
    0x88E8 => RL_DYNAMIC_DRAW,
    0x88E9 => RL_DYNAMIC_READ,
    0x88EA => RL_DYNAMIC_COPY,
    _ => throw ArgumentError('Unknown value for rlUsageHint: $value'),
  };
}

/// Rlgl `MatrixMode` enum.
enum RlMatrixMode {
  RL_MODELVIEW(0x1700),
  RL_PROJECTION(0x1701),
  RL_TEXTURE(0x1702);

  final int value;
  const RlMatrixMode(this.value);

  static RlMatrixMode fromValue(int value) => switch (value) {
    0x1700 => RL_MODELVIEW,
    0x1701 => RL_PROJECTION,
    0x1702 => RL_TEXTURE,
    _ => throw ArgumentError('Unknown value for rlMatrixMode: $value'),
  };
}

/// Rlgl `GlVersion` enum.
enum RlGlVersion {
  RL_OPENGL_11(1),
  RL_OPENGL_21(2),
  RL_OPENGL_33(3),
  RL_OPENGL_43(4),
  RL_OPENGL_ES_20(5),
  RL_OPENGL_ES_30(6);

  final int value;
  const RlGlVersion(this.value);

  static RlGlVersion fromValue(int value) => switch (value) {
    1 => RL_OPENGL_11,
    2 => RL_OPENGL_21,
    3 => RL_OPENGL_33,
    4 => RL_OPENGL_43,
    5 => RL_OPENGL_ES_20,
    6 => RL_OPENGL_ES_30,
    _ => throw ArgumentError('Unknown value for rlGlVersion: $value'),
  };
}

/// Rlgl `ShaderUniformDataType` enum.
enum RlShaderUniformDataType {
  RL_SHADER_UNIFORM_FLOAT(0),
  RL_SHADER_UNIFORM_VEC2(1),
  RL_SHADER_UNIFORM_VEC3(2),
  RL_SHADER_UNIFORM_VEC4(3),
  RL_SHADER_UNIFORM_INT(4),
  RL_SHADER_UNIFORM_IVEC2(5),
  RL_SHADER_UNIFORM_IVEC3(6),
  RL_SHADER_UNIFORM_IVEC4(7),
  RL_SHADER_UNIFORM_UINT(8),
  RL_SHADER_UNIFORM_UIVEC2(9),
  RL_SHADER_UNIFORM_UIVEC3(10),
  RL_SHADER_UNIFORM_UIVEC4(11),
  RL_SHADER_UNIFORM_SAMPLER2D(12);

  final int value;
  const RlShaderUniformDataType(this.value);

  static RlShaderUniformDataType fromValue(int value) => switch (value) {
    0 => RL_SHADER_UNIFORM_FLOAT,
    1 => RL_SHADER_UNIFORM_VEC2,
    2 => RL_SHADER_UNIFORM_VEC3,
    3 => RL_SHADER_UNIFORM_VEC4,
    4 => RL_SHADER_UNIFORM_INT,
    5 => RL_SHADER_UNIFORM_IVEC2,
    6 => RL_SHADER_UNIFORM_IVEC3,
    7 => RL_SHADER_UNIFORM_IVEC4,
    8 => RL_SHADER_UNIFORM_UINT,
    9 => RL_SHADER_UNIFORM_UIVEC2,
    10 => RL_SHADER_UNIFORM_UIVEC3,
    11 => RL_SHADER_UNIFORM_UIVEC4,
    12 => RL_SHADER_UNIFORM_SAMPLER2D,
    _ => throw ArgumentError(
      'Unknown value for rlShaderUniformDataType: $value',
    ),
  };
}

/// Rlgl `ShaderAttributeDataType` enum.
enum RlShaderAttributeDataType {
  RL_SHADER_ATTRIB_FLOAT(0),
  RL_SHADER_ATTRIB_VEC2(1),
  RL_SHADER_ATTRIB_VEC3(2),
  RL_SHADER_ATTRIB_VEC4(3);

  final int value;
  const RlShaderAttributeDataType(this.value);

  static RlShaderAttributeDataType fromValue(int value) => switch (value) {
    0 => RL_SHADER_ATTRIB_FLOAT,
    1 => RL_SHADER_ATTRIB_VEC2,
    2 => RL_SHADER_ATTRIB_VEC3,
    3 => RL_SHADER_ATTRIB_VEC4,
    _ => throw ArgumentError(
      'Unknown value for rlShaderAttributeDataType: $value',
    ),
  };
}

/// Rlgl `FramebufferAttachType` enum.
enum RlFramebufferAttachType {
  RL_ATTACHMENT_COLOR_CHANNEL0(0),
  RL_ATTACHMENT_COLOR_CHANNEL1(1),
  RL_ATTACHMENT_COLOR_CHANNEL2(2),
  RL_ATTACHMENT_COLOR_CHANNEL3(3),
  RL_ATTACHMENT_COLOR_CHANNEL4(4),
  RL_ATTACHMENT_COLOR_CHANNEL5(5),
  RL_ATTACHMENT_COLOR_CHANNEL6(6),
  RL_ATTACHMENT_COLOR_CHANNEL7(7),
  RL_ATTACHMENT_DEPTH(100),
  RL_ATTACHMENT_STENCIL(200);

  final int value;
  const RlFramebufferAttachType(this.value);

  static RlFramebufferAttachType fromValue(int value) => switch (value) {
    0 => RL_ATTACHMENT_COLOR_CHANNEL0,
    1 => RL_ATTACHMENT_COLOR_CHANNEL1,
    2 => RL_ATTACHMENT_COLOR_CHANNEL2,
    3 => RL_ATTACHMENT_COLOR_CHANNEL3,
    4 => RL_ATTACHMENT_COLOR_CHANNEL4,
    5 => RL_ATTACHMENT_COLOR_CHANNEL5,
    6 => RL_ATTACHMENT_COLOR_CHANNEL6,
    7 => RL_ATTACHMENT_COLOR_CHANNEL7,
    100 => RL_ATTACHMENT_DEPTH,
    200 => RL_ATTACHMENT_STENCIL,
    _ => throw ArgumentError(
      'Unknown value for rlFramebufferAttachType: $value',
    ),
  };
}

/// Rlgl `FramebufferAttachTextureType` enum.
enum RlFramebufferAttachTextureType {
  RL_ATTACHMENT_CUBEMAP_POSITIVE_X(0),
  RL_ATTACHMENT_CUBEMAP_NEGATIVE_X(1),
  RL_ATTACHMENT_CUBEMAP_POSITIVE_Y(2),
  RL_ATTACHMENT_CUBEMAP_NEGATIVE_Y(3),
  RL_ATTACHMENT_CUBEMAP_POSITIVE_Z(4),
  RL_ATTACHMENT_CUBEMAP_NEGATIVE_Z(5),
  RL_ATTACHMENT_TEXTURE2D(100),
  RL_ATTACHMENT_RENDERBUFFER(200);

  final int value;
  const RlFramebufferAttachTextureType(this.value);

  static RlFramebufferAttachTextureType fromValue(int value) => switch (value) {
    0 => RL_ATTACHMENT_CUBEMAP_POSITIVE_X,
    1 => RL_ATTACHMENT_CUBEMAP_NEGATIVE_X,
    2 => RL_ATTACHMENT_CUBEMAP_POSITIVE_Y,
    3 => RL_ATTACHMENT_CUBEMAP_NEGATIVE_Y,
    4 => RL_ATTACHMENT_CUBEMAP_POSITIVE_Z,
    5 => RL_ATTACHMENT_CUBEMAP_NEGATIVE_Z,
    100 => RL_ATTACHMENT_TEXTURE2D,
    200 => RL_ATTACHMENT_RENDERBUFFER,
    _ => throw ArgumentError(
      'Unknown value for rlFramebufferAttachTextureType: $value',
    ),
  };
}

/// Rlgl `CullMode` enum.
enum RlCullMode {
  RL_CULL_FACE_FRONT(0),
  RL_CULL_FACE_BACK(1);

  final int value;
  const RlCullMode(this.value);

  static RlCullMode fromValue(int value) => switch (value) {
    0 => RL_CULL_FACE_FRONT,
    1 => RL_CULL_FACE_BACK,
    _ => throw ArgumentError('Unknown value for rlCullMode: $value'),
  };
}