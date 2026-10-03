import 'package:raylib_dartified_base/raylib_dartified_base.dart';

// Exports everything that can be shared across Dart and Flat layers.

RaylibBase get _rl => RaylibBase.instance;

/// See [RaylibTemp].
RaylibTemp get _$ => _rl.Temp;

/// [RaylibTempStructAllocator] for [float3].
RaylibTempStructAllocator<float3> get float3$ => _$.structAlloc<float3>();
/// [RaylibTempStructAllocator] for [float16].
RaylibTempStructAllocator<float16> get float16$ => _$.structAlloc<float16>();

/// [RaylibTempStructAllocator] for [AutomationEventList].
RaylibTempStructAllocator<AutomationEventList> get AutomationEventList$ => _$.structAlloc<AutomationEventList>();
/// [RaylibTempStructAllocator] for [AutomationEvent].
RaylibTempStructAllocator<AutomationEvent> get AutomationEvent$ => _$.structAlloc<AutomationEvent>();
/// [RaylibTempStructAllocator] for [AudioStream].
RaylibTempStructAllocator<AudioStream> get AudioStream$ => _$.structAlloc<AudioStream>();
/// [RaylibTempStructAllocator] for [BoneInfo].
RaylibTempStructAllocator<BoneInfo> get BoneInfo$ => _$.structAlloc<BoneInfo>();
/// [RaylibTempStructAllocator] for [BoundingBox].
RaylibTempStructAllocator<BoundingBox> get BoundingBox$ => _$.structAlloc<BoundingBox>();
/// [RaylibTempStructAllocator] for [Camera2D].
RaylibTempStructAllocator<Camera2D> get Camera2D$ => _$.structAlloc<Camera2D>();
/// [RaylibTempStructAllocator] for [Camera3D].
RaylibTempStructAllocator<Camera3D> get Camera3D$ => _$.structAlloc<Camera3D>();
/// [RaylibTempStructAllocator] for [Color].
RaylibTempStructAllocator<Color> get Color$ => _$.structAlloc<Color>();
/// [RaylibTempStructAllocator] for [FilePathList].
RaylibTempStructAllocator<FilePathList> get FilePathList$ => _$.structAlloc<FilePathList>();
/// [RaylibTempStructAllocator] for [Font].
RaylibTempStructAllocator<Font> get Font$ => _$.structAlloc<Font>();
/// [RaylibTempStructAllocator] for [GestureEvent].
RaylibTempStructAllocator<GestureEvent> get GestureEvent$ => _$.structAlloc<GestureEvent>();
/// [RaylibTempStructAllocator] for [GlyphInfo].
RaylibTempStructAllocator<GlyphInfo> get GlyphInfo$ => _$.structAlloc<GlyphInfo>();
/// [RaylibTempStructAllocator] for [Image].
RaylibTempStructAllocator<Image> get Image$ => _$.structAlloc<Image>();
/// [RaylibTempStructAllocator] for [Light].
RaylibTempStructAllocator<Light> get Light$ => _$.structAlloc<Light>();
/// [RaylibTempStructAllocator] for [Material].
RaylibTempStructAllocator<Material> get Material$ => _$.structAlloc<Material>();
/// [RaylibTempStructAllocator] for [MaterialMap].
RaylibTempStructAllocator<MaterialMap> get MaterialMap$ => _$.structAlloc<MaterialMap>();
/// [RaylibTempStructAllocator] for [Matrix].
RaylibTempStructAllocator<Matrix> get Matrix$ => _$.structAlloc<Matrix>();
/// [RaylibTempStructAllocator] for [Mesh].
RaylibTempStructAllocator<Mesh> get Mesh$ => _$.structAlloc<Mesh>();
/// [RaylibTempStructAllocator] for [Model].
RaylibTempStructAllocator<Model> get Model$ => _$.structAlloc<Model>();
/// [RaylibTempStructAllocator] for [ModelAnimation].
RaylibTempStructAllocator<ModelAnimation> get ModelAnimation$ => _$.structAlloc<ModelAnimation>();
/// [RaylibTempStructAllocator] for [ModelSkeleton].
RaylibTempStructAllocator<ModelSkeleton> get ModelSkeleton$ => _$.structAlloc<ModelSkeleton>();
/// [RaylibTempStructAllocator] for [Music].
RaylibTempStructAllocator<Music> get Music$ => _$.structAlloc<Music>();
/// [RaylibTempStructAllocator] for [NPatchInfo].
RaylibTempStructAllocator<NPatchInfo> get NPatchInfo$ => _$.structAlloc<NPatchInfo>();
/// [RaylibTempStructAllocator] for [Quaternion].
RaylibTempStructAllocator<Quaternion> get Quaternion$ => _$.structAlloc<Quaternion>();
/// [RaylibTempStructAllocator] for [Rectangle].
RaylibTempStructAllocator<Rectangle> get Rectangle$ => _$.structAlloc<Rectangle>();
/// [RaylibTempStructAllocator] for [RlDrawCall].
RaylibTempStructAllocator<RlDrawCall> get RlDrawCall$ => _$.structAlloc<RlDrawCall>();
/// [RaylibTempStructAllocator] for [RlRenderBatch].
RaylibTempStructAllocator<RlRenderBatch> get RlRenderBatch$ => _$.structAlloc<RlRenderBatch>();
/// [RaylibTempStructAllocator] for [RlVertexBuffer].
RaylibTempStructAllocator<RlVertexBuffer> get RlVertexBuffer$ => _$.structAlloc<RlVertexBuffer>();
/// [RaylibTempStructAllocator] for [Ray].
RaylibTempStructAllocator<Ray> get Ray$ => _$.structAlloc<Ray>();
/// [RaylibTempStructAllocator] for [RayCollision].
RaylibTempStructAllocator<RayCollision> get RayCollision$ => _$.structAlloc<RayCollision>();
/// [RaylibTempStructAllocator] for [RenderTexture].
RaylibTempStructAllocator<RenderTexture> get RenderTexture$ => _$.structAlloc<RenderTexture>();
/// [RaylibTempStructAllocator] for [Shader].
RaylibTempStructAllocator<Shader> get Shader$ => _$.structAlloc<Shader>();
/// [RaylibTempStructAllocator] for [Sound].
RaylibTempStructAllocator<Sound> get Sound$ => _$.structAlloc<Sound>();
/// [RaylibTempStructAllocator] for [Texture].
RaylibTempStructAllocator<Texture> get Texture$ => _$.structAlloc<Texture>();
/// [RaylibTempStructAllocator] for [Transform].
RaylibTempStructAllocator<Transform> get Transform$ => _$.structAlloc<Transform>();
/// [RaylibTempStructAllocator] for [Vector2].
RaylibTempStructAllocator<Vector2> get Vector2$ => _$.structAlloc<Vector2>();
/// [RaylibTempStructAllocator] for [Vector3].
RaylibTempStructAllocator<Vector3> get Vector3$ => _$.structAlloc<Vector3>();
/// [RaylibTempStructAllocator] for [Vector4].
RaylibTempStructAllocator<Vector4> get Vector4$ => _$.structAlloc<Vector4>();
/// [RaylibTempStructAllocator] for [VrDeviceInfo].
RaylibTempStructAllocator<VrDeviceInfo> get VrDeviceInfo$ => _$.structAlloc<VrDeviceInfo>();
/// [RaylibTempStructAllocator] for [VrStereoConfig].
RaylibTempStructAllocator<VrStereoConfig> get VrStereoConfig$ => _$.structAlloc<VrStereoConfig>();
/// [RaylibTempStructAllocator] for [Wave].
RaylibTempStructAllocator<Wave> get Wave$ => _$.structAlloc<Wave>();

/// [RaylibTempStructAllocator] for [MsfGifResult].
RaylibTempStructAllocator<MsfGifResult> get MsfGifResult$ => _$.structAlloc<MsfGifResult>();
/// [RaylibTempStructAllocator] for [MsfGifState].
RaylibTempStructAllocator<MsfGifState> get MsfGifState$ => _$.structAlloc<MsfGifState>();