part of '../../raylib_dartified_base.dart';

mixin LightBase {
  LightType get type;
  bool get enabled;
  Vector3Base get position;
  Vector3Base get target;
  ColorBase get color;
  double get attenuation;
  int get enabledLoc;
  int get typeLoc;
  int get positionLoc;
  int get targetLoc;
  int get colorLoc;
  int get attenuationLoc;
}