import 'package:raylib_dartified_base/raylib_dartified_base.dart';
import 'package:raylib_dartified_base/abbr_dart.dart';

class BackendAgnosticRaylibExample<R extends RaylibBase<R>> extends RaylibAppBase<R> {
  @override
  bool shouldClose(_) => switch (currentRaylibPlatform) {
    .native => WindowShouldClose(),
    .web => false,
  };

  @override
  void init(_) {
    InitWindow(800, 450, 'Backend Agnostic Raylib Example');
  }

  @override
  Future<void> loop(_) async {
    DrawCircleV(GetMousePosition(), 25, .RED);
  }
}