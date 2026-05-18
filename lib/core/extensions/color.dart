part of '../raylib_dartified_base.dart';

/// Provides Raylib's predefined color constants as typed [ColorStructType] instances,
/// and exposes color utility functions as module-level calls.
abstract class RaylibColorExtensionBase<
  R extends RaylibBase,

  ColorStructType

> extends RaylibModule<R> {

  RaylibColorExtensionBase(super.rl);

  ColorStructType get LIGHTGRAY;
  ColorStructType get GRAY;
  ColorStructType get DARKGRAY;
  ColorStructType get YELLOW;
  ColorStructType get GOLD;
  ColorStructType get ORANGE;
  ColorStructType get PINK;
  ColorStructType get RED;
  ColorStructType get MAROON;
  ColorStructType get GREEN;
  ColorStructType get LIME;
  ColorStructType get DARKGREEN;
  ColorStructType get SKYBLUE;
  ColorStructType get BLUE;
  ColorStructType get DARKBLUE;
  ColorStructType get PURPLE;
  ColorStructType get VIOLET;
  ColorStructType get DARKPURPLE;
  ColorStructType get BEIGE;
  ColorStructType get BROWN;
  ColorStructType get DARKBROWN;
  ColorStructType get WHITE;
  ColorStructType get BLACK;
  ColorStructType get BLANK;
  ColorStructType get MAGENTA;
  ColorStructType get RAYWHITE;
  ColorStructType get TRANSPARENT;
}