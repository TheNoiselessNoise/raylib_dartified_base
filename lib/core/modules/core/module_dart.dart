part of '../../raylib_dartified_base.dart';

/// Backend-agnostic contract for the Raylib Core module.
///
/// Concrete platform implementations mix in or extend this to provide
/// the full API surface across different backends.
final class RaylibCoreModule<R extends RaylibBase<R>> extends RaylibModule<R> {

  final _debugLabels = _RaylibCoreModuleDebugLabels();

  RaylibCoreModule(super.rl);

  // //////////// //
  // CUSTOM STUFF //
  // //////////// //

  MouseButtonInfo GetMouseButtonInfo(MouseButton button) => .new(
    up: IsMouseButtonUp(button),
    down: IsMouseButtonDown(button),
    pressed: IsMouseButtonPressed(button),
    released: IsMouseButtonReleased(button),
  );

  MouseInfo GetMouseInfo() => .new(
    position: GetMousePosition(),
    delta: GetMouseDelta(),
    wheel: GetMouseWheelMoveV(),
    btnLeft: GetMouseButtonInfo(.MOUSE_BUTTON_LEFT),
    btnMiddle: GetMouseButtonInfo(.MOUSE_BUTTON_MIDDLE),
    btnRight: GetMouseButtonInfo(.MOUSE_BUTTON_RIGHT),
    btnSide: GetMouseButtonInfo(.MOUSE_BUTTON_SIDE),
    btnExtra: GetMouseButtonInfo(.MOUSE_BUTTON_EXTRA),
    btnForward: GetMouseButtonInfo(.MOUSE_BUTTON_FORWARD),
    btnBack: GetMouseButtonInfo(.MOUSE_BUTTON_BACK),
  );

  // ////// //
  // MODULE //
  // ////// //

  /// Initialize window and OpenGL context
  void InitWindow(
    num width,
    num height,
    String title,
  ) => run(
    () => _debugLabels.InitWindow(width, height, title),
    () => rl.CoreFlat.InitWindow(
      width.toInt(),
      height.toInt(),
      rl.Temp.String$.ValueOrNull(title),
    ),
  );

  /// Close window and unload OpenGL context
  void CloseWindow() => run(
    () => _debugLabels.CloseWindow(),
    () => rl.CoreFlat.CloseWindow(),
  );

  /// Check if application should close ([KeyboardKey.KEY_ESCAPE] pressed or windows close icon clicked)
  bool WindowShouldClose() => run(
    () => _debugLabels.WindowShouldClose(),
    () => rl.CoreFlat.WindowShouldClose(),
  );

  /// Check if window has been initialized successfully
  bool IsWindowReady() => run(
    () => _debugLabels.IsWindowReady(),
    () => rl.CoreFlat.IsWindowReady(),
  );

  /// Check if window is currently fullscreen
  bool IsWindowFullscreen() => run(
    () => _debugLabels.IsWindowFullscreen(),
    () => rl.CoreFlat.IsWindowFullscreen(),
  );

  /// Check if window is currently hidden
  bool IsWindowHidden() => run(
    () => _debugLabels.IsWindowHidden(),
    () => rl.CoreFlat.IsWindowHidden(),
  );
    
  /// Check if window is currently minimized
  bool IsWindowMinimized() => run(
    () => _debugLabels.IsWindowMinimized(),
    () => rl.CoreFlat.IsWindowMinimized(),
  );
    
  /// Check if window is currently maximized
  bool IsWindowMaximized() => run(
    () => _debugLabels.IsWindowMaximized(),
    () => rl.CoreFlat.IsWindowMaximized(),
  );
    
  /// Check if window is currently focused
  bool IsWindowFocused() => run(
    () => _debugLabels.IsWindowFocused(),
    () => rl.CoreFlat.IsWindowFocused(),
  );
    
  /// Check if window has been resized last frame
  bool IsWindowResized() => run(
    () => _debugLabels.IsWindowResized(),
    () => rl.CoreFlat.IsWindowResized(),
  );
    
  /// Check if one specific window flag is enabled
  bool IsWindowState(
    ConfigFlags flag,
  ) => run(
    () => _debugLabels.IsWindowState(flag),
    () => rl.CoreFlat.IsWindowState(
      flag.value,
    ),
  );
    
  /// Set window configuration state using flags
  void SetWindowState(
    Iterable<ConfigFlags> flags,
  ) => run(
    () => _debugLabels.SetWindowState(flags),
    () => rl.CoreFlat.SetWindowState(
      rl.Utils.EnumsAsFlagsOr(flags),
    ),
  );
    
  /// Clear window configuration state flags
  void ClearWindowState(
    Iterable<ConfigFlags> flags,
  ) => run(
    () => _debugLabels.ClearWindowState(flags),
    () => rl.CoreFlat.ClearWindowState(
      rl.Utils.EnumsAsFlagsOr(flags),
    ),
  );
    
  /// Toggle window state: fullscreen/windowed, resizes monitor to match window resolution
  void ToggleFullscreen() => run(
    () => _debugLabels.ToggleFullscreen(),
    () => rl.CoreFlat.ToggleFullscreen(),
  );
    
  /// Toggle window state: borderless windowed, resizes window to match monitor resolution
  void ToggleBorderlessWindowed() => run(
    () => _debugLabels.ToggleBorderlessWindowed(),
    () => rl.CoreFlat.ToggleBorderlessWindowed(),
  );
    
  /// Set window state: maximized, if [ConfigFlags.FLAG_WINDOW_RESIZABLE]
  void MaximizeWindow() => run(
    () => _debugLabels.MaximizeWindow(),
    () => rl.CoreFlat.MaximizeWindow(),
  );
    
  /// Set window state: minimized, if [ConfigFlags.FLAG_WINDOW_RESIZABLE]
  void MinimizeWindow() => run(
    () => _debugLabels.MinimizeWindow(),
    () => rl.CoreFlat.MinimizeWindow(),
  );
    
  /// Set window state: not minimized/maximized
  void RestoreWindow() => run(
    () => _debugLabels.RestoreWindow(),
    () => rl.CoreFlat.RestoreWindow(),
  );
    
  /// Set icon for window (single image, RGBA 32bit)
  void SetWindowIcon(
    ImageD image,
  ) => run(
    () => _debugLabels.SetWindowIcon(image),
    () => rl.CoreFlat.SetWindowIcon(
      image,
    ),
  );
    
  /// Set icon for window (multiple images, RGBA 32bit)
  void SetWindowIcons(
    List<ImageD> images,
  ) => run(
    () => _debugLabels.SetWindowIcons(images),
    () => rl.CoreFlat.SetWindowIcons(
      rl.Temp.Image$.ArrayStruct(images),
      images.length,
    ),
  );
    
  /// Set title for window
  void SetWindowTitle(
    String title,
  ) => run(
    () => _debugLabels.SetWindowTitle(title),
    () => rl.CoreFlat.SetWindowTitle(
      rl.Temp.String$.ValueOrNull(title),
    ),
  );

  /// Set window position on screen
  void SetWindowPosition(
    num x,
    num y,
  ) => run(
    () => _debugLabels.SetWindowPosition(x, y),
    () => rl.CoreFlat.SetWindowPosition(
      x.toInt(),
      y.toInt(),
    ),
  );
    
  /// Set monitor for the current window
  void SetWindowMonitor(
    num monitor,
  ) => run(
    () => _debugLabels.SetWindowMonitor(monitor),
    () => rl.CoreFlat.SetWindowMonitor(
      monitor.toInt(),
    ),
  );
    
  /// Set window minimum dimensions (for [ConfigFlags.FLAG_WINDOW_RESIZABLE])
  void SetWindowMinSize(
    num width,
    num height,
  ) => run(
    () => _debugLabels.SetWindowMinSize(width, height),
    () => rl.CoreFlat.SetWindowMinSize(
      width.toInt(),
      height.toInt(),
    ),
  );

  /// Set window maximum dimensions (for [ConfigFlags.FLAG_WINDOW_RESIZABLE])
  void SetWindowMaxSize(
    num width,
    num height,
  ) => run(
    () => _debugLabels.SetWindowMaxSize(width, height),
    () => rl.CoreFlat.SetWindowMaxSize(
      width.toInt(),
      height.toInt(),
    ),
  );
    
  /// Set window dimensions
  void SetWindowSize(
    num width,
    num height,
  ) => run(
    () => _debugLabels.SetWindowSize(width, height),
    () => rl.CoreFlat.SetWindowSize(
      width.toInt(),
      height.toInt(),
    ),
  );

  /// Set window opacity [0.0..1.0]
  void SetWindowOpacity(
    num opacity,
  ) => run(
    () => _debugLabels.SetWindowOpacity(opacity),
    () => rl.CoreFlat.SetWindowOpacity(
      opacity.toDouble(),
    ),
  );
    
  /// Set window focused
  void SetWindowFocused() => run(
    () => _debugLabels.SetWindowFocused(),
    () => rl.CoreFlat.SetWindowFocused(),
  );

  /// Get current screen width
  int GetScreenWidth() => run(
    () => _debugLabels.GetScreenWidth(),
    () => rl.CoreFlat.GetScreenWidth(),
  );
    
  /// Get current screen height
  int GetScreenHeight() => run(
    () => _debugLabels.GetScreenHeight(),
    () => rl.CoreFlat.GetScreenHeight(),
  );
    
  /// Get current render width (it considers HiDPI)
  int GetRenderWidth() => run(
    () => _debugLabels.GetRenderWidth(),
    () => rl.CoreFlat.GetRenderWidth(),
  );
    
  /// Get current render height (it considers HiDPI)
  int GetRenderHeight() => run(
    () => _debugLabels.GetRenderHeight(),
    () => rl.CoreFlat.GetRenderHeight(),
  );
    
  /// Get number of connected monitors
  /// 
  /// **[!] Not implemented on WASM**
  int GetMonitorCount() => run(
    () => _debugLabels.GetMonitorCount(),
    () => rl.CoreFlat.GetMonitorCount(),
  );
    
  /// Get current monitor where window is placed
  /// 
  /// **[!] Not implemented on WASM**
  int GetCurrentMonitor() => run(
    () => _debugLabels.GetCurrentMonitor(),
    () => rl.CoreFlat.GetCurrentMonitor(),
  );
    
  /// Get specified monitor position
  /// 
  /// **[!] Not implemented on WASM**
  Vector2D GetMonitorPosition(
    num monitor,
  ) => run(
    () => _debugLabels.GetMonitorPosition(monitor),
    () => rl.CoreFlat.GetMonitorPosition(
      monitor.toInt(),
    ),
  );
    
  /// Get specified monitor width (current video mode used by monitor)
  int GetMonitorWidth(
    num monitor,
  ) => run(
    () => _debugLabels.GetMonitorWidth(monitor),
    () => rl.CoreFlat.GetMonitorWidth(
      monitor.toInt(),
    ),
  );
    
  /// Get specified monitor height (current video mode used by monitor)
  int GetMonitorHeight(
    num monitor,
  ) => run(
    () => _debugLabels.GetMonitorHeight(monitor),
    () => rl.CoreFlat.GetMonitorHeight(
      monitor.toInt(),
    ),
  );
    
  /// Get specified monitor physical width in millimetres
  /// 
  /// **[!] Not implemented on WASM**
  int GetMonitorPhysicalWidth(
    num monitor,
  ) => run(
    () => _debugLabels.GetMonitorPhysicalWidth(monitor),
    () => rl.CoreFlat.GetMonitorPhysicalWidth(
      monitor.toInt(),
    ),
  );
    
  /// Get specified monitor physical height in millimetres
  /// 
  /// **[!] Not implemented on WASM**
  int GetMonitorPhysicalHeight(
    num monitor,
  ) => run(
    () => _debugLabels.GetMonitorPhysicalHeight(monitor),
    () => rl.CoreFlat.GetMonitorPhysicalHeight(
      monitor.toInt(),
    ),
  );
    
  /// Get specified monitor refresh rate
  /// 
  /// **[!] Not implemented on WASM**
  int GetMonitorRefreshRate(
    num monitor,
  ) => run(
    () => _debugLabels.GetMonitorRefreshRate(monitor),
    () => rl.CoreFlat.GetMonitorRefreshRate(
      monitor.toInt(),
    ),
  );
    
  /// Get window position XY on monitor
  Vector2D GetWindowPosition() => run(
    () => _debugLabels.GetWindowPosition(),
    () => rl.CoreFlat.GetWindowPosition(),
  );
    
  /// Get window scale DPI factor
  Vector2D GetWindowScaleDPI() => run(
    () => _debugLabels.GetWindowScaleDPI(),
    () => rl.CoreFlat.GetWindowScaleDPI(),
  );
    
  /// Get the human-readable, UTF-8 encoded name of the specified monitor
  /// 
  /// **[!] Not implemented on WASM**
  String GetMonitorName(
    num monitor,
  ) => run(
    () => _debugLabels.GetMonitorName(monitor),
    () => rl.CoreFlat.GetMonitorName(
      monitor.toInt(),
    ).toDartString(),
  );
    
  /// Set clipboard text content
  void SetClipboardText(
    String text,
  ) => run(
    () => _debugLabels.SetClipboardText(text),
    () => rl.CoreFlat.SetClipboardText(
      rl.Temp.String$.ValueOrNull(text),
    ),
  );
    
  /// Get clipboard text content
  String GetClipboardText() => run(
    () => _debugLabels.GetClipboardText(),
    () => rl.CoreFlat.GetClipboardText().toDartString(),
  );
    
  /// Get clipboard image content
  ImageD GetClipboardImage() => run(
    () => _debugLabels.GetClipboardImage(),
    () => rl.CoreFlat.GetClipboardImage(),
  );
    
  /// Enable waiting for events on EndDrawing(), no automatic event polling
  void EnableEventWaiting() => run(
    () => _debugLabels.EnableEventWaiting(),
    () => rl.CoreFlat.EnableEventWaiting(),
  );
    
  /// Disable waiting for events on EndDrawing(), automatic events polling
  void DisableEventWaiting() => run(
    () => _debugLabels.DisableEventWaiting(),
    () => rl.CoreFlat.DisableEventWaiting(),
  );
    
  /// Shows cursor
  void ShowCursor() => run(
    () => _debugLabels.ShowCursor(),
    () => rl.CoreFlat.ShowCursor(),
  );
    
  /// Hides cursor
  void HideCursor() => run(
    () => _debugLabels.HideCursor(),
    () => rl.CoreFlat.HideCursor(),
  );
    
  /// Check if cursor is not visible
  bool IsCursorHidden() => run(
    () => _debugLabels.IsCursorHidden(),
    () => rl.CoreFlat.IsCursorHidden(),
  );
    
  /// Enables cursor (unlock cursor)
  void EnableCursor() => run(
    () => _debugLabels.EnableCursor(),
    () => rl.CoreFlat.EnableCursor(),
  );
    
  /// Disables cursor (lock cursor)
  void DisableCursor() => run(
    () => _debugLabels.DisableCursor(),
    () => rl.CoreFlat.DisableCursor(),
  );
    
  /// Check if cursor is on the screen
  bool IsCursorOnScreen() => run(
    () => _debugLabels.IsCursorOnScreen(),
    () => rl.CoreFlat.IsCursorOnScreen(),
  );
    
  /// Set background color (framebuffer clear color)
  void ClearBackground(
    ColorD color,
  ) => run(
    () => _debugLabels.ClearBackground(color),
    () => rl.CoreFlat.ClearBackground(
      color,
    ),
  );
    
  /// Setup canvas (framebuffer) to start drawing
  void BeginDrawing() => run(
    () => _debugLabels.BeginDrawing(),
    () => rl.CoreFlat.BeginDrawing(),
  );
    
  /// End canvas drawing and swap buffers (double buffering)
  void EndDrawing() => run(
    () => _debugLabels.EndDrawing(),
    () => rl.CoreFlat.EndDrawing(),
  );
    
  /// Begin 2D mode with custom camera (2D)
  void BeginMode2D(
    Camera2DD camera,
  ) => run(
    () => _debugLabels.BeginMode2D(camera),
    () => rl.CoreFlat.BeginMode2D(
      camera,
    ),
  );
    
  /// Ends 2D mode with custom camera
  void EndMode2D() => run(
    () => _debugLabels.EndMode2D(),
    () => rl.CoreFlat.EndMode2D(),
  );
    
  /// Begin 3D mode with custom camera (3D)
  void BeginMode3D(
    Camera3DD camera,
  ) => run(
    () => _debugLabels.BeginMode3D(camera),
    () => rl.CoreFlat.BeginMode3D(
      camera,
    ),
  );
    
  /// Ends 3D mode and returns to default 2D orthographic mode
  void EndMode3D() => run(
    () => _debugLabels.EndMode3D(),
    () => rl.CoreFlat.EndMode3D(),
  );
    
  /// Begin drawing to render texture
  void BeginTextureMode(
    RenderTextureD target,
  ) => run(
    () => _debugLabels.BeginTextureMode(target),
    () => rl.CoreFlat.BeginTextureMode(
      target,
    ),
  );
    
  /// Ends drawing to render texture
  void EndTextureMode() => run(
    () => _debugLabels.EndTextureMode(),
    () => rl.CoreFlat.EndTextureMode(),
  );
    
  /// Begin custom shader drawing
  void BeginShaderMode(
    ShaderD shader,
  ) => run(
    () => _debugLabels.BeginShaderMode(shader),
    () => rl.CoreFlat.BeginShaderMode(
      shader,
    ),
  );
    
  /// End custom shader drawing (use default shader)
  void EndShaderMode() => run(
    () => _debugLabels.EndShaderMode(),
    () => rl.CoreFlat.EndShaderMode(),
  );
    
  /// Begin blending mode (alpha, additive, multiplied, subtract, custom)
  void BeginBlendMode(
    BlendMode mode,
  ) => run(
    () => _debugLabels.BeginBlendMode(mode),
    () => rl.CoreFlat.BeginBlendMode(
      mode.value,
    ),
  );
    
  /// End blending mode (reset to default: alpha blending)
  void EndBlendMode() => run(
    () => _debugLabels.EndBlendMode(),
    () => rl.CoreFlat.EndBlendMode(),
  );
    
  /// Begin scissor mode (define screen area for following drawing)
  void BeginScissorMode(
    num x,
    num y,
    num width,
    num height,
  ) => run(
    () => _debugLabels.BeginScissorMode(x, y, width, height),
    () => rl.CoreFlat.BeginScissorMode(
      x.toInt(),
      y.toInt(),
      width.toInt(),
      height.toInt(),
    ),
  );
    
  /// End scissor mode
  void EndScissorMode() => run(
    () => _debugLabels.EndScissorMode(),
    () => rl.CoreFlat.EndScissorMode(),
  );
    
  /// Begin stereo rendering (requires VR simulator)
  void BeginVrStereoMode(
    VrStereoConfigD config,
  ) => run(
    () => _debugLabels.BeginVrStereoMode(config),
    () => rl.CoreFlat.BeginVrStereoMode(
      config,
    ),
  );
    
  /// End stereo rendering (requires VR simulator)
  void EndVrStereoMode() => run(
    () => _debugLabels.EndVrStereoMode(),
    () => rl.CoreFlat.EndVrStereoMode(),
  );
    
  /// Load VR stereo config for VR simulator device parameters
  VrStereoConfigD LoadVrStereoConfig(
    VrDeviceInfoD device,
  ) => run(
    () => _debugLabels.LoadVrStereoConfig(device),
    () => rl.CoreFlat.LoadVrStereoConfig(
      device,
    ),
  );
    
  /// Unload VR stereo config
  void UnloadVrStereoConfig(
    VrStereoConfigD config,
  ) => run(
    () => _debugLabels.UnloadVrStereoConfig(config),
    () => rl.CoreFlat.UnloadVrStereoConfig(
      config,
    ),
  );
    
  /// Load shader from files and bind default locations
  ShaderD LoadShader(
    String? vsFileName,
    String? fsFileName,
  ) => run(
    () => _debugLabels.LoadShader(vsFileName, fsFileName),
    () => rl.CoreFlat.LoadShader(
      rl.Temp.String$.ValueOrNull(vsFileName),
      rl.Temp.String$.ValueOrNull(fsFileName),
    ),
  );
    
  /// Load shader from code strings and bind default locations
  ShaderD LoadShaderFromMemory(
    String? vsCode,
    String? fsCode,
  ) => run(
    () => _debugLabels.LoadShaderFromMemory(vsCode, fsCode),
    () => rl.CoreFlat.LoadShaderFromMemory(
      rl.Temp.String$.ValueOrNull(vsCode),
      rl.Temp.String$.ValueOrNull(fsCode),
    ),
  );
    
  /// Check if a shader is valid (loaded on GPU)
  bool IsShaderValid(
    ShaderD shader,
  ) => run(
    () => _debugLabels.IsShaderValid(shader),
    () => rl.CoreFlat.IsShaderValid(
      shader,
    ),
  );
    
  /// Get shader uniform location
  int GetShaderLocation(
    ShaderD shader,
    String uniformName,
  ) => run(
    () => _debugLabels.GetShaderLocation(shader, uniformName),
    () => rl.CoreFlat.GetShaderLocation(
      shader,
      rl.Temp.String$.ValueOrNull(uniformName),
    ),
  );
    
  /// Get shader attribute location
  int GetShaderLocationAttrib(
    ShaderD shader,
    String attribName,
  ) => run(
    () => _debugLabels.GetShaderLocationAttrib(shader, attribName),
    () => rl.CoreFlat.GetShaderLocationAttrib(
      shader,
      rl.Temp.String$.ValueOrNull(attribName),
    ),
  );

  /// Set shader uniform value
  @nonVirtual
  void SetShaderValue(
    ShaderD shader,
    num locIndex,
    List<num> value,
    ShaderUniformDataType uniformType,
  ) => SetShaderValueV(
    shader,
    locIndex,
    value,
    uniformType,
    1
  );

