part of 'raylib_dartified_base.dart';

mixin RaylibEnum on Enum {
  int get value;

  bool lt(RaylibEnum o) => value < o.value;
  bool lte(RaylibEnum o) => value <= o.value;
  bool gt(RaylibEnum o) => value > o.value;
  bool gte(RaylibEnum o) => value >= o.value;
  bool eq(RaylibEnum o) => value == o.value;
  bool neq(RaylibEnum o) => value != o.value;
}

mixin RaylibCallbackBase {
  String get name;
}

mixin RaylibModuleBase {
  RaylibBase get rl;

  void dispose();
}

mixin RaylibBase {}