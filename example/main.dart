import 'package:raylib_dartified_base/raylib_dartified_base.dart';
import 'package:raylib_dartified_base/abbr/dart.dart';

class BackendAgnosticRaylibExample<R extends RaylibBase> extends RaylibAppBase<R> {
  @override
  void init(_) {
    InitWindow(800, 450, 'Backend Agnostic Raylib Example');
  }

  @override
  Future<void> loop(_) async {
    DrawCircleV(GetMousePosition(), 25, .RED);
  }
}