  /// Set shader uniform value vector
  void SetShaderValueV(
    ShaderD shader,
    num locIndex,
    List<num> value,
    ShaderUniformDataType uniformType,
    num count,
  ) => run(
    () => _debugLabels.SetShaderValueV(shader, locIndex, value, uniformType, count),
    () {
      final ptr = switch (uniformType) {
        .SHADER_UNIFORM_FLOAT ||
        .SHADER_UNIFORM_VEC2  ||
        .SHADER_UNIFORM_VEC3  ||
        .SHADER_UNIFORM_VEC4  => rl.Temp.Float32$.Array(value),
        
        .SHADER_UNIFORM_INT   ||
        .SHADER_UNIFORM_IVEC2 ||
        .SHADER_UNIFORM_IVEC3 ||
        .SHADER_UNIFORM_IVEC4 => rl.Temp.Int$.Array(value),

        .SHADER_UNIFORM_UINT   ||
        .SHADER_UNIFORM_UIVEC2 ||
        .SHADER_UNIFORM_UIVEC3 ||
        .SHADER_UNIFORM_UIVEC4 => rl.Temp.UnsignedInt$.Array(value),
        
        .SHADER_UNIFORM_SAMPLER2D => rl.Temp.Int$.Array(value),
      };

      rl.CoreFlat.SetShaderValueV(
        shader,
        locIndex.toInt(),
        ptr.cast(),
        uniformType.value,
        count.toInt(),
      );
    },
  );
    
  /// Set shader uniform value (matrix 4x4)
  void SetShaderValueMatrix(
    ShaderD shader,
    num locIndex,
    MatrixD mat,
  ) => run(
    () => _debugLabels.SetShaderValueMatrix(shader, locIndex, mat),
    () => rl.CoreFlat.SetShaderValueMatrix(
      shader,
      locIndex.toInt(),
      mat,
    ),
  );
    
  /// Set shader uniform value for texture (sampler2d)
  void SetShaderValueTexture(
    ShaderD shader,
    num locIndex,
    TextureD texture,
  ) => run(
    () => _debugLabels.SetShaderValueTexture(shader, locIndex, texture),
    () => rl.CoreFlat.SetShaderValueTexture(
      shader,
      locIndex.toInt(),
      texture,
    ),
  );
    
  /// Unload shader from GPU memory (VRAM)
  void UnloadShader(
    ShaderD shader,
  ) => run(
    () => _debugLabels.UnloadShader(shader),
    () => rl.CoreFlat.UnloadShader(
      shader,
    ),
  );
    
  /// Get a ray trace from screen position (i.e mouse)
  RayD GetScreenToWorldRay(
    Vector2D position,
    Camera3DD camera,
  ) => run(
    () => _debugLabels.GetScreenToWorldRay(position, camera),
    () => rl.CoreFlat.GetScreenToWorldRay(
      position,
      camera,
    ),
  );
    
  /// Get a ray trace from screen position (i.e mouse) in a viewport
  RayD GetScreenToWorldRayEx(
    Vector2D position,
    Camera3DD camera,
    num width,
    num height,
  ) => run(
    () => _debugLabels.GetScreenToWorldRayEx(position, camera, width, height),
    () => rl.CoreFlat.GetScreenToWorldRayEx(
      position,
      camera,
      width.toInt(),
      height.toInt(),
    ),
  );

  /// Get the screen space position for a 3d world space position
  Vector2D GetWorldToScreen(
    Vector3D position,
    Camera3DD camera,
  ) => run(
    () => _debugLabels.GetWorldToScreen(position, camera),
    () => rl.CoreFlat.GetWorldToScreen(
      position,
      camera,
    ),
  );

  /// Get size position for a 3d world space position
  Vector2D GetWorldToScreenEx(
    Vector3D position,
    Camera3DD camera,
    num width,
    num height,
  ) => run(
    () => _debugLabels.GetWorldToScreenEx(position, camera, width, height),
    () => rl.CoreFlat.GetWorldToScreenEx(
      position,
      camera,
      width.toInt(),
      height.toInt(),
    ),
  );

  /// Get the screen space position for a 2d camera world space position
  Vector2D GetWorldToScreen2D(
    Vector2D position,
    Camera2DD camera,
  ) => run(
    () => _debugLabels.GetWorldToScreen2D(position, camera),
    () => rl.CoreFlat.GetWorldToScreen2D(
      position,
      camera,
    ),
  );

  /// Get the world space position for a 2d camera screen space position
  Vector2D GetScreenToWorld2D(
    Vector2D position,
    Camera2DD camera,
  ) => run(
    () => _debugLabels.GetScreenToWorld2D(position, camera),
    () => rl.CoreFlat.GetScreenToWorld2D(
      position,
      camera,
    ),
  );

  /// Get camera transform matrix (view matrix)
  MatrixD GetCameraMatrix(
    Camera3DD camera,
  ) => run(
    () => _debugLabels.GetCameraMatrix(camera),
    () => rl.CoreFlat.GetCameraMatrix(
      camera,
    ),
  );

  /// Get camera 2d transform matrix
  MatrixD GetCameraMatrix2D(
    Camera2DD camera,
  ) => run(
    () => _debugLabels.GetCameraMatrix2D(camera),
    () => rl.CoreFlat.GetCameraMatrix2D(
      camera,
    ),
  );
    
  /// Set target FPS (maximum)
  void SetTargetFPS(
    num fps,
  ) => run(
    () => _debugLabels.SetTargetFPS(fps),
    () => rl.CoreFlat.SetTargetFPS(
      fps.toInt(),
    ),
  );

  /// Get time in seconds for last frame drawn (delta time)
  double GetFrameTime() => run(
    () => _debugLabels.GetFrameTime(),
    () => rl.CoreFlat.GetFrameTime(),
  );

  /// Get elapsed time in seconds since InitWindow()
  double GetTime() => run(
    () => _debugLabels.GetTime(),
    () => rl.CoreFlat.GetTime(),
  );

  /// Get current FPS
  int GetFPS() => run(
    () => _debugLabels.GetFPS(),
    () => rl.CoreFlat.GetFPS(),
  );

  /// Swap back buffer with front buffer (screen drawing)
  void SwapScreenBuffer() => run(
    () => _debugLabels.SwapScreenBuffer(),
    () => rl.CoreFlat.SwapScreenBuffer(),
  );

  /// Register all input events
  void PollInputEvents() => run(
    () => _debugLabels.PollInputEvents(),
    () => rl.CoreFlat.PollInputEvents(),
  );

  /// Wait for some time (halt program execution)
  void WaitTime(
    num seconds,
  ) => run(
    () => _debugLabels.WaitTime(seconds),
    () => rl.CoreFlat.WaitTime(
      seconds.toDouble(),
    ),
  );

  /// Set the seed for the random number generator
  void SetRandomSeed(
    num seed,
  ) => run(
    () => _debugLabels.SetRandomSeed(seed),
    () => rl.CoreFlat.SetRandomSeed(
      seed.toInt(),
    ),
  );

  /// Get a random value between min and max (both included)
  int GetRandomValue(
    num min,
    num max,
  ) => run(
    () => _debugLabels.GetRandomValue(min, max),
    () => rl.CoreFlat.GetRandomValue(
      min.toInt(),
      max.toInt(),
    ),
  );

  /// Load random values sequence, no values repeated, min and max included
  List<int> LoadRandomSequence(
    num count,
    num min,
    num max,
  ) => run(
    () => _debugLabels.LoadRandomSequence(count, min, max),
    () {
      final seq = rl.CoreFlat.LoadRandomSequence(
        count.toInt(),
        min.toInt(),
        max.toInt(),
      );
      final List<int> values = .generate(count.toInt(), (i) => seq[i]);
      rl.CoreFlat.UnloadRandomSequence(seq);
      return values;
    },
  );
  
