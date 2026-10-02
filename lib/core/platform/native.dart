import 'dart:io';
import 'package:raylib_dartified_base/raylib_dartified_base.dart';

/// The Raylib platform selected at compile time.
RaylibPlatform get currentRaylibPlatform {
  if (Platform.isAndroid) return .android;
  if (Platform.isLinux) return .linux;
  if (Platform.isMacOS) return .macOS;
  if (Platform.isIOS) return .iOS;
  if (Platform.isWindows) return .windows;
  if (Platform.isFuchsia) return .fuchsia;
  throw UnsupportedError('No Raylib platform implementation available for ${Platform.operatingSystem} platform');
}