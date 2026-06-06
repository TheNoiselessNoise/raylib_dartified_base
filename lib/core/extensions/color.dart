part of '../raylib_dartified_base.dart';

/// Provides Raylib's predefined color constants as typed [ColorStructType] instances,
/// and exposes color utility functions as module-level calls.
abstract class RaylibColorExtensionBase<
  R extends RaylibBase,

  ColorStructType

> extends RaylibModule<R> {

  RaylibColorExtensionBase(super.rl);

  /// Raylib's predefined color `LIGHTGRAY`.
  ColorStructType get LIGHTGRAY;

  /// Raylib's predefined color `GRAY`.
  ColorStructType get GRAY;

  /// Raylib's predefined color `DARKGRAY`.
  ColorStructType get DARKGRAY;

  /// Raylib's predefined color `YELLOW`.
  ColorStructType get YELLOW;

  /// Raylib's predefined color `GOLD`.
  ColorStructType get GOLD;

  /// Raylib's predefined color `ORANGE`.
  ColorStructType get ORANGE;

  /// Raylib's predefined color `PINK`.
  ColorStructType get PINK;

  /// Raylib's predefined color `RED`.
  ColorStructType get RED;

  /// Raylib's predefined color `MAROON`.
  ColorStructType get MAROON;

  /// Raylib's predefined color `GREEN`.
  ColorStructType get GREEN;

  /// Raylib's predefined color `LIME`.
  ColorStructType get LIME;

  /// Raylib's predefined color `DARKGREEN`.
  ColorStructType get DARKGREEN;

  /// Raylib's predefined color `SKYBLUE`.
  ColorStructType get SKYBLUE;

  /// Raylib's predefined color `BLUE`.
  ColorStructType get BLUE;

  /// Raylib's predefined color `DARKBLUE`.
  ColorStructType get DARKBLUE;

  /// Raylib's predefined color `PURPLE`.
  ColorStructType get PURPLE;

  /// Raylib's predefined color `VIOLET`.
  ColorStructType get VIOLET;

  /// Raylib's predefined color `DARKPURPLE`.
  ColorStructType get DARKPURPLE;

  /// Raylib's predefined color `BEIGE`.
  ColorStructType get BEIGE;

  /// Raylib's predefined color `BROWN`.
  ColorStructType get BROWN;

  /// Raylib's predefined color `DARKBROWN`.
  ColorStructType get DARKBROWN;

  /// Raylib's predefined color `WHITE`.
  ColorStructType get WHITE;

  /// Raylib's predefined color `BLACK`.
  ColorStructType get BLACK;

  /// Raylib's predefined color `BLANK`.
  ColorStructType get BLANK;

  /// Raylib's predefined color `MAGENTA`.
  ColorStructType get MAGENTA;

  /// Raylib's predefined color `RAYWHITE`.
  ColorStructType get RAYWHITE;

  /// Raylib's predefined color `TRANSPARENT`.
  ColorStructType get TRANSPARENT;

}