part of '../../raylib_dartified_base.dart';

final class MouseButtonInfo {
  final bool up;
  final bool down;
  final bool pressed;
  final bool released;

  const MouseButtonInfo({
    this.up = false,
    this.down = false,
    this.pressed = false,
    this.released = false,
  });
}

final class MouseInfo<Vector2StructType> {
  final Vector2StructType position;
  final Vector2StructType delta;
  final Vector2StructType wheel;
  final MouseButtonInfo btnLeft;
  final MouseButtonInfo btnMiddle;
  final MouseButtonInfo btnRight;
  final MouseButtonInfo btnSide;
  final MouseButtonInfo btnExtra;
  final MouseButtonInfo btnForward;
  final MouseButtonInfo btnBack;

  MouseInfo({
    Vector2StructType? position,
    Vector2StructType? delta,
    Vector2StructType? wheel,
    MouseButtonInfo? btnLeft,
    MouseButtonInfo? btnMiddle,
    MouseButtonInfo? btnRight,
    MouseButtonInfo? btnSide,
    MouseButtonInfo? btnExtra,
    MouseButtonInfo? btnForward,
    MouseButtonInfo? btnBack,
  }) :
    position = position ?? RaylibVector2Factories.zeroFactory() as Vector2StructType,
    delta = delta ?? RaylibVector2Factories.zeroFactory() as Vector2StructType,
    wheel = wheel ?? RaylibVector2Factories.zeroFactory() as Vector2StructType,
    btnLeft = btnLeft ?? .new(),
    btnMiddle = btnMiddle ?? .new(),
    btnRight = btnRight ?? .new(),
    btnSide = btnSide ?? .new(),
    btnExtra = btnExtra ?? .new(),
    btnForward = btnForward ?? .new(),
    btnBack = btnBack ?? .new();

  MouseButtonInfo getButtonInfo(MouseButton button) => switch (button) {
    .MOUSE_BUTTON_LEFT => btnLeft,
    .MOUSE_BUTTON_RIGHT => btnRight,
    .MOUSE_BUTTON_MIDDLE => btnMiddle,
    .MOUSE_BUTTON_SIDE => btnSide,
    .MOUSE_BUTTON_EXTRA => btnExtra,
    .MOUSE_BUTTON_FORWARD => btnForward,
    .MOUSE_BUTTON_BACK => btnBack,
  };
}