  /// Takes a screenshot of current screen (filename extension defines format)
  void TakeScreenshot(
    String fileName,
  ) => run(
    () => _debugLabels.TakeScreenshot(fileName),
    () => rl.CoreFlat.TakeScreenshot(
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );

  /// Setup init configuration flags (view [ConfigFlags])
  void SetConfigFlags(
    Iterable<ConfigFlags> flags,
  ) => run(
    () => _debugLabels.SetConfigFlags(flags),
    () => rl.CoreFlat.SetConfigFlags(
      rl.Utils.EnumsAsFlagsOr(flags),
    ),
  );

  /// Open URL with default system browser (if available)
  void OpenURL(
    String url,
  ) => run(
    () => _debugLabels.OpenURL(url),
    () => rl.CoreFlat.OpenURL(
      rl.Temp.String$.ValueOrNull(url),
    ),
  );

  /// Show trace log messages (LOG_DEBUG, LOG_INFO, LOG_WARNING, LOG_ERROR...)
  void TraceLog(
    TraceLogLevel logLevel,
    String text, [
      List<Object?> args = const [],
    ]
  ) => run(
    () => _debugLabels.TraceLog(logLevel, text),
    () => rl.CoreFlat.TraceLog(
      logLevel.value,
      rl.Temp.String$.ValueOrNull(
        rl.Utils.Format(text, args)
      ),
    ),
  );

  /// Set the current threshold (minimum) log level
  void SetTraceLogLevel(
    TraceLogLevel logLevel,
  ) => run(
    () => _debugLabels.SetTraceLogLevel(logLevel),
    () => rl.CoreFlat.SetTraceLogLevel(
      logLevel.value,
    ),
  );

  /// Set custom trace log
  void SetTraceLogCallback(
    covariant TraceLogCallbackBase? callback,
  ) => run(
    () => _debugLabels.SetTraceLogCallback(callback),
    () => rl.CoreFlat.SetTraceLogCallback(
      callback?.attach() ?? MemoryPointer.nullptr(),
    ),
  );
    
  /// Set custom file binary data loader
  void SetLoadFileDataCallback(
    covariant LoadFileDataCallbackBase? callback,
  ) => run(
    () => _debugLabels.SetLoadFileDataCallback(callback),
    () => rl.CoreFlat.SetLoadFileDataCallback(
      callback?.attach() ?? MemoryPointer.nullptr(),
    ),
  );
    
  /// Set custom file binary data saver
  void SetSaveFileDataCallback(
    covariant SaveFileDataCallbackBase? callback,
  ) => run(
    () => _debugLabels.SetSaveFileDataCallback(callback),
    () => rl.CoreFlat.SetSaveFileDataCallback(
      callback?.attach() ?? MemoryPointer.nullptr(),
    ),
  );
    
  /// Set custom file text data loader
  void SetLoadFileTextCallback(
    covariant LoadFileTextCallbackBase? callback,
  ) => run(
    () => _debugLabels.SetLoadFileTextCallback(callback),
    () => rl.CoreFlat.SetLoadFileTextCallback(
      callback?.attach() ?? MemoryPointer.nullptr(),
    ),
  );
    
  /// Set custom file text data saver
  void SetSaveFileTextCallback(
    covariant SaveFileTextCallbackBase? callback,
  ) => run(
    () => _debugLabels.SetSaveFileTextCallback(callback),
    () => rl.CoreFlat.SetSaveFileTextCallback(
      callback?.attach() ?? MemoryPointer.nullptr(),
    ),
  );
    
  /// Load file data as byte array (read)
  Uint8List LoadFileData(
    String fileName,
  ) => run(
    () => _debugLabels.LoadFileData(fileName),
    () {
      final fileSize = rl.Temp.Int$.Ref1();
      final data = rl.CoreFlat.LoadFileData(
        rl.Temp.String$.ValueOrNull(fileName),
        fileSize,
      );
      final bytes = rl.Temp.UnsignedChar$.asView(data, fileSize.value);
      final listData = Uint8List.fromList(bytes);
      rl.CoreFlat.UnloadFileData(data);
      return listData;
    },
  );

  /// Save data to file from byte array (write), returns true on success
  bool SaveFileData(
    String fileName,
    Uint8List data,
  ) => run(
    () => _debugLabels.SaveFileData(fileName, data),
    () => rl.CoreFlat.SaveFileData(
      rl.Temp.String$.ValueOrNull(fileName),
      rl.Temp.Uint8$.Array(data).cast(),
      data.length,
    ),
  );

  /// Export data to code (.h), returns true on success
  bool ExportDataAsCode(
    Uint8List data,
    String fileName,
  ) => run(
    () => _debugLabels.ExportDataAsCode(data, fileName),
    () => rl.CoreFlat.ExportDataAsCode(
      rl.Temp.Uint8$.Array(data),
      data.length,
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );

  /// Load text data from file (read)
  String LoadFileText(
    String fileName,
  ) => run(
    () => _debugLabels.LoadFileText(fileName),
    () {
      final text = rl.CoreFlat.LoadFileText(
        rl.Temp.String$.ValueOrNull(fileName),
      );
      final fileText = text.toDartString();
      rl.CoreFlat.UnloadFileText(text);
      return fileText;
    },
  );

  /// Save text data to file (write), returns true on success
  bool SaveFileText(
    String fileName,
    String text,
  ) => run(
    () => _debugLabels.SaveFileText(fileName, text),
    () => rl.CoreFlat.SaveFileText(
      rl.Temp.String$.ValueOrNull(fileName),
      rl.Temp.String$.ValueOrNull(text),
    ),
  );

  /// Rename file (if exists)
  int FileRename(
    String fileName,
    String fileRename,
  ) => run(
    () => _debugLabels.FileRename(fileName, fileRename),
    () => rl.CoreFlat.FileRename(
      rl.Temp.String$.ValueOrNull(fileName),
      rl.Temp.String$.ValueOrNull(fileRename),
    ),
  );
  
  /// Remove file (if exists)
  int FileRemove(
    String fileName,
  ) => run(
    () => _debugLabels.FileRemove(fileName),
    () => rl.CoreFlat.FileRemove(
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );
  
  /// Copy file from one path to another, dstPath created if it doesn't exist
  int FileCopy(
    String srcPath,
    String dstPath,
  ) => run(
    () => _debugLabels.FileCopy(srcPath, dstPath),
    () => rl.CoreFlat.FileCopy(
      rl.Temp.String$.ValueOrNull(srcPath),
      rl.Temp.String$.ValueOrNull(dstPath),
    ),
  );
  
  /// Move file from one directory to another, dstPath created if it doesn't exist
  int FileMove(
    String srcPath,
    String dstPath,
  ) => run(
    () => _debugLabels.FileMove(srcPath, dstPath),
    () => rl.CoreFlat.FileMove(
      rl.Temp.String$.ValueOrNull(srcPath),
      rl.Temp.String$.ValueOrNull(dstPath),
    ),
  );
  
  /// Replace text in an existing file
  int FileTextReplace(
    String fileName,
    String search,
    String replacement,
  ) => run(
    () => _debugLabels.FileTextReplace(fileName, search, replacement),
    () => rl.CoreFlat.FileTextReplace(
      rl.Temp.String$.ValueOrNull(fileName),
      rl.Temp.String$.ValueOrNull(search),
      rl.Temp.String$.ValueOrNull(replacement),
    ),
  );
  
  /// Find text in existing file
  int FileTextFindIndex(
    String fileName,
    String search,
  ) => run(
    () => _debugLabels.FileTextFindIndex(fileName, search),
    () => rl.CoreFlat.FileTextFindIndex(
      rl.Temp.String$.ValueOrNull(fileName),
      rl.Temp.String$.ValueOrNull(search),
    ),
  );
    
  /// Check if file exists
  bool FileExists(
    String fileName,
  ) => run(
    () => _debugLabels.FileExists(fileName),
    () => rl.CoreFlat.FileExists(
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );

  /// Check if a directory path exists
  bool DirectoryExists(
    String dirPath,
  ) => run(
    () => _debugLabels.DirectoryExists(dirPath),
    () => rl.CoreFlat.DirectoryExists(
      rl.Temp.String$.ValueOrNull(dirPath),
    ),
  );

  /// Check file extension (including point: .png, .wav)
  bool IsFileExtension(
    String fileName,
    String ext,
  ) => run(
    () => _debugLabels.IsFileExtension(fileName, ext),
    () => rl.CoreFlat.IsFileExtension(
      rl.Temp.String$.ValueOrNull(fileName),
      rl.Temp.String$.ValueOrNull(ext),
    ),
  );

  /// Get file length in bytes
  int GetFileLength(
    String fileName,
  ) => run(
    () => _debugLabels.GetFileLength(fileName),
    () => rl.CoreFlat.GetFileLength(
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );

  /// Get extension for a filename (includes dot: '.png')
  String GetFileExtension(
    String fileName,
  ) => run(
    () => _debugLabels.GetFileExtension(fileName),
    () => rl.CoreFlat.GetFileExtension(
      rl.Temp.String$.ValueOrNull(fileName),
    ).toDartString(),
  );

  /// Get filename for a path string
  String GetFileName(
    String filePath,
  ) => run(
    () => _debugLabels.GetFileName(filePath),
    () => rl.CoreFlat.GetFileName(
      rl.Temp.String$.ValueOrNull(filePath),
    ).toDartString(),
  );

  /// Get filename without extension
  String GetFileNameWithoutExt(
    String filePath,
  ) => run(
    () => _debugLabels.GetFileNameWithoutExt(filePath),
    () => rl.CoreFlat.GetFileNameWithoutExt(
      rl.Temp.String$.ValueOrNull(filePath),
    ).toDartString(),
  );

  /// Get the file count in a directory
  int GetDirectoryFileCount(
    String dirPath, 
  ) => run(
    () => _debugLabels.GetDirectoryFileCount(dirPath),
    () => rl.CoreFlat.GetDirectoryFileCount(
      rl.Temp.String$.ValueOrNull(dirPath),
    ),
  );
  
  /// Get the file count in a directory with extension filtering and recursive directory scan.
  /// 
  /// Use 'DIR' in the filter string to include directories in the result
  int GetDirectoryFileCountEx(
    String basePath,
    String filter,
    bool scanSubdirs,
  ) => run(
    () => _debugLabels.GetDirectoryFileCountEx(basePath, filter, scanSubdirs),
    () => rl.CoreFlat.GetDirectoryFileCountEx(
      rl.Temp.String$.ValueOrNull(basePath),
      rl.Temp.String$.ValueOrNull(filter),
      scanSubdirs,
    ),
  );

  /// Get full path for a given fileName with path
  String GetDirectoryPath(
    String filePath,
  ) => run(
    () => _debugLabels.GetDirectoryPath(filePath),
    () => rl.CoreFlat.GetDirectoryPath(
      rl.Temp.String$.ValueOrNull(filePath),
    ).toDartString(),
  );

  /// Get previous directory path for a given path
  String GetPrevDirectoryPath(
    String dirPath,
  ) => run(
    () => _debugLabels.GetPrevDirectoryPath(dirPath),
    () => rl.CoreFlat.GetPrevDirectoryPath(
      rl.Temp.String$.ValueOrNull(dirPath),
    ).toDartString(),
  );

  /// Get current working directory
  String GetWorkingDirectory() => run(
    () => _debugLabels.GetWorkingDirectory(),
    () => rl.CoreFlat.GetWorkingDirectory().toDartString(),
  );

  /// Get the directory of the running application
  String GetApplicationDirectory() => run(
    () => _debugLabels.GetApplicationDirectory(),
    () => rl.CoreFlat.GetApplicationDirectory().toDartString(),
  );

  /// Create directories (including full path requested), returns 0 on success
  int MakeDirectory(
    String dirPath,
  ) => run(
    () => _debugLabels.MakeDirectory(dirPath),
    () => rl.CoreFlat.MakeDirectory(
      rl.Temp.String$.ValueOrNull(dirPath),
    ),
  );

  /// Change working directory, return true on success
  bool ChangeDirectory(
    String dir,
  ) => run(
    () => _debugLabels.ChangeDirectory(dir),
    () => rl.CoreFlat.ChangeDirectory(
      rl.Temp.String$.ValueOrNull(dir),
    ),
  );

  /// Check if a given path is a file or a directory
  bool IsPathFile(
    String path,
  ) => run(
    () => _debugLabels.IsPathFile(path),
    () => rl.CoreFlat.IsPathFile(
      rl.Temp.String$.ValueOrNull(path),
    ),
  );

  /// Check if fileName is valid for the platform/OS
  bool IsFileNameValid(
    String fileName,
  ) => run(
    () => _debugLabels.IsFileNameValid(fileName),
    () => rl.CoreFlat.IsFileNameValid(
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );
    
  /// Load directory filepaths
  FilePathListD LoadDirectoryFiles(
    String dirPath,
  ) => run(
    () => _debugLabels.LoadDirectoryFiles(dirPath),
    () => rl.CoreFlat.LoadDirectoryFiles(
      rl.Temp.String$.ValueOrNull(dirPath),
    ),
  );
    
  /// Load directory filepaths with extension filtering and recursive directory scan.
  /// 
  /// Use 'DIR' in the filter string to include directories in the result
  FilePathListD LoadDirectoryFilesEx(
    String basePath,
    String filter,
    bool scanSubdirs,
  ) => run(
    () => _debugLabels.LoadDirectoryFilesEx(basePath, filter, scanSubdirs),
    () => rl.CoreFlat.LoadDirectoryFilesEx(
      rl.Temp.String$.ValueOrNull(basePath),
      rl.Temp.String$.ValueOrNull(filter),
      scanSubdirs,
    ),
  );

  /// Unload filepaths
  void UnloadDirectoryFiles(
    FilePathListD files,
  ) => run(
    () => _debugLabels.UnloadDirectoryFiles(files),
    () => rl.CoreFlat.UnloadDirectoryFiles(
      files,
    ),
  );
    
  /// Check if a file has been dropped into window
  bool IsFileDropped() => run(
    () => _debugLabels.IsFileDropped(),
    () => rl.CoreFlat.IsFileDropped(),
  );
    
  /// Load dropped filepaths
  FilePathListD LoadDroppedFiles() => run(
    () => _debugLabels.LoadDroppedFiles(),
    () => rl.CoreFlat.LoadDroppedFiles(),
  );

  /// Unload dropped filepaths
  void UnloadDroppedFiles(
    FilePathListD files,
  ) => run(
    () => _debugLabels.UnloadDroppedFiles(files),
    () => rl.CoreFlat.UnloadDroppedFiles(
      files,
    ),
  );

  /// Get file modification time (last write time)
  int GetFileModTime(
    String fileName,
  ) => run(
    () => _debugLabels.GetFileModTime(fileName),
    () => rl.CoreFlat.GetFileModTime(
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );

  /// Compress data (DEFLATE algorithm)
  Uint8List CompressData(
    Uint8List data,
  ) => run(
    () => _debugLabels.CompressData(data),
    () {
      final compDataSize = rl.Temp.Int$.Ref1();
      final compData = rl.CoreFlat.CompressData(
        rl.Temp.Uint8$.Array(data),
        data.length,
        compDataSize,
      );
      final newData = rl.Temp.UnsignedChar$.asTypedList(compData, compDataSize.value);
      compData.free();
      return newData;
    },
  );

  /// Decompress data (DEFLATE algorithm)
  Uint8List DecompressData(
    Uint8List compData,
  ) => run(
    () => _debugLabels.DecompressData(compData),
    () {
      final dataSize = rl.Temp.Int$.Ref1();
      final data = rl.CoreFlat.DecompressData(
        rl.Temp.Uint8$.Array(compData),
        compData.length,
        dataSize,
      );
      final newData = rl.Temp.UnsignedChar$.asTypedList(data, dataSize.value);
      data.free();
      return newData;
    },
  );

  /// Encode data to Base64 string
  Uint8List EncodeDataBase64(
    Uint8List data,
  ) => run(
    () => _debugLabels.EncodeDataBase64(data),
    () {
      final outputSize = rl.Temp.Int$.Ref1();
      final outputData = rl.CoreFlat.EncodeDataBase64(
        rl.Temp.Uint8$.Array(data),
        data.length,
        outputSize,
      );
      final newData = rl.Temp.Char$.asTypedList(outputData, outputSize.value);
      outputData.free();
      return .fromList(newData);
    },
  );

  /// Decode Base64 string data
  Uint8List DecodeDataBase64(
    Uint8List data,
  ) => run(
    () => _debugLabels.DecodeDataBase64(data),
    () {
      final outputSize = rl.Temp.Int$.Ref1();
      final outputData = rl.CoreFlat.DecodeDataBase64(
        rl.Temp.Int8$.Array(data),
        outputSize,
      );
      final newData = rl.Temp.UnsignedChar$.asTypedList(outputData, outputSize.value);
      outputData.free();
      return newData;
    },
  );

  /// Compute CRC32 hash code
  int ComputeCRC32(
    Uint8List data,
  ) => run(
    () => _debugLabels.ComputeCRC32(data),
    () => rl.CoreFlat.ComputeCRC32(
      rl.Temp.Uint8$.Array(data),
      data.length,
    ),
  );

  /// Compute MD5 hash code
  Uint8List ComputeMD5(
    Uint8List data,
  ) => run(
    () => _debugLabels.ComputeMD5(data),
    () => .fromList(rl.Temp.UnsignedInt$.ToLEBytes(
      rl.CoreFlat.ComputeMD5(
        rl.Temp.Uint8$.Array(data),
        data.length,
      ),
      rl.Utils.md5Uint32HashLength,
    )),
  );

  /// Compute SHA1 hash code
  Uint8List ComputeSHA1(
    Uint8List data,
  ) => run(
    () => _debugLabels.ComputeSHA1(data),
    () => .fromList(rl.Temp.UnsignedInt$.ToBEBytes(
      rl.CoreFlat.ComputeSHA1(
        rl.Temp.Uint8$.Array(data),
        data.length,
      ),
      rl.Utils.sha1Uint32HashLength,
    )),
  );

  /// Compute SHA256 hash code
  Uint8List ComputeSHA256(
    Uint8List data,
  ) => run(
    () => _debugLabels.ComputeSHA256(data),
    () => .fromList(rl.Temp.UnsignedInt$.ToBEBytes(
      rl.CoreFlat.ComputeSHA256(
        rl.Temp.Uint8$.Array(data),
        data.length,
      ),
      rl.Utils.sha256Uint32HashLength,
    )),
  );
    
  /// Load automation events list from file, NULL for empty list
  AutomationEventListD LoadAutomationEventList(
    String? fileName,
  ) => run(
    () => _debugLabels.LoadAutomationEventList(fileName),
    () => rl.CoreFlat.LoadAutomationEventList(
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );
    
  /// Unload automation events list from file
  void UnloadAutomationEventList(
    AutomationEventListD list,
  ) => run(
    () => _debugLabels.UnloadAutomationEventList(list),
    () => rl.CoreFlat.UnloadAutomationEventList(
      list,
    ),
  );
    
  /// Export automation events list as text file
  bool ExportAutomationEventList(
    AutomationEventListD list,
    String fileName,
  ) => run(
    () => _debugLabels.ExportAutomationEventList(list, fileName),
    () => rl.CoreFlat.ExportAutomationEventList(
      list,
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );
    
  /// Set automation event list to record to
  void SetAutomationEventList(
    AutomationEventListD list,
  ) => run(
    () => _debugLabels.SetAutomationEventList(list),
    () => rl.CoreFlat.SetAutomationEventList(
      rl.Temp.AutomationEventList$.Ref1(list),
    ),
  );
    
  /// Set automation event internal base frame to start recording
  void SetAutomationEventBaseFrame(
    int frame,
  ) => run(
    () => _debugLabels.SetAutomationEventBaseFrame(frame),
    () => rl.CoreFlat.SetAutomationEventBaseFrame(
      frame,
    ),
  );
    
  /// Start recording automation events (AutomationEventList must be set)
  void StartAutomationEventRecording() => run(
    () => _debugLabels.StartAutomationEventRecording(),
    () => rl.CoreFlat.StartAutomationEventRecording(),
  );

  /// Stop recording automation events
  void StopAutomationEventRecording() => run(
    () => _debugLabels.StopAutomationEventRecording(),
    () => rl.CoreFlat.StopAutomationEventRecording(),
  );
    
  /// Play a recorded automation event
  void PlayAutomationEvent(
    AutomationEventD event,
  ) => run(
    () => _debugLabels.PlayAutomationEvent(event),
    () => rl.CoreFlat.PlayAutomationEvent(
      event,
    ),
  );

  /// Check if a key has been pressed once
  bool IsKeyPressed(
    KeyboardKey key,
  ) => run(
    () => _debugLabels.IsKeyPressed(key),
    () => rl.CoreFlat.IsKeyPressed(
      key.value,
    ),
  );

  /// Check if a key has been pressed again
  bool IsKeyPressedRepeat(
    KeyboardKey key,
  ) => run(
    () => _debugLabels.IsKeyPressedRepeat(key),
    () => rl.CoreFlat.IsKeyPressedRepeat(
      key.value,
    ),
  );

  /// Check if a key is being pressed
  bool IsKeyDown(
    KeyboardKey key,
  ) => run(
    () => _debugLabels.IsKeyDown(key),
    () => rl.CoreFlat.IsKeyDown(
      key.value,
    ),
  );

  /// Check if a key has been released once
  bool IsKeyReleased(
    KeyboardKey key,
  ) => run(
    () => _debugLabels.IsKeyReleased(key),
    () => rl.CoreFlat.IsKeyReleased(
      key.value,
    ),
  );

  /// Check if a key is NOT being pressed
  bool IsKeyUp(
    KeyboardKey key,
  ) => run(
    () => _debugLabels.IsKeyUp(key),
    () => rl.CoreFlat.IsKeyUp(
      key.value,
    ),
  );

  /// Get name of a QWERTY key on the current keyboard layout (eg returns string 'q' for KEY_A on an AZERTY keyboard)
  /// 
  /// **[!] Not implemented on WASM**
  String GetKeyName(
    KeyboardKey key,
  ) => run(
    () => _debugLabels.GetKeyName(key),
    () => rl.CoreFlat.GetKeyName(
      key.value,
    ).toDartString(),
  );

  /// Get key pressed (keycode), call it multiple times for keys queued, returns 0 when the queue is empty
  int GetKeyPressed() => run(
    () => _debugLabels.GetKeyPressed(),
    () => rl.CoreFlat.GetKeyPressed(),
  );

  /// Get char pressed (unicode), call it multiple times for chars queued, returns 0 when the queue is empty
  int GetCharPressed() => run(
    () => _debugLabels.GetCharPressed(),
    () => rl.CoreFlat.GetCharPressed(),
  );

  /// Set a custom key to exit program (default is ESC)
  void SetExitKey(
    KeyboardKey key,
  ) => run(
    () => _debugLabels.SetExitKey(key),
    () => rl.CoreFlat.SetExitKey(
      key.value,
    ),
  );

  /// Check if a gamepad is available
  bool IsGamepadAvailable(
    num gamepad,
  ) => run(
    () => _debugLabels.IsGamepadAvailable(gamepad),
    () => rl.CoreFlat.IsGamepadAvailable(
      gamepad.toInt(),
    ),
  );

  /// Get gamepad internal name id
  String GetGamepadName(
    num gamepad,
  ) => run(
    () => _debugLabels.GetGamepadName(gamepad),
    () => rl.CoreFlat.GetGamepadName(
      gamepad.toInt(),
    ).toDartString(),
  );

  /// Check if a gamepad button has been pressed once
  bool IsGamepadButtonPressed(
    num gamepad,
    GamepadButton button,
  ) => run(
    () => _debugLabels.IsGamepadButtonPressed(gamepad, button),
    () => rl.CoreFlat.IsGamepadButtonPressed(
      gamepad.toInt(),
      button.value,
    ),
  );

  /// Check if a gamepad button is being pressed
  bool IsGamepadButtonDown(
    num gamepad,
    GamepadButton button,
  ) => run(
    () => _debugLabels.IsGamepadButtonDown(gamepad, button),
    () => rl.CoreFlat.IsGamepadButtonDown(
      gamepad.toInt(),
      button.value,
    ),
  );

  /// Check if a gamepad button has been released once
  bool IsGamepadButtonReleased(
    num gamepad,
    GamepadButton button,
  ) => run(
    () => _debugLabels.IsGamepadButtonReleased(gamepad, button),
    () => rl.CoreFlat.IsGamepadButtonReleased(
      gamepad.toInt(),
      button.value,
    ),
  );

  /// Check if a gamepad button is NOT being pressed
  bool IsGamepadButtonUp(
    num gamepad,
    GamepadButton button,
  ) => run(
    () => _debugLabels.IsGamepadButtonUp(gamepad, button),
    () => rl.CoreFlat.IsGamepadButtonUp(
      gamepad.toInt(),
      button.value,
    ),
  );

  /// Get the last gamepad button pressed
  GamepadButton GetGamepadButtonPressed() => run(
    () => _debugLabels.GetGamepadButtonPressed(),
    () => .fromValue(rl.CoreFlat.GetGamepadButtonPressed()),
  );

  /// Get gamepad axis count for a gamepad
  int GetGamepadAxisCount(
    num gamepad,
  ) => run(
    () => _debugLabels.GetGamepadAxisCount(gamepad),
    () => rl.CoreFlat.GetGamepadAxisCount(
      gamepad.toInt(),
    ),
  );

  /// Get axis movement value for a gamepad axis
  double GetGamepadAxisMovement(
    num gamepad,
    GamepadAxis axis,
  ) => run(
    () => _debugLabels.GetGamepadAxisMovement(gamepad, axis),
    () => rl.CoreFlat.GetGamepadAxisMovement(
      gamepad.toInt(),
      axis.value,
    ),
  );

  /// Set internal gamepad mappings (SDL_GameControllerDB)
  int SetGamepadMappings(
    String mappings,
  ) => run(
    () => _debugLabels.SetGamepadMappings(mappings),
    () => rl.CoreFlat.SetGamepadMappings(
      rl.Temp.String$.ValueOrNull(mappings),
    ),
  );
    
  /// Set gamepad vibration for both motors (duration in seconds)
  void SetGamepadVibration(
    num gamepad,
    num leftMotor,
    num rightMotor,
    num duration,
  ) => run(
    () => _debugLabels.SetGamepadVibration(gamepad, leftMotor, rightMotor, duration),
    () => rl.CoreFlat.SetGamepadVibration(
      gamepad.toInt(),
      leftMotor.toDouble(),
      rightMotor.toDouble(),
      duration.toDouble(),
    ),
  );

  /// Check if a mouse button has been pressed once
  bool IsMouseButtonPressed(
    MouseButton button,
  ) => run(
    () => _debugLabels.IsMouseButtonPressed(button),
    () => rl.CoreFlat.IsMouseButtonPressed(
      button.value,
    ),
  );

  /// Check if a mouse button is being pressed
  bool IsMouseButtonDown(
    MouseButton button,
  ) => run(
    () => _debugLabels.IsMouseButtonDown(button),
    () => rl.CoreFlat.IsMouseButtonDown(
      button.value,
    ),
  );

  /// Check if a mouse button has been released once
  bool IsMouseButtonReleased(
    MouseButton button,
  ) => run(
    () => _debugLabels.IsMouseButtonReleased(button),
    () => rl.CoreFlat.IsMouseButtonReleased(
      button.value,
    ),
  );

  /// Check if a mouse button is NOT being pressed
  bool IsMouseButtonUp(
    MouseButton button,
  ) => run(
    () => _debugLabels.IsMouseButtonUp(button),
    () => rl.CoreFlat.IsMouseButtonUp(
      button.value,
    ),
  );

  /// Get mouse position X
  int GetMouseX() => run(
    () => _debugLabels.GetMouseX(),
    () => rl.CoreFlat.GetMouseX(),
  );

  /// Get mouse position Y
  int GetMouseY() => run(
    () => _debugLabels.GetMouseY(),
    () => rl.CoreFlat.GetMouseY(),
  );

  /// Get mouse position XY
  Vector2D GetMousePosition() => run(
    () => _debugLabels.GetMousePosition(),
    () => rl.CoreFlat.GetMousePosition(),
  );

  /// Get mouse delta between frames
  Vector2D GetMouseDelta() => run(
    () => _debugLabels.GetMouseDelta(),
    () => rl.CoreFlat.GetMouseDelta(),
  );

  /// Set mouse position XY
  void SetMousePosition(
    num x,
    num y,
  ) => run(
    () => _debugLabels.SetMousePosition(x, y),
    () => rl.CoreFlat.SetMousePosition(
      x.toInt(),
      y.toInt(),
    ),
  );

  /// Set mouse offset
  void SetMouseOffset(
    num offsetX,
    num offsetY,
  ) => run(
    () => _debugLabels.SetMouseOffset(offsetX, offsetY),
    () => rl.CoreFlat.SetMouseOffset(
      offsetX.toInt(),
      offsetY.toInt(),
    ),
  );

  /// Set mouse scaling
  void SetMouseScale(
    num scaleX,
    num scaleY,
  ) => run(
    () => _debugLabels.SetMouseScale(scaleX, scaleY),
    () => rl.CoreFlat.SetMouseScale(
      scaleX.toDouble(),
      scaleY.toDouble(),
    ),
  );

  /// Get mouse wheel movement for X or Y, whichever is larger
  double GetMouseWheelMove() => run(
    () => _debugLabels.GetMouseWheelMove(),
    () => rl.CoreFlat.GetMouseWheelMove(),
  );

  /// Get mouse wheel movement for both X and Y
  Vector2D GetMouseWheelMoveV() => run(
    () => _debugLabels.GetMouseWheelMoveV(),
    () => rl.CoreFlat.GetMouseWheelMoveV(),
  );

  /// Set mouse cursor
  void SetMouseCursor(
    MouseCursor cursor,
  ) => run(
    () => _debugLabels.SetMouseCursor(cursor),
    () => rl.CoreFlat.SetMouseCursor(
      cursor.value,
    ),
  );

  /// Get touch position X for touch point 0 (relative to screen size)
  int GetTouchX() => run(
    () => _debugLabels.GetTouchX(),
    () => rl.CoreFlat.GetTouchX(),
  );

  /// Get touch position Y for touch point 0 (relative to screen size)
  int GetTouchY() => run(
    () => _debugLabels.GetTouchY(),
    () => rl.CoreFlat.GetTouchY(),
  );

  /// Get touch position XY for a touch point index (relative to screen size)
  Vector2D GetTouchPosition(
    num index,
  ) => run(
    () => _debugLabels.GetTouchPosition(index),
    () => rl.CoreFlat.GetTouchPosition(
      index.toInt(),
    ),
  );

  /// Get touch point identifier for given index
  int GetTouchPointId(
    num index,
  ) => run(
    () => _debugLabels.GetTouchPointId(index),
    () => rl.CoreFlat.GetTouchPointId(
      index.toInt(),
    ),
  );

  /// Get number of touch points
  int GetTouchPointCount() => run(
    () => _debugLabels.GetTouchPointCount(),
    () => rl.CoreFlat.GetTouchPointCount(),
  );

  /// Enable a set of gestures using flags [Gesture]
  void SetGesturesEnabled(
    Iterable<Gesture> flags,
  ) => run(
    () => _debugLabels.SetGesturesEnabled(flags),
    () => rl.CoreFlat.SetGesturesEnabled(
      rl.Utils.EnumsAsFlagsOr(flags),
    ),
  );

  /// Check if a gesture have been detected
  bool IsGestureDetected(
    Gesture key,
  ) => run(
    () => _debugLabels.IsGestureDetected(key),
    () => rl.CoreFlat.IsGestureDetected(
      key.value,
    ),
  );

  /// Get latest detected gesture
  Gesture GetGestureDetected() => run(
    () => _debugLabels.GetGestureDetected(),
    () => .fromValue(rl.CoreFlat.GetGestureDetected()),
  );

  /// Get gesture hold time in seconds
  double GetGestureHoldDuration() => run(
    () => _debugLabels.GetGestureHoldDuration(),
    () => rl.CoreFlat.GetGestureHoldDuration(),
  );

  /// Get gesture drag vector
  Vector2D GetGestureDragVector() => run(
    () => _debugLabels.GetGestureDragVector(),
    () => rl.CoreFlat.GetGestureDragVector(),
  );

  /// Get gesture drag angle
  double GetGestureDragAngle() => run(
    () => _debugLabels.GetGestureDragAngle(),
    () => rl.CoreFlat.GetGestureDragAngle(),
  );

  /// Get gesture pinch delta
  Vector2D GetGesturePinchVector() => run(
    () => _debugLabels.GetGesturePinchVector(),
    () => rl.CoreFlat.GetGesturePinchVector(),
  );

  /// Get gesture pinch angle
  double GetGesturePinchAngle() => run(
    () => _debugLabels.GetGesturePinchAngle(),
    () => rl.CoreFlat.GetGesturePinchAngle(),
  );

  /// Process gesture event and translate it into gestures
  void ProcessGestureEvent(
    GestureEventD event,
  ) => run(
    () => _debugLabels.ProcessGestureEvent(event),
    () => rl.CoreFlat.ProcessGestureEvent(
      event,
    ),
  );
  
  /// Update gestures detected (must be called every frame)
  void UpdateGestures() => run(
    () => _debugLabels.UpdateGestures(),
    () => rl.CoreFlat.UpdateGestures(),
  );
    
  /// Update camera position for selected mode
  void UpdateCamera(
    Camera3DD camera,
    CameraMode mode,
  ) => run(
    () => _debugLabels.UpdateCamera(camera, mode),
    () => rl.CoreFlat.UpdateCamera(
      rl.Temp.Camera3D$.Ref1(camera),
      mode.value,
    ),
  );

  /// Update camera movement/rotation
  void UpdateCameraPro(
    Camera3DD camera,
    Vector3D movement,
    Vector3D rotation,
    num zoom,
  ) => run(
    () => _debugLabels.UpdateCameraPro(camera, movement, rotation, zoom),
    () => rl.CoreFlat.UpdateCameraPro(
      rl.Temp.Camera3D$.Ref1(camera),
      movement,
      rotation,
      zoom.toDouble(),
    ),
  );

  /// Set texture and rectangle to be used on shapes drawing
  void SetShapesTexture(
    TextureD texture,
    RectangleD source,
  ) => run(
    () => _debugLabels.SetShapesTexture(texture, source),
    () => rl.CoreFlat.SetShapesTexture(
      texture,
      source,
    ),
  );

  /// Get texture that is used for shapes drawing
  TextureD GetShapesTexture() => run(
    () => _debugLabels.GetShapesTexture(),
    () => rl.CoreFlat.GetShapesTexture(),
  );

  /// Get texture source rectangle that is used for shapes drawing
  RectangleD GetShapesTextureRectangle() => run(
    () => _debugLabels.GetShapesTextureRectangle(),
    () => rl.CoreFlat.GetShapesTextureRectangle(),
  );

  /// Draw a pixel using geometry [Can be slow, use with care]
  void DrawPixel(
    num posX,
    num posY,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawPixel(posX, posY, color),
    () => rl.CoreFlat.DrawPixel(
      posX.toInt(),
      posY.toInt(),
      color,
    ),
  );

  /// Draw a pixel using geometry (Vector version) [Can be slow, use with care]
  void DrawPixelV(
    Vector2D position,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawPixelV(position, color),
    () => rl.CoreFlat.DrawPixelV(
      position,
      color,
    ),
  );
    
  /// Draw a line
  void DrawLine(
    num startPosX,
    num startPosY,
    num endPosX,
    num endPosY,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawLine(startPosX, startPosY, endPosX, endPosY, color),
    () => rl.CoreFlat.DrawLine(
      startPosX.toInt(),
      startPosY.toInt(),
      endPosX.toInt(),
      endPosY.toInt(),
      color,
    ),
  );

  /// Draw a line (using gl lines)
  void DrawLineV(
    Vector2D startPos,
    Vector2D endPos,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawLineV(startPos, endPos, color),
    () => rl.CoreFlat.DrawLineV(
      startPos,
      endPos,
      color,
    ),
  );

  /// Draw a line (using triangles/quads)
  void DrawLineEx(
    Vector2D startPos,
    Vector2D endPos,
    num thick,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawLineEx(startPos, endPos, thick, color),
    () => rl.CoreFlat.DrawLineEx(
      startPos,
      endPos,
      thick.toDouble(),
      color,
    ),
  );

  /// Draw lines sequence (using gl lines)
  void DrawLineStrip(
    List<Vector2D> points,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawLineStrip(points, color),
    () => rl.CoreFlat.DrawLineStrip(
      rl.Temp.Vector2$.ArrayStruct(points),
      points.length,
      color,
    ),
  );

  /// Draw line segment cubic-bezier in-out interpolation
  void DrawLineBezier(
    Vector2D startPos,
    Vector2D endPos,
    num thick,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawLineBezier(startPos, endPos, thick, color),
    () => rl.CoreFlat.DrawLineBezier(
      startPos,
      endPos,
      thick.toDouble(),
      color,
    ),
  );

  /// Draw a dashed line
  void DrawLineDashed(
    Vector2D startPos,
    Vector2D endPos,
    num dashSize,
    num spaceSize,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawLineDashed(startPos, endPos, dashSize, spaceSize, color),
    () => rl.CoreFlat.DrawLineDashed(
      startPos,
      endPos,
      dashSize.toInt(),
      spaceSize.toInt(),
      color,
    ),
  );

  /// Draw a color-filled circle
  void DrawCircle(
    num centerX,
    num centerY,
    num radius,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawCircle(centerX, centerY, radius, color),
    () => rl.CoreFlat.DrawCircle(
      centerX.toInt(),
      centerY.toInt(),
      radius.toDouble(),
      color,
    ),
  );

  /// Draw a piece of a circle
  void DrawCircleSector(
    Vector2D center,
    num radius,
    num startAngle,
    num endAngle,
    num segments,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawCircleSector(center, radius, startAngle, endAngle, segments, color),
    () => rl.CoreFlat.DrawCircleSector(
      center,
      radius.toDouble(),
      startAngle.toDouble(),
      endAngle.toDouble(),
      segments.toInt(),
      color,
    ),
  );

  /// Draw circle sector outline
  void DrawCircleSectorLines(
    Vector2D center,
    num radius,
    num startAngle,
    num endAngle,
    num segments,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawCircleSectorLines(center, radius, startAngle, endAngle, segments, color),
    () => rl.CoreFlat.DrawCircleSectorLines(
      center,
      radius.toDouble(),
      startAngle.toDouble(),
      endAngle.toDouble(),
      segments.toInt(),
      color,
    ),
  );

  /// Draw a gradient-filled circle
  void DrawCircleGradient(
    Vector2D center,
    num radius,
    ColorD inner,
    ColorD outer,
  ) => run(
    () => _debugLabels.DrawCircleGradient(center, radius, inner, outer),
    () => rl.CoreFlat.DrawCircleGradient(
      center,
      radius.toDouble(),
      inner,
      outer,
    ),
  );

  /// Draw a color-filled circle (Vector version)
  void DrawCircleV(
    Vector2D center,
    num radius,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawCircleV(center, radius, color),
    () => rl.CoreFlat.DrawCircleV(
      center,
      radius.toDouble(),
      color,
    ),
  );

  /// Draw circle outline
  void DrawCircleLines(
    num centerX,
    num centerY,
    num radius,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawCircleLines(centerX, centerY, radius, color),
    () => rl.CoreFlat.DrawCircleLines(
      centerX.toInt(),
      centerY.toInt(),
      radius.toDouble(),
      color,
    ),
  );

  /// Draw circle outline (Vector version)
  void DrawCircleLinesV(
    Vector2D center,
    num radius,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawCircleLinesV(center, radius, color),
    () => rl.CoreFlat.DrawCircleLinesV(
      center,
      radius.toDouble(),
      color,
    ),
  );
    
  /// Draw ellipse
  void DrawEllipse(
    num centerX,
    num centerY,
    num radiusH,
    num radiusV,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawEllipse(centerX, centerY, radiusH, radiusV, color),
    () => rl.CoreFlat.DrawEllipse(
      centerX.toInt(),
      centerY.toInt(),
      radiusH.toDouble(),
      radiusV.toDouble(),
      color,
    ),
  );

  /// Draw ellipse (Vector version)
  void DrawEllipseV(
    Vector2D center,
    num radiusH,
    num radiusV,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawEllipseV(center, radiusH, radiusV, color),
    () => rl.CoreFlat.DrawEllipseV(
      center,
      radiusH.toDouble(),
      radiusV.toDouble(),
      color,
    ),
  );

  /// Draw ellipse outline
  void DrawEllipseLines(
    num centerX,
    num centerY,
    num radiusH,
    num radiusV,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawEllipseLines(centerX, centerY, radiusH, radiusV, color),
    () => rl.CoreFlat.DrawEllipseLines(
      centerX.toInt(),
      centerY.toInt(),
      radiusH.toDouble(),
      radiusV.toDouble(),
      color,
    ),
  );

  /// Draw ellipse outline (Vector version)
  void DrawEllipseLinesV(
    Vector2D center,
    num radiusH,
    num radiusV,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawEllipseLinesV(center, radiusH, radiusV, color),
    () => rl.CoreFlat.DrawEllipseLinesV(
      center,
      radiusH.toDouble(),
      radiusV.toDouble(),
      color,
    ),
  );

  /// Draw ring
  void DrawRing(
    Vector2D center,
    num innerRadius,
    num outerRadius,
    num startAngle,
    num endAngle,
    num segments,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawRing(center, innerRadius, outerRadius, startAngle, endAngle, segments, color),
    () => rl.CoreFlat.DrawRing(
      center,
      innerRadius.toDouble(),
      outerRadius.toDouble(),
      startAngle.toDouble(),
      endAngle.toDouble(),
      segments.toInt(),
      color,
    ),
  );

  /// Draw ring outline
  void DrawRingLines(
    Vector2D center,
    num innerRadius,
    num outerRadius,
    num startAngle,
    num endAngle,
    num segments,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawRingLines(center, innerRadius, outerRadius, startAngle, endAngle, segments, color),
    () => rl.CoreFlat.DrawRingLines(
      center,
      innerRadius.toDouble(),
      outerRadius.toDouble(),
      startAngle.toDouble(),
      endAngle.toDouble(),
      segments.toInt(),
      color,
    ),
  );

  /// Draw a color-filled rectangle
  void DrawRectangle(
    num posX,
    num posY,
    num width,
    num height,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawRectangle(posX, posY, width, height, color),
    () => rl.CoreFlat.DrawRectangle(
      posX.toInt(),
      posY.toInt(),
      width.toInt(),
      height.toInt(),
      color,
    ),
  );

  /// Draw a color-filled rectangle (Vector version)
  void DrawRectangleV(
    Vector2D position,
    Vector2D size,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawRectangleV(position, size, color),
    () => rl.CoreFlat.DrawRectangleV(
      position,
      size,
      color,
    ),
  );

  /// Draw a color-filled rectangle
  void DrawRectangleRec(
    RectangleD rec,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawRectangleRec(rec, color),
    () => rl.CoreFlat.DrawRectangleRec(
      rec,
      color,
    ),
  );
    
  /// Draw a color-filled rectangle with pro parameters
  void DrawRectanglePro(
    RectangleD rec,
    Vector2D origin,
    num rotation,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawRectanglePro(rec, origin, rotation, color),
    () => rl.CoreFlat.DrawRectanglePro(
      rec,
      origin,
      rotation.toDouble(),
      color,
    ),
  );

  /// Draw a vertical-gradient-filled rectangle
  void DrawRectangleGradientV(
    num posX,
    num posY,
    num width,
    num height,
    ColorD top,
    ColorD bottom,
  ) => run(
    () => _debugLabels.DrawRectangleGradientV(posX, posY, width, height, top, bottom),
    () => rl.CoreFlat.DrawRectangleGradientV(
      posX.toInt(),
      posY.toInt(),
      width.toInt(),
      height.toInt(),
      top,
      bottom,
    ),
  );

  /// Draw a horizontal-gradient-filled rectangle
  void DrawRectangleGradientH(
    num posX,
    num posY,
    num width,
    num height,
    ColorD left,
    ColorD right,
  ) => run(
    () => _debugLabels.DrawRectangleGradientH(posX, posY, width, height, left, right),
    () => rl.CoreFlat.DrawRectangleGradientH(
      posX.toInt(),
      posY.toInt(),
      width.toInt(),
      height.toInt(),
      left,
      right,
    ),
  );

  /// Draw a gradient-filled rectangle with custom vertex colors
  void DrawRectangleGradientEx(
    RectangleD rec,
    ColorD topLeft,
    ColorD bottomLeft,
    ColorD topRight,
    ColorD bottomRight,
  ) => run(
    () => _debugLabels.DrawRectangleGradientEx(rec, topLeft, bottomLeft, topRight, bottomRight),
    () => rl.CoreFlat.DrawRectangleGradientEx(
      rec,
      topLeft,
      bottomLeft,
      topRight,
      bottomRight,
    ),
  );

  /// Draw rectangle outline
  void DrawRectangleLines(
    num posX,
    num posY,
    num width,
    num height,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawRectangleLines(posX, posY, width, height, color),
    () => rl.CoreFlat.DrawRectangleLines(
      posX.toInt(),
      posY.toInt(),
      width.toInt(),
      height.toInt(),
      color,
    ),
  );

  /// Draw rectangle outline with extended parameters
  void DrawRectangleLinesEx(
    RectangleD rec,
    num lineThick,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawRectangleLinesEx(rec, lineThick, color),
    () => rl.CoreFlat.DrawRectangleLinesEx(
      rec,
      lineThick.toDouble(),
      color,
    ),
  );

  /// Draw rectangle with rounded edges
  void DrawRectangleRounded(
    RectangleD rec,
    num roundness,
    num segments,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawRectangleRounded(rec, roundness, segments, color),
    () => rl.CoreFlat.DrawRectangleRounded(
      rec,
      roundness.toDouble(),
      segments.toInt(),
      color,
    ),
  );

  /// Draw rectangle lines with rounded edges
  void DrawRectangleRoundedLines(
    RectangleD rec,
    num roundness,
    num segments,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawRectangleRoundedLines(rec, roundness, segments, color),
    () => rl.CoreFlat.DrawRectangleRoundedLines(
      rec,
      roundness.toDouble(),
      segments.toInt(),
      color,
    ),
  );

  /// Draw rectangle with rounded edges outline
  void DrawRectangleRoundedLinesEx(
    RectangleD rec,
    num roundness,
    num segments,
    num lineThick,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawRectangleRoundedLinesEx(rec, roundness, segments, lineThick, color),
    () => rl.CoreFlat.DrawRectangleRoundedLinesEx(
      rec,
      roundness.toDouble(),
      segments.toInt(),
      lineThick.toDouble(),
      color,
    ),
  );
    
  /// Draw a color-filled triangle (vertex in counter-clockwise order!)
  void DrawTriangle(
    Vector2D v1,
    Vector2D v2,
    Vector2D v3,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawTriangle(v1, v2, v3, color),
    () => rl.CoreFlat.DrawTriangle(
      v1,
      v2,
      v3,
      color,
    ),
  );

  /// Draw triangle outline (vertex in counter-clockwise order!)
  void DrawTriangleLines(
    Vector2D v1,
    Vector2D v2,
    Vector2D v3,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawTriangleLines(v1, v2, v3, color),
    () => rl.CoreFlat.DrawTriangleLines(
      v1,
      v2,
      v3,
      color,
    ),
  );

  /// Draw a triangle fan defined by points (first vertex is the center)
  void DrawTriangleFan(
    List<Vector2D> points,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawTriangleFan(points, color),
    () => rl.CoreFlat.DrawTriangleFan(
      rl.Temp.Vector2$.ArrayStruct(points),
      points.length,
      color,
    ),
  );

  /// Draw a triangle strip defined by points
  void DrawTriangleStrip(
    List<Vector2D> points,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawTriangleStrip(points, color),
    () => rl.CoreFlat.DrawTriangleStrip(
      rl.Temp.Vector2$.ArrayStruct(points),
      points.length,
      color,
    ),
  );

  /// Draw a regular polygon (Vector version)
  void DrawPoly(
    Vector2D center,
    num sides,
    num radius,
    num rotation,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawPoly(center, sides, radius, rotation, color),
    () => rl.CoreFlat.DrawPoly(
      center,
      sides.toInt(),
      radius.toDouble(),
      rotation.toDouble(),
      color,
    ),
  );

  /// Draw a polygon outline of n sides
  void DrawPolyLines(
    Vector2D center,
    num sides,
    num radius,
    num rotation,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawPolyLines(center, sides, radius, rotation, color),
    () => rl.CoreFlat.DrawPolyLines(
      center,
      sides.toInt(),
      radius.toDouble(),
      rotation.toDouble(),
      color,
    ),
  );

  /// Draw a polygon outline of n sides with extended parameters
  void DrawPolyLinesEx(
    Vector2D center,
    num sides,
    num radius,
    num rotation,
    num lineThick,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawPolyLinesEx(center, sides, radius, rotation, lineThick, color),
    () => rl.CoreFlat.DrawPolyLinesEx(
      center,
      sides.toInt(),
      radius.toDouble(),
      rotation.toDouble(),
      lineThick.toDouble(),
      color,
    ),
  );

  /// Draw spline: Linear, minimum 2 points
  void DrawSplineLinear(
    List<Vector2D> points,
    num thick,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawSplineLinear(points, thick, color),
    () => rl.CoreFlat.DrawSplineLinear(
      rl.Temp.Vector2$.ArrayStruct(points),
      points.length,
      thick.toDouble(),
      color,
    ),
  );

  /// Draw spline: B-Spline, minimum 4 points
  void DrawSplineBasis(
    List<Vector2D> points,
    num thick,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawSplineBasis(points, thick, color),
    () => rl.CoreFlat.DrawSplineBasis(
      rl.Temp.Vector2$.ArrayStruct(points),
      points.length,
      thick.toDouble(),
      color,
    ),
  );

  /// Draw spline: Catmull-Rom, minimum 4 points
  void DrawSplineCatmullRom(
    List<Vector2D> points,
    num thick,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawSplineCatmullRom(points, thick, color),
    () => rl.CoreFlat.DrawSplineCatmullRom(
      rl.Temp.Vector2$.ArrayStruct(points),
      points.length, 
      thick.toDouble(), 
      color,
    ),
  );

  /// Draw spline: Quadratic Bezier, minimum 3 points (1 control point): [p1, c2, p3, c4...]
  void DrawSplineBezierQuadratic(
    List<Vector2D> points,
    num thick,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawSplineBezierQuadratic(points, thick, color),
    () => rl.CoreFlat.DrawSplineBezierQuadratic(
      rl.Temp.Vector2$.ArrayStruct(points),
      points.length,
      thick.toDouble(),
      color,
    ),
  );

  /// Draw spline: Cubic Bezier, minimum 4 points (2 control points): [p1, c2, c3, p4, c5, c6...]
  void DrawSplineBezierCubic(
    List<Vector2D> points,
    num thick,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawSplineBezierCubic(points, thick, color),
    () => rl.CoreFlat.DrawSplineBezierCubic(
      rl.Temp.Vector2$.ArrayStruct(points),
      points.length,
      thick.toDouble(),
      color,
    ),
  );
    
  /// Draw spline segment: Linear, 2 points
  void DrawSplineSegmentLinear(
    Vector2D p1,
    Vector2D p2,
    num thick,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawSplineSegmentLinear(p1, p2, thick, color),
    () => rl.CoreFlat.DrawSplineSegmentLinear(
      p1,
      p2,
      thick.toDouble(),
      color,
    ),
  );

  /// Draw spline segment: B-Spline, 4 points
  void DrawSplineSegmentBasis(
    Vector2D p1,
    Vector2D p2,
    Vector2D p3,
    Vector2D p4,
    num thick,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawSplineSegmentBasis(p1, p2, p3, p4, thick, color),
    () => rl.CoreFlat.DrawSplineSegmentBasis(
      p1,
      p2,
      p3,
      p4,
      thick.toDouble(),
      color,
    ),
  );

  /// Draw spline segment: Catmull-Rom, 4 points
  void DrawSplineSegmentCatmullRom(
    Vector2D p1,
    Vector2D p2,
    Vector2D p3,
    Vector2D p4,
    num thick,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawSplineSegmentCatmullRom(p1, p2, p3, p4, thick, color),
    () => rl.CoreFlat.DrawSplineSegmentCatmullRom(
      p1,
      p2,
      p3,
      p4,
      thick.toDouble(),
      color,
    ),
  );

  /// Draw spline segment: Quadratic Bezier, 2 points, 1 control point
  void DrawSplineSegmentBezierQuadratic(
    Vector2D p1,
    Vector2D c2,
    Vector2D p3,
    num thick,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawSplineSegmentBezierQuadratic(p1, c2, p3, thick, color),
    () => rl.CoreFlat.DrawSplineSegmentBezierQuadratic(
      p1,
      c2,
      p3,
      thick.toDouble(),
      color,
    ),
  );

  /// Draw spline segment: Cubic Bezier, 2 points, 2 control points
  void DrawSplineSegmentBezierCubic(
    Vector2D p1,
    Vector2D c2,
    Vector2D c3,
    Vector2D p4,
    num thick,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawSplineSegmentBezierCubic(p1, c2, c3, p4, thick, color),
    () => rl.CoreFlat.DrawSplineSegmentBezierCubic(
      p1,
      c2,
      c3,
      p4,
      thick.toDouble(),
      color,
    ),
  );

  /// Get (evaluate) spline point: Linear
  Vector2D GetSplinePointLinear(
    Vector2D startPos,
    Vector2D endPos,
    num t,
  ) => run(
    () => _debugLabels.GetSplinePointLinear(startPos, endPos, t),
    () => rl.CoreFlat.GetSplinePointLinear(
      startPos,
      endPos,
      t.toDouble(),
    ),
  );

  /// Get (evaluate) spline point: B-Spline
  Vector2D GetSplinePointBasis(
    Vector2D p1,
    Vector2D p2,
    Vector2D p3,
    Vector2D p4,
    num t,
  ) => run(
    () => _debugLabels.GetSplinePointBasis(p1, p2, p3, p4, t),
    () => rl.CoreFlat.GetSplinePointBasis(
      p1,
      p2,
      p3,
      p4,
      t.toDouble(),
    ),
  );
    
  /// Get (evaluate) spline point: Catmull-Rom
  Vector2D GetSplinePointCatmullRom(
    Vector2D p1,
    Vector2D p2,
    Vector2D p3,
    Vector2D p4,
    num t,
  ) => run(
    () => _debugLabels.GetSplinePointCatmullRom(p1, p2, p3, p4, t),
    () => rl.CoreFlat.GetSplinePointCatmullRom(
      p1,
      p2,
      p3,
      p4,
      t.toDouble(),
    ),
  );

  /// Get (evaluate) spline point: Quadratic Bezier
  Vector2D GetSplinePointBezierQuad(
    Vector2D p1,
    Vector2D c2,
    Vector2D p3,
    num t,
  ) => run(
    () => _debugLabels.GetSplinePointBezierQuad(p1, c2, p3, t),
    () => rl.CoreFlat.GetSplinePointBezierQuad(
      p1,
      c2,
      p3,
      t.toDouble(),
    ),
  );

  /// Get (evaluate) spline point: Cubic Bezier
  Vector2D GetSplinePointBezierCubic(
    Vector2D p1,
    Vector2D c2,
    Vector2D c3,
    Vector2D p4,
    num t,
  ) => run(
    () => _debugLabels.GetSplinePointBezierCubic(p1, c2, c3, p4, t),
    () => rl.CoreFlat.GetSplinePointBezierCubic(
      p1,
      c2,
      c3,
      p4,
      t.toDouble(),
    ),
  );

  /// Check collision between two rectangles
  bool CheckCollisionRecs(
    RectangleD rec1,
    RectangleD rec2,
  ) => run(
    () => _debugLabels.CheckCollisionRecs(rec1, rec2),
    () => rl.CoreFlat.CheckCollisionRecs(
      rec1,
      rec2,
    ),
  );

  /// Check collision between two circles
  bool CheckCollisionCircles(
    Vector2D center1,
    num radius1,
    Vector2D center2,
    num radius2,
  ) => run(
    () => _debugLabels.CheckCollisionCircles(center1, radius1, center2, radius2),
    () => rl.CoreFlat.CheckCollisionCircles(
      center1,
      radius1.toDouble(),
      center2,
      radius2.toDouble(),
    ),
  );

  /// Check collision between circle and rectangle
  bool CheckCollisionCircleRec(
    Vector2D center,
    num radius,
    RectangleD rec,
  ) => run(
    () => _debugLabels.CheckCollisionCircleRec(center, radius, rec),
    () => rl.CoreFlat.CheckCollisionCircleRec(
      center,
      radius.toDouble(),
      rec,
    ),
  );

  /// Check if circle collides with a line created betweeen two points [p1] and [p2]
  bool CheckCollisionCircleLine(
    Vector2D center,
    num radius,
    Vector2D p1,
    Vector2D p2,
  ) => run(
    () => _debugLabels.CheckCollisionCircleLine(center, radius, p1, p2),
    () => rl.CoreFlat.CheckCollisionCircleLine(
      center,
      radius.toDouble(),
      p1,
      p2,
    ),
  );

  /// Check if point is inside rectangle
  bool CheckCollisionPointRec(
    Vector2D point,
    RectangleD rec,
  ) => run(
    () => _debugLabels.CheckCollisionPointRec(point, rec),
    () => rl.CoreFlat.CheckCollisionPointRec(
      point,
      rec,
    ),
  );
    
  /// Check if point is inside circle
  bool CheckCollisionPointCircle(
    Vector2D point,
    Vector2D center,
    num radius,
  ) => run(
    () => _debugLabels.CheckCollisionPointCircle(point, center, radius),
    () => rl.CoreFlat.CheckCollisionPointCircle(
      point,
      center,
      radius.toDouble(),
    ),
  );

  /// Check if point is inside a triangle
  bool CheckCollisionPointTriangle(
    Vector2D point,
    Vector2D p1,
    Vector2D p2,
    Vector2D p3,
  ) => run(
    () => _debugLabels.CheckCollisionPointTriangle(point, p1, p2, p3),
    () => rl.CoreFlat.CheckCollisionPointTriangle(
      point,
      p1,
      p2,
      p3,
    ),
  );

  /// Check if point belongs to line created between two points [p1] and [p2] with defined margin in pixels [threshold]
  bool CheckCollisionPointLine(
    Vector2D point,
    Vector2D p1,
    Vector2D p2,
    num threshold,
  ) => run(
    () => _debugLabels.CheckCollisionPointLine(point, p1, p2, threshold),
    () => rl.CoreFlat.CheckCollisionPointLine(
      point,
      p1,
      p2,
      threshold.toInt(),
    ),
  );

  /// Check if point is within a polygon described by array of vertices
  bool CheckCollisionPointPoly(
    Vector2D point,
    List<Vector2D> points,
  ) => run(
    () => _debugLabels.CheckCollisionPointPoly(point, points),
    () => rl.CoreFlat.CheckCollisionPointPoly(
      point,
      rl.Temp.Vector2$.ArrayStruct(points),
      points.length,
    ),
  );

  /// Check the collision between two lines defined by two points each, returns collision point by reference
  (bool result, Vector2D collisionPoint) CheckCollisionLines(
    Vector2D startPos1,
    Vector2D endPos1,
    Vector2D startPos2,
    Vector2D endPos2,
  ) => run(
    () => _debugLabels.CheckCollisionLines(startPos1, endPos1, startPos2, endPos2),
    () {
      final collisionPoint = rl.Temp.Vector2$.Ref5();
      final result = rl.CoreFlat.CheckCollisionLines(
        startPos1,
        endPos1,
        startPos2,
        endPos2,
        collisionPoint,
      );
      return (result, collisionPoint.ref);
    },
  );

  /// Get collision rectangle for two rectangles collision
  RectangleD GetCollisionRec(
    RectangleD rec1,
    RectangleD rec2,
  ) => run(
    () => _debugLabels.GetCollisionRec(rec1, rec2),
    () => rl.CoreFlat.GetCollisionRec(
      rec1,
      rec2,
    ),
  );

  /// Load image from file into CPU memory (RAM)
  ImageD LoadImage(
    String fileName,
  ) => run(
    () => _debugLabels.LoadImage(fileName),
    () => rl.CoreFlat.LoadImage(
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );
    
  /// Load image from RAW file data
  ImageD LoadImageRaw(
    String fileName,
    num width,
    num height,
    PixelFormat format,
    num headerSize,
  ) => run(
    () => _debugLabels.LoadImageRaw(fileName, width, height, format, headerSize),
    () => rl.CoreFlat.LoadImageRaw(
      rl.Temp.String$.ValueOrNull(fileName),
      width.toInt(),
      height.toInt(),
      format.value,
      headerSize.toInt(),
    ),
  );

  /// Load image sequence from file (frames appended to image.data)
  ImageD LoadImageAnim(
    String fileName,
  ) => run(
    () => _debugLabels.LoadImageAnim(fileName),
    () {
      final frames = rl.Temp.Int$.Ref1();
      final image = rl.CoreFlat.LoadImageAnim(
        rl.Temp.String$.ValueOrNull(fileName),
        frames,
      );
      image.frameCount = frames.value;
      return image;
    },
  );

  /// Load image sequence from memory buffer
  ImageD LoadImageAnimFromMemory(
    String fileType,
    Uint8List fileData,
  ) => run(
    () => _debugLabels.LoadImageAnimFromMemory(fileType, fileData),
    () {
      final frames = rl.Temp.Int$.Ref1();
      final image = rl.CoreFlat.LoadImageAnimFromMemory(
        rl.Temp.String$.ValueOrNull(fileType),
        rl.Temp.UnsignedChar$.Array(fileData),
        fileData.length,
        frames,
      );
      image.frameCount = frames.value;
      return image;
    },
  );

  /// Load image from memory buffer, fileType refers to extension: i.e. '.png'
  ImageD LoadImageFromMemory(
    String fileType,
    Uint8List fileData,
  ) => run(
    () => _debugLabels.LoadImageFromMemory(fileType, fileData),
    () => rl.CoreFlat.LoadImageFromMemory(
      rl.Temp.String$.ValueOrNull(fileType),
      rl.Temp.UnsignedChar$.Array(fileData),
      fileData.length,
    ),
  );

  /// Load image from GPU texture data
  ImageD LoadImageFromTexture(
    TextureD texture,
  ) => run(
    () => _debugLabels.LoadImageFromTexture(texture),
    () => rl.CoreFlat.LoadImageFromTexture(
      texture,
    ),
  );

  /// Load image from screen buffer and (screenshot)
  ImageD LoadImageFromScreen() => run(
    () => _debugLabels.LoadImageFromScreen(),
    () => rl.CoreFlat.LoadImageFromScreen(),
  );

  /// Check if an image is valid (data and parameters)
  bool IsImageValid(
    ImageD image,
  ) => run(
    () => _debugLabels.IsImageValid(image),
    () => rl.CoreFlat.IsImageValid(
      image,
    ),
  );

  /// Unload image from CPU memory (RAM)
  void UnloadImage(
    ImageD image,
  ) => run(
    () => _debugLabels.UnloadImage(image),
    () => rl.CoreFlat.UnloadImage(
      image,
    ),
  );

  /// Export image data to file, returns true on success
  bool ExportImage(
    ImageD image,
    String fileName,
  ) => run(
    () => _debugLabels.ExportImage(image, fileName),
    () => rl.CoreFlat.ExportImage(
      image,
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );
    
  /// Export image to memory buffer
  (MemoryPointer<RUint8> dataPtr, int dataSize) ExportImageToMemory(
    ImageD image,
    String fileType,
  ) => run(
    () => _debugLabels.ExportImageToMemory(image, fileType),
    () {
      final dataSize = rl.Temp.Int$.Ref1();
      final dataPtr = rl.CoreFlat.ExportImageToMemory(
        image,
        rl.Temp.String$.ValueOrNull(fileType),
        dataSize,
      );
      return (dataPtr, dataSize.value);
    },
  );

  /// Export image as code file defining an array of bytes, returns true on success
  bool ExportImageAsCode(
    ImageD image,
    String fileName,
  ) => run(
    () => _debugLabels.ExportImageAsCode(image, fileName),
    () => rl.CoreFlat.ExportImageAsCode(
      image,
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );

  /// Generate image: plain color
  ImageD GenImageColor(
    num width,
    num height,
    ColorD color,
  ) => run(
    () => _debugLabels.GenImageColor(width, height, color),
    () => rl.CoreFlat.GenImageColor(
      width.toInt(),
      height.toInt(),
      color,
    ),
  );

  /// Generate image: linear gradient, direction in degrees [0..360], 0=Vertical gradient
  ImageD GenImageGradientLinear(
    num width,
    num height,
    num direction,
    ColorD start,
    ColorD end,
  ) => run(
    () => _debugLabels.GenImageGradientLinear(width, height, direction, start, end),
    () => rl.CoreFlat.GenImageGradientLinear(
      width.toInt(),
      height.toInt(),
      direction.toInt(),
      start,
      end,
    ),
  );

  /// Generate image: radial gradient
  ImageD GenImageGradientRadial(
    num width,
    num height,
    num density,
    ColorD inner,
    ColorD outer,
  ) => run(
    () => _debugLabels.GenImageGradientRadial(width, height, density, inner, outer),
    () => rl.CoreFlat.GenImageGradientRadial(
      width.toInt(),
      height.toInt(),
      density.toDouble(),
      inner,
      outer,
    ),
  );

  /// Generate image: square gradient
  ImageD GenImageGradientSquare(
    num width,
    num height,
    num density,
    ColorD inner,
    ColorD outer,
  ) => run(
    () => _debugLabels.GenImageGradientSquare(width, height, density, inner, outer),
    () => rl.CoreFlat.GenImageGradientSquare(
      width.toInt(),
      height.toInt(),
      density.toDouble(),
      inner,
      outer,
    ),
  );

  /// Generate image: checked
  ImageD GenImageChecked(
    num width,
    num height,
    num checksX,
    num checksY,
    ColorD col1,
    ColorD col2,
  ) => run(
    () => _debugLabels.GenImageChecked(width, height, checksX, checksY, col1, col2),
    () => rl.CoreFlat.GenImageChecked(
      width.toInt(),
      height.toInt(),
      checksX.toInt(),
      checksY.toInt(),
      col1,
      col2,
    ),
  );

  /// Generate image: white noise
  ImageD GenImageWhiteNoise(
    num width,
    num height,
    num factor,
  ) => run(
    () => _debugLabels.GenImageWhiteNoise(width, height, factor),
    () => rl.CoreFlat.GenImageWhiteNoise(
      width.toInt(),
      height.toInt(),
      factor.toDouble(),
    ),
  );

  /// Generate image: perlin noise
  ImageD GenImagePerlinNoise(
    num width,
    num height,
    num offsetX,
    num offsetY,
    num scale,
  ) => run(
    () => _debugLabels.GenImagePerlinNoise(width, height, offsetX, offsetY, scale),
    () => rl.CoreFlat.GenImagePerlinNoise(
      width.toInt(),
      height.toInt(),
      offsetX.toInt(),
      offsetY.toInt(),
      scale.toDouble(),
    ),
  );
    
  /// Generate image: cellular algorithm, bigger tileSize means bigger cells
  ImageD GenImageCellular(
    num width,
    num height,
    num tileSize,
  ) => run(
    () => _debugLabels.GenImageCellular(width, height, tileSize),
    () => rl.CoreFlat.GenImageCellular(
      width.toInt(),
      height.toInt(),
      tileSize.toInt(),
    ),
  );

  /// Generate image: grayscale image from text data
  ImageD GenImageText(
    num width,
    num height,
    String text,
  ) => run(
    () => _debugLabels.GenImageText(width, height, text),
    () => rl.CoreFlat.GenImageText(
      width.toInt(),
      height.toInt(),
      rl.Temp.String$.ValueOrNull(text),
    ),
  );

  /// Create an image duplicate (useful for transformations)
  ImageD ImageCopy(
    ImageD image,
  ) => run(
    () => _debugLabels.ImageCopy(image),
    () => rl.CoreFlat.ImageCopy(
      image,
    ),
  );

  /// Create an image from another image piece
  ImageD ImageFromImage(
    ImageD image,
    RectangleD rec,
  ) => run(
    () => _debugLabels.ImageFromImage(image, rec),
    () => rl.CoreFlat.ImageFromImage(
      image,
      rec,
    ),
  );

  /// Create an image from a selected channel of another image (GRAYSCALE)
  ImageD ImageFromChannel(
    ImageD image,
    num selectedChannel,
  ) => run(
    () => _debugLabels.ImageFromChannel(image, selectedChannel),
    () => rl.CoreFlat.ImageFromChannel(
      image,
      selectedChannel.toInt(),
    ),
  );

  /// Create an image from text (default font)
  ImageD ImageText(
    String text,
    num fontSize,
    ColorD color,
  ) => run(
    () => _debugLabels.ImageText(text, fontSize, color),
    () => rl.CoreFlat.ImageText(
      rl.Temp.String$.ValueOrNull(text),
      fontSize.toInt(),
      color,
    ),
  );

  /// Create an image from text (custom sprite font)
  ImageD ImageTextEx(
    FontD font,
    String text,
    num fontSize,
    num spacing,
    ColorD tint,
  ) => run(
    () => _debugLabels.ImageTextEx(font, text, fontSize, spacing, tint),
    () => rl.CoreFlat.ImageTextEx(
      font,
      rl.Temp.String$.ValueOrNull(text),
      fontSize.toDouble(),
      spacing.toDouble(),
      tint,
    ),
  );

  /// Convert image data to desired format
  void ImageFormat(
    ImageD image,
    PixelFormat newFormat,
  ) => run(
    () => _debugLabels.ImageFormat(image, newFormat),
    () => rl.CoreFlat.ImageFormat(
      rl.Temp.Image$.Ref1(image),
      newFormat.value,
    ),
  );
    
  /// Convert image to POT (power-of-two)
  void ImageToPOT(
    ImageD image,
    ColorD fill,
  ) => run(
    () => _debugLabels.ImageToPOT(image, fill),
    () => rl.CoreFlat.ImageToPOT(
      rl.Temp.Image$.Ref1(image),
      fill,
    ),
  );

  /// Crop an image to a defined rectangle
  void ImageCrop(
    ImageD image,
    RectangleD crop,
  ) => run(
    () => _debugLabels.ImageCrop(image, crop),
    () => rl.CoreFlat.ImageCrop(
      rl.Temp.Image$.Ref1(image),
      crop,
    ),
  );

  /// Crop image depending on alpha value
  void ImageAlphaCrop(
    ImageD image,
    num threshold,
  ) => run(
    () => _debugLabels.ImageAlphaCrop(image, threshold),
    () => rl.CoreFlat.ImageAlphaCrop(
      rl.Temp.Image$.Ref1(image),
      threshold.toDouble(),
    ),
  );

  /// Clear alpha channel to desired color
  void ImageAlphaClear(
    ImageD image,
    ColorD color,
    num threshold,
  ) => run(
    () => _debugLabels.ImageAlphaClear(image, color, threshold),
    () => rl.CoreFlat.ImageAlphaClear(
      rl.Temp.Image$.Ref1(image),
      color,
      threshold.toDouble(),
    ),
  );

  /// Apply alpha mask to image
  void ImageAlphaMask(
    ImageD image,
    ImageD alphaMask,
  ) => run(
    () => _debugLabels.ImageAlphaMask(image, alphaMask),
    () => rl.CoreFlat.ImageAlphaMask(
      rl.Temp.Image$.Ref1(image),
      alphaMask,
    ),
  );

  /// Premultiply alpha channel
  void ImageAlphaPremultiply(
    ImageD image,
  ) => run(
    () => _debugLabels.ImageAlphaPremultiply(image),
    () => rl.CoreFlat.ImageAlphaPremultiply(
      rl.Temp.Image$.Ref1(image),
    ),
  );

  /// Apply Gaussian blur using a box blur approximation
  void ImageBlurGaussian(
    ImageD image,
    num blurSize,
  ) => run(
    () => _debugLabels.ImageBlurGaussian(image, blurSize),
    () => rl.CoreFlat.ImageBlurGaussian(
      rl.Temp.Image$.Ref1(image),
      blurSize.toInt(),
    ),
  );

  /// Apply custom square convolution kernel to image
  void ImageKernelConvolution(
    ImageD image,
    List<double> kernel,
  ) => run(
    () => _debugLabels.ImageKernelConvolution(image, kernel),
    () => rl.CoreFlat.ImageKernelConvolution(
      rl.Temp.Image$.Ref1(image),
      rl.Temp.Float32$.Array(kernel),
      kernel.length,
    ),
  );

  /// Resize image (Bicubic scaling algorithm)
  void ImageResize(
    ImageD image,
    num newWidth,
    num newHeight,
  ) => run(
    () => _debugLabels.ImageResize(image, newWidth, newHeight),
    () => rl.CoreFlat.ImageResize(
      rl.Temp.Image$.Ref1(image),
      newWidth.toInt(),
      newHeight.toInt(),
    ),
  );

  /// Resize image (Nearest-Neighbor scaling algorithm)
  void ImageResizeNN(
    ImageD image,
    num newWidth,
    num newHeight,
  ) => run(
    () => _debugLabels.ImageResizeNN(image, newWidth, newHeight),
    () => rl.CoreFlat.ImageResizeNN(
      rl.Temp.Image$.Ref1(image),
      newWidth.toInt(),
      newHeight.toInt(),
    ),
  );
    
  /// Resize canvas and fill with color
  void ImageResizeCanvas(
    ImageD image,
    num newWidth,
    num newHeight,
    num offsetX,
    num offsetY,
    ColorD fill,
  ) => run(
    () => _debugLabels.ImageResizeCanvas(image, newWidth, newHeight, offsetX, offsetY, fill),
    () => rl.CoreFlat.ImageResizeCanvas(
      rl.Temp.Image$.Ref1(image),
      newWidth.toInt(),
      newHeight.toInt(),
      offsetX.toInt(),
      offsetY.toInt(),
      fill,
    ),
  );

  /// Compute all mipmap levels for a provided image
  void ImageMipmaps(
    ImageD image,
  ) => run(
    () => _debugLabels.ImageMipmaps(image),
    () => rl.CoreFlat.ImageMipmaps(
      rl.Temp.Image$.Ref1(image),
    ),
  );

  /// Dither image data to 16bpp or lower (Floyd-Steinberg dithering)
  void ImageDither(
    ImageD image,
    num rBpp,
    num gBpp,
    num bBpp,
    num aBpp,
  ) => run(
    () => _debugLabels.ImageDither(image, rBpp, gBpp, bBpp, aBpp),
    () => rl.CoreFlat.ImageDither(
      rl.Temp.Image$.Ref1(image),
      rBpp.toInt(),
      gBpp.toInt(),
      bBpp.toInt(),
      aBpp.toInt(),
    ),
  );

  /// Flip image vertically
  void ImageFlipVertical(
    ImageD image,
  ) => run(
    () => _debugLabels.ImageFlipVertical(image),
    () => rl.CoreFlat.ImageFlipVertical(
      rl.Temp.Image$.Ref1(image),
    ),
  );

  /// Flip image horizontally
  void ImageFlipHorizontal(
    ImageD image,
  ) => run(
    () => _debugLabels.ImageFlipHorizontal(image),
    () => rl.CoreFlat.ImageFlipHorizontal(
      rl.Temp.Image$.Ref1(image),
    ),
  );

  /// Rotate image by input angle in degrees (-359 to 359)
  void ImageRotate(
    ImageD image,
    num degrees,
  ) => run(
    () => _debugLabels.ImageRotate(image, degrees),
    () => rl.CoreFlat.ImageRotate(
      rl.Temp.Image$.Ref1(image),
      degrees.toInt(),
    ),
  );

  /// Rotate image clockwise 90deg
  void ImageRotateCW(
    ImageD image,
  ) => run(
    () => _debugLabels.ImageRotateCW(image),
    () => rl.CoreFlat.ImageRotateCW(
      rl.Temp.Image$.Ref1(image),
    ),
  );

  /// Rotate image counter-clockwise 90deg
  void ImageRotateCCW(
    ImageD image,
  ) => run(
    () => _debugLabels.ImageRotateCCW(image),
    () => rl.CoreFlat.ImageRotateCCW(
      rl.Temp.Image$.Ref1(image),
    ),
  );
    
  /// Modify image color: tint
  void ImageColorTint(
    ImageD image,
    ColorD color,
  ) => run(
    () => _debugLabels.ImageColorTint(image, color),
    () => rl.CoreFlat.ImageColorTint(
      rl.Temp.Image$.Ref1(image),
      color,
    ),
  );

  /// Modify image color: invert
  void ImageColorInvert(
    ImageD image,
  ) => run(
    () => _debugLabels.ImageColorInvert(image),
    () => rl.CoreFlat.ImageColorInvert(
      rl.Temp.Image$.Ref1(image),
    ),
  );

  /// Modify image color: grayscale
  void ImageColorGrayscale(
    ImageD image,
  ) => run(
    () => _debugLabels.ImageColorGrayscale(image),
    () => rl.CoreFlat.ImageColorGrayscale(
      rl.Temp.Image$.Ref1(image),
    ),
  );

  /// Modify image color: contrast (-100 to 100)
  void ImageColorContrast(
    ImageD image,
    num contrast,
  ) => run(
    () => _debugLabels.ImageColorContrast(image, contrast),
    () => rl.CoreFlat.ImageColorContrast(
      rl.Temp.Image$.Ref1(image),
      contrast.toDouble(),
    ),
  );

  /// Modify image color: brightness (-255 to 255)
  void ImageColorBrightness(
    ImageD image,
    num brightness,
  ) => run(
    () => _debugLabels.ImageColorBrightness(image, brightness),
    () => rl.CoreFlat.ImageColorBrightness(
      rl.Temp.Image$.Ref1(image),
      brightness.toInt(),
    ),
  );

  /// Modify image color: replace color
  void ImageColorReplace(
    ImageD image,
    ColorD color,
    ColorD replace,
  ) => run(
    () => _debugLabels.ImageColorReplace(image, color, replace),
    () => rl.CoreFlat.ImageColorReplace(
      rl.Temp.Image$.Ref1(image),
      color,
      replace,
    ),
  );

  /// Load color data from image as a Color array (RGBA - 32bit)
  List<ColorD> LoadImageColors(
    ImageD image,
  ) => run(
    () => _debugLabels.LoadImageColors(image),
    () {
      final colors = rl.CoreFlat.LoadImageColors(
        image,
      );
      try {
        return colors.readArray(image.width * image.height);
      } finally {
        rl.CoreFlat.UnloadImageColors(colors);
      }
    },
  );
    
  /// Load colors palette from image as a Color array (RGBA - 32bit)
  List<ColorD> LoadImagePalette(
    ImageD image,
    num maxPaletteSize,
  ) => run(
    () => _debugLabels.LoadImagePalette(image, maxPaletteSize),
    () {
      final colorCount = rl.Temp.Int$.Ref1();
      final colors = rl.CoreFlat.LoadImagePalette(
        image,
        maxPaletteSize.toInt(),
        colorCount,
      );
      try {
        return colors.readArray(colorCount.value);
      } finally {
        rl.CoreFlat.UnloadImagePalette(colors);
      }
    },
  );

  /// Get image alpha border rectangle
  RectangleD GetImageAlphaBorder(
    ImageD image,
    num threshold,
  ) => run(
    () => _debugLabels.GetImageAlphaBorder(image, threshold),
    () => rl.CoreFlat.GetImageAlphaBorder(
      image,
      threshold.toDouble(),
    ),
  );

  /// Get image pixel color at (x, y) position
  ColorD GetImageColor(
    ImageD image,
    num x,
    num y,
  ) => run(
    () => _debugLabels.GetImageColor(image, x, y),
    () => rl.CoreFlat.GetImageColor(
      image,
      x.toInt(),
      y.toInt(),
    ),
  );

  /// Clear image background with given color
  void ImageClearBackground(
    ImageD dst,
    ColorD color,
  ) => run(
    () => _debugLabels.ImageClearBackground(dst, color),
    () => rl.CoreFlat.ImageClearBackground(
      rl.Temp.Image$.Ref1(dst),
      color,
    ),
  );

  /// Draw pixel within an image
  void ImageDrawPixel(
    ImageD dst,
    num posX,
    num posY,
    ColorD color,
  ) => run(
    () => _debugLabels.ImageDrawPixel(dst, posX, posY, color),
    () => rl.CoreFlat.ImageDrawPixel(
      rl.Temp.Image$.Ref1(dst),
      posX.toInt(),
      posY.toInt(),
      color,
    ),
  );

  /// Draw pixel within an image (Vector version)
  void ImageDrawPixelV(
    ImageD dst,
    Vector2D position,
    ColorD color,
  ) => run(
    () => _debugLabels.ImageDrawPixelV(dst, position, color),
    () => rl.CoreFlat.ImageDrawPixelV(
      rl.Temp.Image$.Ref1(dst),
      position,
      color,
    ),
  );
    
  /// Draw line within an image
  void ImageDrawLine(
    ImageD dst,
    num startPosX,
    num startPosY,
    num endPosX,
    num endPosY,
    ColorD color,
  ) => run(
    () => _debugLabels.ImageDrawLine(dst, startPosX, startPosY, endPosX, endPosY, color),
    () => rl.CoreFlat.ImageDrawLine(
      rl.Temp.Image$.Ref1(dst),
      startPosX.toInt(),
      startPosY.toInt(),
      endPosX.toInt(),
      endPosY.toInt(),
      color,
    ),
  );

  /// Draw line within an image (Vector version)
  void ImageDrawLineV(
    ImageD dst,
    Vector2D start,
    Vector2D end,
    ColorD color,
  ) => run(
    () => _debugLabels.ImageDrawLineV(dst, start, end, color),
    () => rl.CoreFlat.ImageDrawLineV(
      rl.Temp.Image$.Ref1(dst),
      start,
      end,
      color,
    ),
  );

  /// Draw a line defining thickness within an image
  void ImageDrawLineEx(
    ImageD dst,
    Vector2D start,
    Vector2D end,
    num thick,
    ColorD color,
  ) => run(
    () => _debugLabels.ImageDrawLineEx(dst, start, end, thick, color),
    () => rl.CoreFlat.ImageDrawLineEx(
      rl.Temp.Image$.Ref1(dst),
      start,
      end,
      thick.toInt(),
      color,
    ),
  );

  /// Draw a filled circle within an image
  void ImageDrawCircle(
    ImageD dst,
    num centerX,
    num centerY,
    num radius,
    ColorD color,
  ) => run(
    () => _debugLabels.ImageDrawCircle(dst, centerX, centerY, radius, color),
    () => rl.CoreFlat.ImageDrawCircle(
      rl.Temp.Image$.Ref1(dst),
      centerX.toInt(),
      centerY.toInt(),
      radius.toInt(),
      color,
    ),
  );

  /// Draw a filled circle within an image (Vector version)
  void ImageDrawCircleV(
    ImageD dst,
    Vector2D center,
    num radius,
    ColorD color,
  ) => run(
    () => _debugLabels.ImageDrawCircleV(dst, center, radius, color),
    () => rl.CoreFlat.ImageDrawCircleV(
      rl.Temp.Image$.Ref1(dst),
      center,
      radius.toInt(),
      color,
    ),
  );

  /// Draw circle outline within an image
  void ImageDrawCircleLines(
    ImageD dst,
    num centerX,
    num centerY,
    num radius,
    ColorD color,
  ) => run(
    () => _debugLabels.ImageDrawCircleLines(dst, centerX, centerY, radius, color),
    () => rl.CoreFlat.ImageDrawCircleLines(
      rl.Temp.Image$.Ref1(dst),
      centerX.toInt(),
      centerY.toInt(),
      radius.toInt(),
      color,
    ),
  );

  /// Draw circle outline within an image (Vector version)
  void ImageDrawCircleLinesV(
    ImageD dst,
    Vector2D center,
    num radius,
    ColorD color,
  ) => run(
    () => _debugLabels.ImageDrawCircleLinesV(dst, center, radius, color),
    () => rl.CoreFlat.ImageDrawCircleLinesV(
      rl.Temp.Image$.Ref1(dst),
      center,
      radius.toInt(),
      color,
    ),
  );

  /// Draw rectangle within an image
  void ImageDrawRectangle(
    ImageD dst,
    num posX,
    num posY,
    num width,
    num height,
    ColorD color,
  ) => run(
    () => _debugLabels.ImageDrawRectangle(dst, posX, posY, width, height, color),
    () => rl.CoreFlat.ImageDrawRectangle(
      rl.Temp.Image$.Ref1(dst),
      posX.toInt(),
      posY.toInt(),
      width.toInt(),
      height.toInt(),
      color,
    ),
  );
    
  /// Draw rectangle within an image (Vector version)
  void ImageDrawRectangleV(
    ImageD dst,
    Vector2D position,
    Vector2D size,
    ColorD color,
  ) => run(
    () => _debugLabels.ImageDrawRectangleV(dst, position, size, color),
    () => rl.CoreFlat.ImageDrawRectangleV(
      rl.Temp.Image$.Ref1(dst),
      position,
      size,
      color,
    ),
  );

  /// Draw rectangle within an image
  void ImageDrawRectangleRec(
    ImageD dst,
    RectangleD rec,
    ColorD color,
  ) => run(
    () => _debugLabels.ImageDrawRectangleRec(dst, rec, color),
    () => rl.CoreFlat.ImageDrawRectangleRec(
      rl.Temp.Image$.Ref1(dst),
      rec,
      color,
    ),
  );

  /// Draw rectangle lines within an image
  void ImageDrawRectangleLines(
    ImageD dst,
    RectangleD rec,
    num thick,
    ColorD color,
  ) => run(
    () => _debugLabels.ImageDrawRectangleLines(dst, rec, thick, color),
    () => rl.CoreFlat.ImageDrawRectangleLines(
      rl.Temp.Image$.Ref1(dst),
      rec,
      thick.toInt(),
      color,
    ),
  );

  /// Draw triangle within an image
  void ImageDrawTriangle(
    ImageD dst,
    Vector2D v1,
    Vector2D v2,
    Vector2D v3,
    ColorD color,
  ) => run(
    () => _debugLabels.ImageDrawTriangle(dst, v1, v2, v3, color),
    () => rl.CoreFlat.ImageDrawTriangle(
      rl.Temp.Image$.Ref1(dst),
      v1,
      v2,
      v3,
      color,
    ),
  );

  /// Draw triangle with interpolated colors within an image
  void ImageDrawTriangleEx(
    ImageD dst,
    Vector2D v1,
    Vector2D v2,
    Vector2D v3,
    ColorD c1,
    ColorD c2,
    ColorD c3,
  ) => run(
    () => _debugLabels.ImageDrawTriangleEx(dst, v1, v2, v3, c1, c2, c3),
    () => rl.CoreFlat.ImageDrawTriangleEx(
      rl.Temp.Image$.Ref1(dst),
      v1,
      v2,
      v3,
      c1,
      c2,
      c3,
    ),
  );

  /// Draw triangle outline within an image
  void ImageDrawTriangleLines(
    ImageD dst,
    Vector2D v1,
    Vector2D v2,
    Vector2D v3,
    ColorD color,
  ) => run(
    () => _debugLabels.ImageDrawTriangleLines(dst, v1, v2, v3, color),
    () => rl.CoreFlat.ImageDrawTriangleLines(
      rl.Temp.Image$.Ref1(dst),
      v1,
      v2,
      v3,
      color,
    ),
  );
    
  /// Draw a triangle fan defined by points within an image (first vertex is the center)
  void ImageDrawTriangleFan(
    ImageD dst,
    List<Vector2D> points,
    ColorD color,
  ) => run(
    () => _debugLabels.ImageDrawTriangleFan(dst, points, color),
    () => rl.CoreFlat.ImageDrawTriangleFan(
      rl.Temp.Image$.Ref1(dst),
      rl.Temp.Vector2$.ArrayStruct(points),
      points.length,
      color,
    ),
  );

  /// Draw a triangle strip defined by points within an image
  void ImageDrawTriangleStrip(
    ImageD dst,
    List<Vector2D> points,
    ColorD color,
  ) => run(
    () => _debugLabels.ImageDrawTriangleStrip(dst, points, color),
    () => rl.CoreFlat.ImageDrawTriangleStrip(
      rl.Temp.Image$.Ref1(dst),
      rl.Temp.Vector2$.ArrayStruct(points),
      points.length,
      color,
    ),
  );

  /// Draw a source image within a destination image (tint applied to source)
  void ImageDraw(
    ImageD dst,
    ImageD src,
    RectangleD srcRec,
    RectangleD dstRec,
    ColorD tint,
  ) => run(
    () => _debugLabels.ImageDraw(dst, src, srcRec, dstRec, tint),
    () => rl.CoreFlat.ImageDraw(
      rl.Temp.Image$.Ref1(dst),
      src,
      srcRec,
      dstRec,
      tint,
    ),
  );

  /// Draw text (using default font) within an image (destination)
  void ImageDrawText(
    ImageD dst,
    String text,
    num posX,
    num posY,
    num fontSize,
    ColorD color,
  ) => run(
    () => _debugLabels.ImageDrawText(dst, text, posX, posY, fontSize, color),
    () => rl.CoreFlat.ImageDrawText(
      rl.Temp.Image$.Ref1(dst),
      rl.Temp.String$.ValueOrNull(text),
      posX.toInt(),
      posY.toInt(),
      fontSize.toInt(),
      color,
    ),
  );

  /// Draw text (custom sprite font) within an image (destination)
  void ImageDrawTextEx(
    ImageD dst,
    FontD font,
    String text,
    Vector2D position,
    num fontSize,
    num spacing,
    ColorD tint,
  ) => run(
    () => _debugLabels.ImageDrawTextEx(dst, font, text, position, fontSize, spacing, tint),
    () => rl.CoreFlat.ImageDrawTextEx(
      rl.Temp.Image$.Ref1(dst),
      font,
      rl.Temp.String$.ValueOrNull(text),
      position,
      fontSize.toDouble(),
      spacing.toDouble(),
      tint,
    ),
  );

  /// Load texture from file into GPU memory (VRAM)
  TextureD LoadTexture(
    String fileName,
  ) => run(
    () => _debugLabels.LoadTexture(fileName),
    () => rl.CoreFlat.LoadTexture(
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );

  /// Load texture from image data
  TextureD LoadTextureFromImage(
    ImageD image,
  ) => run(
    () => _debugLabels.LoadTextureFromImage(image),
    () => rl.CoreFlat.LoadTextureFromImage(
      image,
    ),
  );

  /// Load cubemap from image, multiple image cubemap layouts supported
  TextureD LoadTextureCubemap(
    ImageD image,
    CubemapLayout layout,
  ) => run(
    () => _debugLabels.LoadTextureCubemap(image, layout),
    () => rl.CoreFlat.LoadTextureCubemap(
      image,
      layout.value,
    ),
  );

  /// Load texture for rendering (framebuffer)
  RenderTextureD LoadRenderTexture(
    num width,
    num height,
  ) => run(
    () => _debugLabels.LoadRenderTexture(width, height),
    () => rl.CoreFlat.LoadRenderTexture(
      width.toInt(),
      height.toInt(),
    ),
  );

  /// Check if a texture is valid (loaded in GPU)
  bool IsTextureValid(
    TextureD texture,
  ) => run(
    () => _debugLabels.IsTextureValid(texture),
    () => rl.CoreFlat.IsTextureValid(
      texture,
    ),
  );

  /// Unload texture from GPU memory (VRAM)
  void UnloadTexture(
    TextureD texture,
  ) => run(
    () => _debugLabels.UnloadTexture(texture),
    () {
      rl.CoreFlat.UnloadTexture(
        texture,
      );
      texture.structMarkDisposed();
    },
  );

  /// Check if a render texture is valid (loaded in GPU)
  bool IsRenderTextureValid(
    RenderTextureD target,
  ) => run(
    () => _debugLabels.IsRenderTextureValid(target),
    () => rl.CoreFlat.IsRenderTextureValid(
      target,
    ),
  );

  /// Unload render texture from GPU memory (VRAM)
  void UnloadRenderTexture(
    RenderTextureD target,
  ) => run(
    () => _debugLabels.UnloadRenderTexture(target),
    () => rl.CoreFlat.UnloadRenderTexture(
      target,
    ),
  );

  /// Update GPU texture with new data
  void UpdateTexture(
    TextureD texture,
    Uint8List pixels,
  ) => run(
    () => _debugLabels.UpdateTexture(texture, pixels),
    () => rl.CoreFlat.UpdateTexture(
      texture,
      rl.Temp.Uint8$.Array(pixels).cast(),
    ),
  );
    
  /// Update GPU texture rectangle with new data
  void UpdateTextureRec(
    TextureD texture,
    RectangleD rec,
    Uint8List pixels,
  ) => run(
    () => _debugLabels.UpdateTextureRec(texture, rec, pixels),
    () => rl.CoreFlat.UpdateTextureRec(
      texture,
      rec,
      rl.Temp.Uint8$.Array(pixels).cast(),
    ),
  );

  /// Generate GPU mipmaps for a texture
  void GenTextureMipmaps(
    TextureD texture,
  ) => run(
    () => _debugLabels.GenTextureMipmaps(texture),
    () => rl.CoreFlat.GenTextureMipmaps(
      rl.Temp.Texture$.Ref1(texture),
    ),
  );

  /// Set texture scaling filter mode
  void SetTextureFilter(
    TextureD texture,
    TextureFilter filter,
  ) => run(
    () => _debugLabels.SetTextureFilter(texture, filter),
    () => rl.CoreFlat.SetTextureFilter(
      texture,
      filter.value,
    ),
  );

  /// Set texture wrapping mode
  void SetTextureWrap(
    TextureD texture,
    TextureWrap wrap,
  ) => run(
    () => _debugLabels.SetTextureWrap(texture, wrap),
    () => rl.CoreFlat.SetTextureWrap(
      texture,
      wrap.value,
    ),
  );

  /// Draw a Texture2D
  void DrawTexture(
    TextureD texture,
    num posX,
    num posY,
    ColorD tint,
  ) => run(
    () => _debugLabels.DrawTexture(texture, posX, posY, tint),
    () => rl.CoreFlat.DrawTexture(
      texture,
      posX.toInt(),
      posY.toInt(),
      tint,
    ),
  );

  /// Draw a Texture2D with position defined as Vector2
  void DrawTextureV(
    TextureD texture,
    Vector2D position,
    ColorD tint,
  ) => run(
    () => _debugLabels.DrawTextureV(texture, position, tint),
    () => rl.CoreFlat.DrawTextureV(
      texture,
      position,
      tint,
    ),
  );
    
  /// Draw a Texture2D with extended parameters
  void DrawTextureEx(
    TextureD texture,
    Vector2D position,
    num rotation,
    num scale,
    ColorD tint,
  ) => run(
    () => _debugLabels.DrawTextureEx(texture, position, rotation, scale, tint),
    () => rl.CoreFlat.DrawTextureEx(
      texture,
      position,
      rotation.toDouble(),
      scale.toDouble(),
      tint,
    ),
  );

  /// Draw a part of a texture defined by a rectangle
  void DrawTextureRec(
    TextureD texture,
    RectangleD source,
    Vector2D position,
    ColorD tint,
  ) => run(
    () => _debugLabels.DrawTextureRec(texture, source, position, tint),
    () => rl.CoreFlat.DrawTextureRec(
      texture,
      source,
      position,
      tint,
    ),
  );

  /// Draw a part of a texture defined by a rectangle with 'pro' parameters
  void DrawTexturePro(
    TextureD texture,
    RectangleD source,
    RectangleD dest,
    Vector2D origin,
    num rotation,
    ColorD tint,
  ) => run(
    () => _debugLabels.DrawTexturePro(texture, source, dest, origin, rotation, tint),
    () => rl.CoreFlat.DrawTexturePro(
      texture,
      source,
      dest,
      origin,
      rotation.toDouble(),
      tint,
    ),
  );

  /// Draws a texture (or part of it) that stretches or shrinks nicely
  void DrawTextureNPatch(
    TextureD texture,
    NPatchInfoD nPatchInfo,
    RectangleD dest,
    Vector2D origin,
    num rotation,
    ColorD tint,
  ) => run(
    () => _debugLabels.DrawTextureNPatch(texture, nPatchInfo, dest, origin, rotation, tint),
    () => rl.CoreFlat.DrawTextureNPatch(
      texture,
      nPatchInfo,
      dest,
      origin,
      rotation.toDouble(),
      tint,
    ),
  );

  /// Check if two colors are equal
  bool ColorIsEqual(
    ColorD col1,
    ColorD col2,
  ) => run(
    () => _debugLabels.ColorIsEqual(col1, col2),
    () => rl.CoreFlat.ColorIsEqual(
      col1,
      col2,
    ),
  );

  /// Get color with alpha applied, alpha goes from 0.0 to 1.0
  ColorD Fade(
    ColorD color,
    num alpha,
  ) => run(
    () => _debugLabels.Fade(color, alpha),
    () => rl.CoreFlat.Fade(
      color,
      alpha.toDouble(),
    ),
  );

  /// Get hexadecimal value for a Color (0xRRGGBBAA)
  int ColorToInt(
    ColorD color,
  ) => run(
    () => _debugLabels.ColorToInt(color),
    () => rl.CoreFlat.ColorToInt(
      color,
    ),
  );

  /// Get Color normalized as float [0..1]
  Vector4D ColorNormalize(
    ColorD color,
  ) => run(
    () => _debugLabels.ColorNormalize(color),
    () => rl.CoreFlat.ColorNormalize(
      color,
    ),
  );

  /// Get Color from normalized values [0..1]
  ColorD ColorFromNormalized(
    Vector4D normalized,
  ) => run(
    () => _debugLabels.ColorFromNormalized(normalized),
    () => rl.CoreFlat.ColorFromNormalized(
      normalized,
    ),
  );

  /// Get HSV values for a Color, hue [0..360], saturation/value [0..1]
  Vector3D ColorToHSV(
    ColorD color,
  ) => run(
    () => _debugLabels.ColorToHSV(color),
    () => rl.CoreFlat.ColorToHSV(
      color,
    ),
  );

  /// Get a Color from HSV values, hue [0..360], saturation/value [0..1]
  ColorD ColorFromHSV(
    num hue,
    num saturation,
    num value,
  ) => run(
    () => _debugLabels.ColorFromHSV(hue, saturation, value),
    () => rl.CoreFlat.ColorFromHSV(
      hue.toDouble(),
      saturation.toDouble(),
      value.toDouble(),
    ),
  );

  /// Get color multiplied with another color
  ColorD ColorTint(
    ColorD color,
    ColorD tint,
  ) => run(
    () => _debugLabels.ColorTint(color, tint),
    () => rl.CoreFlat.ColorTint(
      color,
      tint,
    ),
  );

  /// Get color with brightness correction, brightness factor goes from -1.0 to 1.0
  ColorD ColorBrightness(
    ColorD color,
    num factor,
  ) => run(
    () => _debugLabels.ColorBrightness(color, factor),
    () => rl.CoreFlat.ColorBrightness(
      color,
      factor.toDouble(),
    ),
  );

  /// Get color with contrast correction, contrast values between -1.0 and 1.0
  ColorD ColorContrast(
    ColorD color,
    num contrast,
  ) => run(
    () => _debugLabels.ColorContrast(color, contrast),
    () => rl.CoreFlat.ColorContrast(
      color,
      contrast.toDouble(),
    ),
  );

  /// Get color with alpha applied, alpha goes from 0.0 to 1.0
  ColorD ColorAlpha(
    ColorD color,
    num alpha,
  ) => run(
    () => _debugLabels.ColorAlpha(color, alpha),
    () => rl.CoreFlat.ColorAlpha(
      color,
      alpha.toDouble(),
    ),
  );

  /// Get src alpha-blended into dst color with tint
  ColorD ColorAlphaBlend(
    ColorD dst,
    ColorD src,
    ColorD tint,
  ) => run(
    () => _debugLabels.ColorAlphaBlend(dst, src, tint),
    () => rl.CoreFlat.ColorAlphaBlend(
      dst,
      src,
      tint,
    ),
  );

  /// Get color lerp interpolation between two colors, factor [0.0..1.0]
  ColorD ColorLerp(
    ColorD color1,
    ColorD color2,
    num factor,
  ) => run(
    () => _debugLabels.ColorLerp(color1, color2, factor),
    () => rl.CoreFlat.ColorLerp(
      color1,
      color2,
      factor.toDouble(),
    ),
  );

  /// Get Color structure from hexadecimal value
  ColorD GetColor(
    num hexValue,
  ) => run(
    () => _debugLabels.GetColor(hexValue),
    () => rl.CoreFlat.GetColor(
      hexValue.toInt(),
    ),
  );

  /// Get pixel data size in bytes for certain format
  int GetPixelDataSize(
    num width,
    num height,
    PixelFormat format,
  ) => run(
    () => _debugLabels.GetPixelDataSize(width, height, format),
    () => rl.CoreFlat.GetPixelDataSize(
      width.toInt(),
      height.toInt(),
      format.value,
    ),
  );

  /// Get the default Font
  FontD GetFontDefault() => run(
    () => _debugLabels.GetFontDefault(),
    () => rl.CoreFlat.GetFontDefault(),
  );

  /// Load font from file into GPU memory (VRAM)
  FontD LoadFont(
    String fileName,
  ) => run(
    () => _debugLabels.LoadFont(fileName),
    () => rl.CoreFlat.LoadFont(
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );
    
  /// Load font from file with extended parameters, use NULL for codepoints and 0 for codepointCount to load the default character set, font size is provided in pixels height
  FontD LoadFontEx(
    String fileName,
    num fontSize, [
      Int32List? codepoints,
      num? codepointCount,
    ]
  ) => run(
    () => _debugLabels.LoadFontEx(fileName, fontSize, codepoints),
    () => rl.CoreFlat.LoadFontEx(
      rl.Temp.String$.ValueOrNull(fileName),
      fontSize.toInt(),
      codepoints == null ? MemoryPointer.nullptr() : rl.Temp.Int$.Array(codepoints).cast(),
      codepointCount?.toInt() ?? codepoints?.length ?? 0,
    ),
  );

  /// Load font from Image (XNA style)
  FontD LoadFontFromImage(
    ImageD image,
    ColorD key,
    num firstChar,
  ) => run(
    () => _debugLabels.LoadFontFromImage(image, key, firstChar),
    () => rl.CoreFlat.LoadFontFromImage(
      image,
      key,
      firstChar.toInt(),
    ),
  );

  /// Load font from memory buffer, fileType refers to extension: i.e. '.ttf'
  FontD LoadFontFromMemory(
    String fileType,
    Uint8List fileData,
    num fontSize,
    Int32List codepoints,
  ) => run(
    () => _debugLabels.LoadFontFromMemory(fileType, fileData, fontSize, codepoints),
    () => rl.CoreFlat.LoadFontFromMemory(
      rl.Temp.String$.ValueOrNull(fileType),
      rl.Temp.Uint8$.Array(fileData),
      fileData.length,
      fontSize.toInt(),
      rl.Temp.Int$.Array(codepoints),
      codepoints.length,
    ),
  );

  /// Check if a font is valid (font data loaded, WARNING: GPU texture not checked)
  bool IsFontValid(
    FontD font,
  ) => run(
    () => _debugLabels.IsFontValid(font),
    () => rl.CoreFlat.IsFontValid(
      font,
    ),
  );

  /// Load font data for further use
  List<GlyphInfoD> LoadFontData(
    Uint8List fileData,
    num fontSize,
    Int32List? codepoints,
    num? codepointCount,
    FontType type,
  ) => run(
    () => _debugLabels.LoadFontData(fileData, fontSize, codepoints, codepointCount, type),
    () {
      final glyphCount = rl.Temp.Int$.Ref1();
      final glyphs = rl.CoreFlat.LoadFontData(
        rl.Temp.UnsignedChar$.Array(fileData),
        fileData.length,
        fontSize.toInt(),
        codepoints == null ? MemoryPointer.nullptr() : rl.Temp.Int$.Array(codepoints).cast(),
        codepointCount?.toInt() ?? codepoints?.length ?? 0,
        type.value,
        glyphCount,
      );
      final requestedCount = (codepointCount == null || codepointCount == 0) 
        ? codepoints?.length ?? glyphCount.value 
        : codepointCount.toInt();
      return glyphs.readArray(requestedCount);
    },
  );

  /// Generate image font atlas using chars info
  (ImageD image, List<RectangleD> glyphRecs) GenImageFontAtlas(
    List<GlyphInfoD> glyphs,
    num fontSize,
    num padding,
    num packMethod,
  ) => run(
    () => _debugLabels.GenImageFontAtlas(glyphs, fontSize, padding, packMethod),
    () {
      final recsPtr = rl.Temp.Rectangle$.$.Raw();

      try {
        final image = rl.CoreFlat.GenImageFontAtlas(
          glyphs.first.getOp(),
          recsPtr,
          glyphs.length,
          fontSize.toInt(),
          padding.toInt(),
          packMethod.toInt(),
        );

        final innerPtr = recsPtr.readPtr();
        final recs = RectangleD.pointer(innerPtr).readArray(glyphs.length);

        return (image, recs);
      } finally {
        recsPtr.free();
      }
    },
  );

  /// Unload font chars info data (RAM)
  void UnloadFontData(
    List<GlyphInfoD> glyphs,
  ) => run(
    () => _debugLabels.UnloadFontData(glyphs),
    () => rl.CoreFlat.UnloadFontData(
      glyphs.first.getOp(),
      glyphs.length,
    ),
  );
    
  /// Unload font from GPU memory (VRAM)
  void UnloadFont(
    FontD font,
  ) => run(
    () => _debugLabels.UnloadFont(font),
    () => rl.CoreFlat.UnloadFont(
      font,
    ),
  );

  /// Export font as code file, returns true on success
  bool ExportFontAsCode(
    FontD font,
    String fileName,
  ) => run(
    () => _debugLabels.ExportFontAsCode(font, fileName),
    () => rl.CoreFlat.ExportFontAsCode(
      font,
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );

  /// Draw current FPS
  void DrawFPS(
    num posX,
    num posY,
  ) => run(
    () => _debugLabels.DrawFPS(posX, posY),
    () => rl.CoreFlat.DrawFPS(
      posX.toInt(),
      posY.toInt(),
    ),
  );

  /// Draw text (using default font)
  void DrawText(
    String text,
    num posX,
    num posY,
    num fontSize,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawText(text, posX, posY, fontSize, color),
    () => rl.CoreFlat.DrawText(
      rl.Temp.String$.ValueOrNull(text),
      posX.toInt(),
      posY.toInt(),
      fontSize.toInt(),
      color,
    ),
  );

  /// Draw text using font and additional parameters
  void DrawTextEx(
    FontD font,
    String text,
    Vector2D position,
    num fontSize,
    num spacing,
    ColorD tint,
  ) => run(
    () => _debugLabels.DrawTextEx(font, text, position, fontSize, spacing, tint),
    () => rl.CoreFlat.DrawTextEx(
      font,
      rl.Temp.String$.ValueOrNull(text),
      position,
      fontSize.toDouble(),
      spacing.toDouble(),
      tint,
    ),
  );

  /// Draw text using Font and pro parameters (rotation)
  void DrawTextPro(
    FontD font,
    String text,
    Vector2D position,
    Vector2D origin,
    num rotation,
    num fontSize,
    num spacing,
    ColorD tint,
  ) => run(
    () => _debugLabels.DrawTextPro(font, text, position, origin, rotation, fontSize, spacing, tint),
    () => rl.CoreFlat.DrawTextPro(
      font,
      rl.Temp.String$.ValueOrNull(text),
      position,
      origin,
      rotation.toDouble(),
      fontSize.toDouble(),
      spacing.toDouble(),
      tint,
    ),
  );
    
  /// Draw one character (codepoint)
  void DrawTextCodepoint(
    FontD font,
    num codepoint,
    Vector2D position,
    num fontSize,
    ColorD tint,
  ) => run(
    () => _debugLabels.DrawTextCodepoint(font, codepoint, position, fontSize, tint),
    () => rl.CoreFlat.DrawTextCodepoint(
      font,
      codepoint.toInt(),
      position,
      fontSize.toDouble(),
      tint,
    ),
  );

  /// Draw multiple character (codepoint)
  void DrawTextCodepoints(
    FontD font,
    Int32List codepoints,
    Vector2D position,
    num fontSize,
    num spacing,
    ColorD tint,
  ) => run(
    () => _debugLabels.DrawTextCodepoints(font, codepoints, position, fontSize, spacing, tint),
    () => rl.CoreFlat.DrawTextCodepoints(
      font,
      rl.Temp.Int$.Array(codepoints),
      codepoints.length,
      position,
      fontSize.toDouble(),
      spacing.toDouble(),
      tint,
    ),
  );

  /// Set vertical line spacing when drawing with line-breaks
  void SetTextLineSpacing(
    num spacing,
  ) => run(
    () => _debugLabels.SetTextLineSpacing(spacing),
    () => rl.CoreFlat.SetTextLineSpacing(
      spacing.toInt(),
    ),
  );

  /// Measure string width for default font
  int MeasureText(
    String text,
    num fontSize,
  ) => run(
    () => _debugLabels.MeasureText(text, fontSize),
    () => rl.CoreFlat.MeasureText(
      rl.Temp.String$.ValueOrNull(text),
      fontSize.toInt(),
    ),
  );
    
  /// Measure string size for Font
  Vector2D MeasureTextEx(
    FontD font,
    String text,
    num fontSize,
    num spacing,
  ) => run(
    () => _debugLabels.MeasureTextEx(font, text, fontSize, spacing),
    () => rl.CoreFlat.MeasureTextEx(
      font,
      rl.Temp.String$.ValueOrNull(text),
      fontSize.toDouble(),
      spacing.toDouble(),
    ),
  );

  /// Measure string size for an existing array of codepoints for Font
  Vector2D MeasureTextCodepoints(
    FontD font,
    Int32List codepoints,
    num fontSize,
    num spacing,
  ) => run(
    () => _debugLabels.MeasureTextCodepoints(font, codepoints, fontSize, spacing),
    () => rl.CoreFlat.MeasureTextCodepoints(
      font,
      rl.Temp.Int$.Array(codepoints),
      codepoints.length,
      fontSize.toDouble(),
      spacing.toDouble(),
    ),
  );

  /// Get glyph index position in font for a codepoint (unicode character), fallback to '?' if not found
  int GetGlyphIndex(
    FontD font,
    num codepoint,
  ) => run(
    () => _debugLabels.GetGlyphIndex(font, codepoint),
    () => rl.CoreFlat.GetGlyphIndex(
      font,
      codepoint.toInt(),
    ),
  );

  /// Get glyph font info data for a codepoint (unicode character), fallback to '?' if not found
  GlyphInfoD GetGlyphInfo(
    FontD font,
    num codepoint,
  ) => run(
    () => _debugLabels.GetGlyphInfo(font, codepoint),
    () => rl.CoreFlat.GetGlyphInfo(
      font,
      codepoint.toInt(),
    ),
  );

  /// Get glyph rectangle in font atlas for a codepoint (unicode character), fallback to '?' if not found
  RectangleD GetGlyphAtlasRec(
    FontD font,
    num codepoint,
  ) => run(
    () => _debugLabels.GetGlyphAtlasRec(font, codepoint),
    () => rl.CoreFlat.GetGlyphAtlasRec(
      font,
      codepoint.toInt(),
    ),
  );
    
  /// Load UTF-8 text encoded from codepoints array
  String LoadUTF8(
    Int32List codepoints,
  ) => run(
    () => _debugLabels.LoadUTF8(codepoints),
    () {
      final utf8 = rl.CoreFlat.LoadUTF8(
        rl.Temp.Int$.Array(codepoints),
        codepoints.length,
      );
      try {
        return utf8.toDartString();
      } finally {
        rl.CoreFlat.UnloadUTF8(utf8);
      }
    },
  );

  /// Load all codepoints from a UTF-8 text string, codepoints count returned by parameter
  Int32List LoadCodepoints(
    String text,
  ) => run(
    () => _debugLabels.LoadCodepoints(text),
    () {
      final count = rl.Temp.Int$.Ref1();
      final result = rl.CoreFlat.LoadCodepoints(
        rl.Temp.String$.ValueOrNull(text),
        count,
      );
      try {
        return .fromList(result.readArray(count.value));
      } finally {
        rl.CoreFlat.UnloadCodepoints(result);
      }
    },
  );

  /// Get total number of codepoints in a UTF-8 encoded string
  int GetCodepointCount(
    String text,
  ) => run(
    () => _debugLabels.GetCodepointCount(text),
    () => rl.CoreFlat.GetCodepointCount(
      rl.Temp.String$.ValueOrNull(text),
    ),
  );

  /// Get next codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure
  (int codepoint, int codepointSize) GetCodepoint(
    String text,
  ) => run(
    () => _debugLabels.GetCodepoint(text),
    () {
      final size = rl.Temp.Int$.Ref1();
      final codepoint = rl.CoreFlat.GetCodepoint(
        rl.Temp.String$.ValueOrNull(text),
        size,
      );
      return (codepoint, size.value);
    },
  );

  /// Get next codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure
  (int codepoint, int codepointSize) GetCodepointNext(
    String text,
  ) => run(
    () => _debugLabels.GetCodepointNext(text),
    () {
      final size = rl.Temp.Int$.Ref1();
      final codepoint = rl.CoreFlat.GetCodepointNext(
        rl.Temp.String$.ValueOrNull(text),
        size,
      );
      return (codepoint, size.value);
    },
  );

  /// Get previous codepoint in a UTF-8 encoded string, 0x3f('?') is returned on failure
  (int codepoint, int codepointSize) GetCodepointPrevious(
    String text,
  ) => run(
    () => _debugLabels.GetCodepointPrevious(text),
    () {
      final size = rl.Temp.Int$.Ref1();
      final codepoint = rl.CoreFlat.GetCodepointPrevious(
        rl.Temp.String$.ValueOrNull(text),
        size,
      );
      return (codepoint, size.value);
    },
  );

  /// Encode one codepoint into UTF-8 byte array (array length returned as parameter)
  (String text, int size) CodepointToUTF8(
    num codepoint,
  ) => run(
    () => _debugLabels.CodepointToUTF8(codepoint),
    () {
      final size = rl.Temp.Int$.Ref1();
      final text = rl.CoreFlat.CodepointToUTF8(
        codepoint.toInt(),
        size,
      );
      return (text.toDartString(), size.value);
    },
  );

  /// Load text as separate lines ('\n')
  List<String> LoadTextLines(
    String text,
  ) => run(
    () => _debugLabels.LoadTextLines(text),
    () {
      final textPtr = rl.Temp.String$.RawValue(text);
      final lineCountPtr = rl.Temp.Int$.Ref1();
      try {
        final linesPtr = rl.CoreFlat.LoadTextLines(
          textPtr,
          lineCountPtr,
        );
        final lines = linesPtr.readStringArray(lineCountPtr.value);
        rl.CoreFlat.UnloadTextLines(linesPtr, lineCountPtr.value);
        return lines;
      } finally {
        textPtr.free();
      }
    },
  );
  
  /// Check if two text string are equal
  /// 
  /// **NOT** calling original Raylib function.
  bool TextIsEqual(
    String text1,
    String text2,
  ) => run(
    () => _debugLabels.TextIsEqual(text1, text2),
    () => text1 == text2,
  );

  /// Get text length
  /// 
  /// **NOT** calling original Raylib function.
  int TextLength(
    String text,
  ) => run(
    () => _debugLabels.TextLength(text),
    () => text.length,
  );

  /// Text formatting with variables (sprintf() style)
  /// 
  /// **NOT** calling original Raylib function.
  String TextFormat(
    String text, [
      List<Object?> args = const [],
    ]
  ) => run(
    () => _debugLabels.TextFormat(text, args),
    () => rl.Utils.Format(text, args),
  );

  /// Get a piece of a text string
  /// 
  /// **NOT** calling original Raylib function.
  String TextSubtext(
    String text,
    int position,
    int length,
  ) => run(
    () => _debugLabels.TextSubtext(text, position, length),
    () {
      if (position < 0 || position >= text.length) return '';
      final end = (position + length).clamp(position, text.length);
      return text.substring(position, end);
    },
  );

  /// Remove text spaces, concat words
  /// 
  /// **NOT** calling original Raylib function.
  String TextRemoveSpaces(
    String text,
  ) => run(
    () => _debugLabels.TextRemoveSpaces(text),
    () => text.replaceAll(' ', ''),
  );

  /// Get text between two strings
  /// 
  /// **NOT** calling original Raylib function.
  String GetTextBetween(
    String text,
    String begin,
    String end,
  ) => run(
    () => _debugLabels.GetTextBetween(text, begin, end),
    () {
      final startIdx = text.indexOf(begin);
      if (startIdx == -1) return '';
      final contentStart = startIdx + begin.length;
      final endIdx = text.indexOf(end, contentStart);
      if (endIdx == -1) return '';
      return text.substring(contentStart, endIdx);
    },
  );

  /// Replace text string with new string
  /// 
  /// **NOT** calling original Raylib function.
  String TextReplace(
    String text,
    String search,
    String replacement,
  ) => run(
    () => _debugLabels.TextReplace(text, search, replacement),
    () => search.isEmpty ? text : text.replaceAll(search, replacement),
  );

  /// Replace text between two specific strings
  String TextReplaceBetween(
    String text,
    String begin,
    String end,
    String replacement,
  ) => run(
    () => _debugLabels.TextReplaceBetween(text, begin, end, replacement),
    () {
      final startIdx = text.indexOf(begin);
      if (startIdx == -1) return text;
      final contentStart = startIdx + begin.length;
      final endIdx = text.indexOf(end, contentStart);
      if (endIdx == -1) return text;
      return text.substring(0, contentStart) + replacement + text.substring(endIdx);
    },
  );

  /// Insert text in a defined byte position
  String TextInsert(
    String text,
    String insert,
    int position,
  ) => run(
    () => _debugLabels.TextInsert(text, insert, position),
    () {
      final pos = position.clamp(0, text.length);
      return text.substring(0, pos) + insert + text.substring(pos);
    },
  );

  /// Join text strings with delimiter ([delimiter] is expected to be length of 1)
  String TextJoin(
    List<String> textList,
    String delimiter,
  ) => run(
    () => _debugLabels.TextJoin(textList, delimiter),
    () {
      assert(delimiter.length > 1);
      return textList.join(delimiter);
    },
  );

  /// Split text into multiple strings
  List<String> TextSplit(
    String text,
    String delimiter,
  ) => run(
    () => _debugLabels.TextSplit(text, delimiter),
    () => delimiter.isEmpty ? [text] : text.split(delimiter),
  );

  /// Append text at specific position and move cursor
  String TextAppend(
    String text,
    String append,
  ) => run(
    () => _debugLabels.TextAppend(text, append),
    () => text + append,
  );

  /// Find first text occurrence within a string, -1 if not found
  int TextFindIndex(
    String text,
    String search,
  ) => run(
    () => _debugLabels.TextFindIndex(text, search),
    () => text.indexOf(search),
  );

  /// Get upper case version of provided string
  String TextToUpper(
    String text,
  ) => run(
    () => _debugLabels.TextToUpper(text),
    () => text.toUpperCase(),
  );
  
  /// Get lower case version of provided string
  String TextToLower(
    String text,
  ) => run(
    () => _debugLabels.TextToLower(text),
    () => text.toLowerCase(),
  );
  
  /// Get Pascal case notation version of provided string
  String TextToPascal(
    String text,
  ) => run(
    () => _debugLabels.TextToPascal(text),
    () => rl.Utils.TextSplitWords(text)
      .map((w) => w.isEmpty ? w : w[0].toUpperCase() + w.substring(1).toLowerCase())
      .join(),
  );
  
  /// Get Snake case notation version of provided string
  String TextToSnake(
    String text,
  ) => run(
    () => _debugLabels.TextToSnake(text),
    () => rl.Utils.TextSplitWords(text).map((w) => w.toLowerCase()).join('_'),
  );
  
  /// Get Camel case notation version of provided string
  String TextToCamel(
    String text,
  ) => run(
    () => _debugLabels.TextToCamel(text),
    () {
      final words = rl.Utils.TextSplitWords(text);
      if (words.isEmpty) return '';
      final first = words.first.toLowerCase();
      final rest = words.skip(1).map(
        (w) => w.isEmpty ? w : w[0].toUpperCase() + w.substring(1).toLowerCase(),
      );
      return first + rest.join();
    },
  );

  /// Get integer value from text
  int TextToInteger(
    String text,
  ) => run(
    () => _debugLabels.TextToInteger(text),
    () => int.tryParse(text.trim()) ?? 0,
  );
  
  /// Get float value from text
  double TextToFloat(
    String text,
  ) => run(
    () => _debugLabels.TextToFloat(text),
    () => double.tryParse(text.trim()) ?? 0,
  );
    
  /// Draw a line in 3D world space
  void DrawLine3D(
    Vector3D startPos,
    Vector3D endPos,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawLine3D(startPos, endPos, color),
    () => rl.CoreFlat.DrawLine3D(
      startPos,
      endPos,
      color,
    ),
  );
    
  /// Draw a point in 3D space, actually a small line
  void DrawPoint3D(
    Vector3D position,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawPoint3D(position, color),
    () => rl.CoreFlat.DrawPoint3D(
      position,
      color,
    ),
  );
    
  /// Draw a circle in 3D world space
  void DrawCircle3D(
    Vector3D center,
    num radius,
    Vector3D rotationAxis,
    num rotationAngle,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawCircle3D(center, radius, rotationAxis, rotationAngle, color),
    () => rl.CoreFlat.DrawCircle3D(
      center,
      radius.toDouble(),
      rotationAxis,
      rotationAngle.toDouble(),
      color,
    ),
  );
    
  /// Draw a color-filled triangle (vertex in counter-clockwise order!)
  void DrawTriangle3D(
    Vector3D v1,
    Vector3D v2,
    Vector3D v3,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawTriangle3D(v1, v2, v3, color),
    () => rl.CoreFlat.DrawTriangle3D(
      v1,
      v2,
      v3,
      color,
    ),
  );
    
  /// Draw a triangle strip defined by points
  void DrawTriangleStrip3D(
    List<Vector3D> points,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawTriangleStrip3D(points, color),
    () => rl.CoreFlat.DrawTriangleStrip3D(
      rl.Temp.Vector3$.ArrayStruct(points),
      points.length,
      color,
    ),
  );
    
  /// Draw cube
  void DrawCube(
    Vector3D position,
    num width,
    num height,
    num length,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawCube(position, width, height, length, color),
    () => rl.CoreFlat.DrawCube(
      position,
      width.toDouble(),
      height.toDouble(),
      length.toDouble(),
      color,
    ),
  );
    
  /// Draw cube (Vector version)
  void DrawCubeV(
    Vector3D position,
    Vector3D size,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawCubeV(position, size, color),
    () => rl.CoreFlat.DrawCubeV(
      position,
      size,
      color,
    ),
  );
    
  /// Draw cube wires
  void DrawCubeWires(
    Vector3D position,
    num width,
    num height,
    num length,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawCubeWires(position, width, height, length, color),
    () => rl.CoreFlat.DrawCubeWires(
      position,
      width.toDouble(),
      height.toDouble(),
      length.toDouble(),
      color,
    ),
  );
    
  /// Draw cube wires (Vector version)
  void DrawCubeWiresV(
    Vector3D position,
    Vector3D size,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawCubeWiresV(position, size, color),
    () => rl.CoreFlat.DrawCubeWiresV(
      position,
      size,
      color,
    ),
  );
    
  /// Draw sphere
  void DrawSphere(
    Vector3D centerPos,
    num radius,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawSphere(centerPos, radius, color),
    () => rl.CoreFlat.DrawSphere(
      centerPos,
      radius.toDouble(),
      color,
    ),
  );
    
  /// Draw sphere with extended parameters
  void DrawSphereEx(
    Vector3D centerPos,
    num radius,
    num rings,
    num slices,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawSphereEx(centerPos, radius, rings, slices, color),
    () => rl.CoreFlat.DrawSphereEx(
      centerPos,
      radius.toDouble(),
      rings.toInt(),
      slices.toInt(),
      color,
    ),
  );
    
  /// Draw sphere wires
  void DrawSphereWires(
    Vector3D centerPos,
    num radius,
    num rings,
    num slices,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawSphereWires(centerPos, radius, rings, slices, color),
    () => rl.CoreFlat.DrawSphereWires(
      centerPos,
      radius.toDouble(),
      rings.toInt(),
      slices.toInt(),
      color,
    ),
  );
    
  /// Draw a cylinder/cone
  void DrawCylinder(
    Vector3D position,
    num radiusTop,
    num radiusBottom,
    num height,
    num slices,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawCylinder(position, radiusTop, radiusBottom, height, slices, color),
    () => rl.CoreFlat.DrawCylinder(
      position,
      radiusTop.toDouble(),
      radiusBottom.toDouble(),
      height.toDouble(),
      slices.toInt(),
      color,
    ),
  );
    
  /// Draw a cylinder with base at startPos and top at endPos
  void DrawCylinderEx(
    Vector3D startPos,
    Vector3D endPos,
    num startRadius,
    num endRadius,
    num sides,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawCylinderEx(startPos, endPos, startRadius, endRadius, sides, color),
    () => rl.CoreFlat.DrawCylinderEx(
      startPos,
      endPos,
      startRadius.toDouble(),
      endRadius.toDouble(),
      sides.toInt(),
      color,
    ),
  );
    
  /// Draw a cylinder/cone wires
  void DrawCylinderWires(
    Vector3D position,
    num radiusTop,
    num radiusBottom,
    num height,
    num slices,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawCylinderWires(position, radiusTop, radiusBottom, height, slices, color),
    () => rl.CoreFlat.DrawCylinderWires(
      position,
      radiusTop.toDouble(),
      radiusBottom.toDouble(),
      height.toDouble(),
      slices.toInt(),
      color,
    ),
  );
    
  /// Draw a cylinder wires with base at startPos and top at endPos
  void DrawCylinderWiresEx(
    Vector3D startPos,
    Vector3D endPos,
    num startRadius,
    num endRadius,
    num sides,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawCylinderWiresEx(startPos, endPos, startRadius, endRadius, sides, color),
    () => rl.CoreFlat.DrawCylinderWiresEx(
      startPos,
      endPos,
      startRadius.toDouble(),
      endRadius.toDouble(),
      sides.toInt(),
      color,
    ),
  );
    
  /// Draw a capsule with the center of its sphere caps at startPos and endPos
  void DrawCapsule(
    Vector3D startPos,
    Vector3D endPos,
    num radius,
    num slices,
    num rings,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawCapsule(startPos, endPos, radius, slices, rings, color),
    () => rl.CoreFlat.DrawCapsule(
      startPos,
      endPos,
      radius.toDouble(),
      slices.toInt(),
      rings.toInt(),
      color,
    ),
  );
    
  /// Draw capsule wireframe with the center of its sphere caps at startPos and endPos
  void DrawCapsuleWires(
    Vector3D startPos,
    Vector3D endPos,
    num radius,
    num slices,
    num rings,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawCapsuleWires(startPos, endPos, radius, slices, rings, color),
    () => rl.CoreFlat.DrawCapsuleWires(
      startPos,
      endPos,
      radius.toDouble(),
      slices.toInt(),
      rings.toInt(),
      color,
    ),
  );
    
  /// Draw a plane XZ
  void DrawPlane(
    Vector3D centerPos,
    Vector2D size,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawPlane(centerPos, size, color),
    () => rl.CoreFlat.DrawPlane(
      centerPos,
      size,
      color,
    ),
  );
    
  /// Draw a ray line
  void DrawRay(
    RayD ray,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawRay(ray, color),
    () => rl.CoreFlat.DrawRay(
      ray,
      color,
    ),
  );
    
  /// Draw a grid (centered at (0, 0, 0))
  void DrawGrid(
    num slices,
    num spacing,
  ) => run(
    () => _debugLabels.DrawGrid(slices, spacing),
    () => rl.CoreFlat.DrawGrid(
      slices.toInt(),
      spacing.toDouble(),
    ),
  );
    
  /// Load model from files (meshes and materials)
  ModelD LoadModel(
    String fileName,
  ) => run(
    () => _debugLabels.LoadModel(fileName),
    () => rl.CoreFlat.LoadModel(
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );
    
  /// Load model from generated mesh (default material)
  ModelD LoadModelFromMesh(
    MeshD mesh,
  ) => run(
    () => _debugLabels.LoadModelFromMesh(mesh),
    () => rl.CoreFlat.LoadModelFromMesh(
      mesh,
    ),
  );
    
  /// Check if a model is valid (loaded in GPU, VAO/VBOs)
  bool IsModelValid(
    ModelD model,
  ) => run(
    () => _debugLabels.IsModelValid(model),
    () => rl.CoreFlat.IsModelValid(
      model,
    ),
  );
    
  /// Unload model (including meshes) from memory (RAM and/or VRAM)
  void UnloadModel(
    ModelD model,
  ) => run(
    () => _debugLabels.UnloadModel(model),
    () => rl.CoreFlat.UnloadModel(
      model,
    ),
  );
    
  /// Compute model bounding box limits (considers all meshes)
  BoundingBoxD GetModelBoundingBox(
    ModelD model,
  ) => run(
    () => _debugLabels.GetModelBoundingBox(model),
    () => rl.CoreFlat.GetModelBoundingBox(
      model,
    ),
  );
    
  /// Draw a model (with texture if set)
  void DrawModel(
    ModelD model,
    Vector3D position,
    num scale,
    ColorD tint
  ) => run(
    () => _debugLabels.DrawModel(model, position, scale, tint),
    () => rl.CoreFlat.DrawModel(
      model,
      position,
      scale.toDouble(),
      tint,
    ),
  );
    
  /// Draw a model with extended parameters
  void DrawModelEx(
    ModelD model,
    Vector3D position,
    Vector3D rotationAxis,
    num rotationAngle,
    Vector3D scale,
    ColorD tint,
  ) => run(
    () => _debugLabels.DrawModelEx(model, position, rotationAxis, rotationAngle, scale, tint),
    () => rl.CoreFlat.DrawModelEx(
      model,
      position,
      rotationAxis,
      rotationAngle.toDouble(),
      scale,
      tint,
    ),
  );
    
  /// Draw a model wires (with texture if set)
  void DrawModelWires(
    ModelD model,
    Vector3D position,
    num scale,
    ColorD tint,
  ) => run(
    () => _debugLabels.DrawModelWires(model, position, scale, tint),
    () => rl.CoreFlat.DrawModelWires(
      model,
      position,
      scale.toDouble(),
      tint,
    ),
  );
    
  /// Draw a model wires (with texture if set) with extended parameters
  void DrawModelWiresEx(
    ModelD model,
    Vector3D position,
    Vector3D rotationAxis,
    num rotationAngle,
    Vector3D scale,
    ColorD tint,
  ) => run(
    () => _debugLabels.DrawModelWiresEx(model, position, rotationAxis, rotationAngle, scale, tint),
    () => rl.CoreFlat.DrawModelWiresEx(
      model,
      position,
      rotationAxis,
      rotationAngle.toDouble(),
      scale,
      tint,
    ),
  );
    
  /// Draw bounding box (wires)
  void DrawBoundingBox(
    BoundingBoxD box,
    ColorD color,
  ) => run(
    () => _debugLabels.DrawBoundingBox(box, color),
    () => rl.CoreFlat.DrawBoundingBox(
      box,
      color,
    ),
  );

  /// Draw a billboard texture
  void DrawBillboard(
    Camera3DD camera,
    TextureD texture,
    Vector3D position,
    num scale,
    ColorD tint,
  ) => run(
    () => _debugLabels.DrawBillboard(camera, texture, position, scale, tint),
    () => rl.CoreFlat.DrawBillboard(
      camera,
      texture,
      position,
      scale.toDouble(),
      tint,
    ),
  );

  /// Draw a billboard texture defined by source
  void DrawBillboardRec(
    Camera3DD camera,
    TextureD texture,
    RectangleD source,
    Vector3D position,
    Vector2D size,
    ColorD tint,
  ) => run(
    () => _debugLabels.DrawBillboardRec(camera, texture, source, position, size, tint),
    () => rl.CoreFlat.DrawBillboardRec(
      camera,
      texture,
      source,
      position,
      size,
      tint,
    ),
  );

  /// Draw a billboard texture defined by source and rotation
  @Deprecated(
    "Broken by a dart:ffi bug: the trailing Color argument gets corrupted "
    "(or crashes) once the preceding float-only args exceed the CPU's 8 "
    "float registers. Use DrawBillboard/DrawBillboardRec, or wait for the fix. "
    "See dart-lang/sdk#63976."
  )
  void DrawBillboardPro(
    Camera3DD camera,
    TextureD texture,
    RectangleD source,
    Vector3D position,
    Vector3D up,
    Vector2D size,
    Vector2D origin,
    num rotation,
    ColorD tint,
  ) => run(
    () => _debugLabels.DrawBillboardPro(camera, texture, source, position, up, size, origin, rotation, tint),
    () => rl.CoreFlat.DrawBillboardPro(
      camera,
      texture,
      source,
      position,
      up,
      size,
      origin,
      rotation.toDouble(),
      tint,
    ),
  );
  
  /// Upload mesh vertex data in GPU and provide VAO/VBO ids
  void UploadMesh(
    MeshD mesh,
    bool dynamic,
  ) => run(
    () => _debugLabels.UploadMesh(mesh, dynamic),
    () => rl.CoreFlat.UploadMesh(
      rl.Temp.Mesh$.Ref1(mesh),
      dynamic,
    ),
  );
    
  /// Update mesh vertex data in GPU for a specific buffer index
  void UpdateMeshBuffer(
    MeshD mesh,
    num index,
    TypedDataList data,
    num offset,
  ) => run(
    () => _debugLabels.UpdateMeshBuffer(mesh, index, data, offset),
    () => rl.CoreFlat.UpdateMeshBuffer(
      mesh,
      index.toInt(),
      rl.Temp.TypedDataList$.Array(data),
      data.length,
      offset.toInt(),
    ),
  );
    
  /// Unload mesh data from CPU and GPU
  void UnloadMesh(
    MeshD mesh,
  ) => run(
    () => _debugLabels.UnloadMesh(mesh),
    () => rl.CoreFlat.UnloadMesh(
      mesh,
    ),
  );
    
  /// Draw a 3d mesh with material and transform
  void DrawMesh(
    MeshD mesh,
    MaterialD material,
    MatrixD transform,
  ) => run(
    () => _debugLabels.DrawMesh(mesh, material, transform),
    () => rl.CoreFlat.DrawMesh(
      mesh,
      material,
      transform,
    ),
  );
    
  /// Draw multiple mesh instances with material and different transforms
  void DrawMeshInstanced(
    MeshD mesh,
    MaterialD material,
    List<MatrixD> transforms,
  ) => run(
    () => _debugLabels.DrawMeshInstanced(mesh, material, transforms),
    () => rl.CoreFlat.DrawMeshInstanced(
      mesh,
      material,
      rl.Temp.Matrix$.ArrayStruct(transforms),
      transforms.length,
    ),
  );
    
  /// Compute mesh bounding box limits
  BoundingBoxD GetMeshBoundingBox(
    MeshD mesh,
  ) => run(
    () => _debugLabels.GetMeshBoundingBox(mesh),
    () => rl.CoreFlat.GetMeshBoundingBox(
      mesh,
    ),
  );
    
  /// Compute mesh tangents
  void GenMeshTangents(
    MeshD mesh,
  ) => run(
    () => _debugLabels.GenMeshTangents(mesh),
    () => rl.CoreFlat.GenMeshTangents(
      rl.Temp.Mesh$.Ref1(mesh),
    ),
  );
    
  /// Export mesh data to file, returns true on success
  bool ExportMesh(
    MeshD mesh,
    String fileName,
  ) => run(
    () => _debugLabels.ExportMesh(mesh, fileName),
    () => rl.CoreFlat.ExportMesh(
      mesh,
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );
    
  /// Export mesh as code file (.h) defining multiple arrays of vertex attributes
  bool ExportMeshAsCode(
    MeshD mesh,
    String fileName,
  ) => run(
    () => _debugLabels.ExportMeshAsCode(mesh, fileName),
    () => rl.CoreFlat.ExportMeshAsCode(
      mesh,
      rl.Temp.String$.ValueOrNull(fileName),
    ),
  );
    
  /// Generate polygonal mesh
  MeshD GenMeshPoly(
    num sides,
    num radius,
  ) => run(
    () => _debugLabels.GenMeshPoly(sides, radius),
    () => rl.CoreFlat.GenMeshPoly(
      sides.toInt(),
      radius.toDouble(),
    ),
  );
    
  /// Generate plane mesh (with subdivisions)
  MeshD GenMeshPlane(
    num width,
    num length,
    num resX,
    num resZ,
  ) => run(
    () => _debugLabels.GenMeshPlane(width, length, resX, resZ),
    () => rl.CoreFlat.GenMeshPlane(
      width.toDouble(),
      length.toDouble(),
      resX.toInt(),
      resZ.toInt(),
    ),
  );
    
  /// Generate cuboid mesh
  MeshD GenMeshCube(
    num width,
    num height,
    num length,
  ) => run(
    () => _debugLabels.GenMeshCube(width, height, length),
    () => rl.CoreFlat.GenMeshCube(
      width.toDouble(),
      height.toDouble(),
      length.toDouble(),
    ),
  );
    
  /// Generate sphere mesh (standard sphere)
  MeshD GenMeshSphere(
    num radius,
    num rings,
    num slices,
  ) => run(
    () => _debugLabels.GenMeshSphere(radius, rings, slices),
    () => rl.CoreFlat.GenMeshSphere(
      radius.toDouble(),
      rings.toInt(),
      slices.toInt(),
    ),
  );
    
  /// Generate half-sphere mesh (no bottom cap)
  MeshD GenMeshHemiSphere(
    num radius,
    num rings,
    num slices,
  ) => run(
    () => _debugLabels.GenMeshHemiSphere(radius, rings, slices),
    () => rl.CoreFlat.GenMeshHemiSphere(
      radius.toDouble(),
      rings.toInt(),
      slices.toInt(),
    ),
  );
    
  /// Generate cylinder mesh
  MeshD GenMeshCylinder(
    num radius,
    num height,
    num slices,
  ) => run(
    () => _debugLabels.GenMeshCylinder(radius, height, slices),
    () => rl.CoreFlat.GenMeshCylinder(
      radius.toDouble(),
      height.toDouble(),
      slices.toInt(),
    ),
  );
    
  /// Generate cone/pyramid mesh
  MeshD GenMeshCone(
    num radius,
    num height,
    num slices,
  ) => run(
    () => _debugLabels.GenMeshCone(radius, height, slices),
    () => rl.CoreFlat.GenMeshCone(
      radius.toDouble(),
      height.toDouble(),
      slices.toInt(),
    ),
  );
    
  /// Generate torus mesh
  MeshD GenMeshTorus(
    num radius,
    num size,
    num radSeg,
    num sides,
  ) => run(
    () => _debugLabels.GenMeshTorus(radius, size, radSeg, sides),
    () => rl.CoreFlat.GenMeshTorus(
      radius.toDouble(),
      size.toDouble(),
      radSeg.toInt(),
      sides.toInt(),
    ),
  );
    
  /// Generate trefoil knot mesh
  MeshD GenMeshKnot(
    num radius,
    num size,
    num radSeg,
    num sides,
  ) => run(
    () => _debugLabels.GenMeshKnot(radius, size, radSeg, sides),
    () => rl.CoreFlat.GenMeshKnot(
      radius.toDouble(),
      size.toDouble(),
      radSeg.toInt(),
      sides.toInt(),
    ),
  );
    
  /// Generate heightmap mesh from image data
  MeshD GenMeshHeightmap(
    ImageD heightmap,
    Vector3D size,
  ) => run(
    () => _debugLabels.GenMeshHeightmap(heightmap, size),
    () => rl.CoreFlat.GenMeshHeightmap(
      heightmap,
      size,
    ),
  );
    
  /// Generate cubes-based map mesh from image data
  MeshD GenMeshCubicmap(
    ImageD cubicmap,
    Vector3D cubeSize,
  ) => run(
    () => _debugLabels.GenMeshCubicmap(cubicmap, cubeSize),
    () => rl.CoreFlat.GenMeshCubicmap(
      cubicmap,
      cubeSize,
    ),
  );
    
  /// Load materials from model file
  List<MaterialD> LoadMaterials(
    String fileName,
  ) => run(
    () => _debugLabels.LoadMaterials(fileName),
    () {
      final materialCount = rl.Temp.Int$.Ref1();
      final materials = rl.CoreFlat.LoadMaterials(
        rl.Temp.String$.ValueOrNull(fileName),
        materialCount,
      );
      return materials.readArray(materialCount.value);
    },
  );
    
  /// Load default material (Supports: DIFFUSE, SPECULAR, NORMAL maps)
  MaterialD LoadMaterialDefault() => run(
    () => _debugLabels.LoadMaterialDefault(),
    () => rl.CoreFlat.LoadMaterialDefault(),
  );
    
  /// Check if a material is valid (shader assigned, map textures loaded in GPU)
  bool IsMaterialValid(
    MaterialD material,
  ) => run(
    () => _debugLabels.IsMaterialValid(material),
    () => rl.CoreFlat.IsMaterialValid(
      material,
    ),
  );
    
  /// Unload material from GPU memory (VRAM)
  void UnloadMaterial(
    MaterialD material,
  ) => run(
    () => _debugLabels.UnloadMaterial(material),
    () => rl.CoreFlat.UnloadMaterial(
      material,
    ),
  );
    
  /// Set texture for a material map type (MATERIAL_MAP_DIFFUSE, MATERIAL_MAP_SPECULAR...)
  void SetMaterialTexture(
    MaterialD material,
    MaterialMapIndex mapType,
    TextureD texture,
  ) => run(
    () => _debugLabels.SetMaterialTexture(material, mapType, texture),
    () => material.maps[mapType.value].texture = texture,
  );
    
  /// Set material for a mesh
  void SetModelMeshMaterial(
    ModelD model,
    num meshId,
    num materialId,
  ) => run(
    () => _debugLabels.SetModelMeshMaterial(model, meshId, materialId),
    () {
      if (meshId >= model.meshes.length) {
        TraceLog(.LOG_WARNING, "MESH: Id greater than mesh count");
        return;
      }
      if (materialId >= model.materials.length) {
        TraceLog(.LOG_WARNING, "MATERIAL: Id greater than material count");
        return;
      }
      model.meshMaterial[meshId.toInt()] = materialId.toInt();
    },
  );
    
  /// Load model animations from file
  List<ModelAnimationD> LoadModelAnimations(
    String fileName,
  ) => run(
    () => _debugLabels.LoadModelAnimations(fileName),
    () {
      final animCount = rl.Temp.Int$.Ref1();
      final anims = rl.CoreFlat.LoadModelAnimations(
        rl.Temp.String$.ValueOrNull(fileName),
        animCount,
      );
      return anims.readArray(animCount.value);
    },
  );
    
  /// Update model animation pose (CPU)
  void UpdateModelAnimation(
    ModelD model,
    ModelAnimationD anim,
    num frame,
  ) => run(
    () => _debugLabels.UpdateModelAnimation(model, anim, frame),
    () => rl.CoreFlat.UpdateModelAnimation(
      model,
      anim,
      frame.toDouble(),
    ),
  );
    
  /// Update model animation data (vertex buffers / bone matrices) for a specific pose,
  /// defined by two different animations at specific frames blended together
  void UpdateModelAnimationEx(
    ModelD model,
    ModelAnimationD animA,
    num frameA,
    ModelAnimationD animB,
    num frameB,
    num blend,
  ) => run(
    () => _debugLabels.UpdateModelAnimationEx(model, animA, frameA, animB, frameB, blend),
    () => rl.CoreFlat.UpdateModelAnimationEx(
      model,
      animA,
      frameA.toDouble(),
      animB,
      frameB.toDouble(),
      blend.toDouble(),
    ),
  );
    
  /// Unload animation array data
  void UnloadModelAnimations(
    List<ModelAnimationD> animations,
  ) => run(
    () => _debugLabels.UnloadModelAnimations(animations),
    () => rl.CoreFlat.UnloadModelAnimations(
      animations.first.getOp(),
      animations.length,
    ),
  );
    
  /// Check model animation skeleton match
  bool IsModelAnimationValid(
    ModelD model,
    ModelAnimationD anim,
  ) => run(
    () => _debugLabels.IsModelAnimationValid(model, anim),
    () => rl.CoreFlat.IsModelAnimationValid(
      model,
      anim,
    ),
  );
    
  /// Check collision between two spheres
  bool CheckCollisionSpheres(
    Vector3D center1,
    num radius1,
    Vector3D center2,
    num radius2,
  ) => run(
    () => _debugLabels.CheckCollisionSpheres(center1, radius1, center2, radius2),
    () => rl.CoreFlat.CheckCollisionSpheres(
      center1,
      radius1.toDouble(),
      center2,
      radius2.toDouble(),
    ),
  );
    
  /// Check collision between two bounding boxes
  bool CheckCollisionBoxes(
    BoundingBoxD box1,
    BoundingBoxD box2,
  ) => run(
    () => _debugLabels.CheckCollisionBoxes(box1, box2),
    () => rl.CoreFlat.CheckCollisionBoxes(
      box1,
      box2,
    ),
  );
    
  /// Check collision between box and sphere
  bool CheckCollisionBoxSphere(
    BoundingBoxD box,
    Vector3D center,
    num radius,
  ) => run(
    () => _debugLabels.CheckCollisionBoxSphere(box, center, radius),
    () => rl.CoreFlat.CheckCollisionBoxSphere(
      box,
      center,
      radius.toDouble(),
    ),
  );
    
  /// Get collision info between ray and sphere
  RayCollisionD GetRayCollisionSphere(
    RayD ray,
    Vector3D center,
    num radius,
  ) => run(
    () => _debugLabels.GetRayCollisionSphere(ray, center, radius),
    () => rl.CoreFlat.GetRayCollisionSphere(
      ray,
      center,
      radius.toDouble(),
    ),
  );
    
  /// Get collision info between ray and box
  RayCollisionD GetRayCollisionBox(
    RayD ray,
    BoundingBoxD box,
  ) => run(
    () => _debugLabels.GetRayCollisionBox(ray, box),
    () => rl.CoreFlat.GetRayCollisionBox(
      ray,
      box,
    ),
  );
    
  /// Get collision info between ray and mesh
  RayCollisionD GetRayCollisionMesh(
    RayD ray,
    MeshD mesh,
    MatrixD transform,
  ) => run(
    () => _debugLabels.GetRayCollisionMesh(ray, mesh, transform),
    () => rl.CoreFlat.GetRayCollisionMesh(
      ray,
      mesh,
      transform,
    ),
  );
    
  /// Get collision info between ray and triangle
  RayCollisionD GetRayCollisionTriangle(
    RayD ray,
    Vector3D p1,
    Vector3D p2,
    Vector3D p3,
  ) => run(
    () => _debugLabels.GetRayCollisionTriangle(ray, p1, p2, p3),
    () => rl.CoreFlat.GetRayCollisionTriangle(
      ray,
      p1,
      p2,
      p3,
    ),
  );
    
  /// Get collision info between ray and quad
  RayCollisionD GetRayCollisionQuad(
    RayD ray,
    Vector3D p1,
    Vector3D p2,
    Vector3D p3,
    Vector3D p4,
  ) => run(
    () => _debugLabels.GetRayCollisionQuad(ray, p1, p2, p3, p4),
    () => rl.CoreFlat.GetRayCollisionQuad(
      ray,
      p1,
      p2,
      p3,
      p4,
    ),
  );
}
