import 'package:raylib_dartified_base/raylib_dartified_base.dart';

// Exports everything that can be shared across Dart and Flat layers.

RaylibBase get _rl => RaylibBase.instance;

RaylibTemp get Temp => _rl.Temp;

/// See [RaylibTemp.structAlloc].
RaylibTempStructAllocator<D> structAllocator<D extends RaylibStruct<D>>([StructType<D>? struct])
  => Temp.structAlloc<D>(struct);

/// See [StructTypes.of].
StructType<D> structType<D extends RaylibStruct<D>>([D? value])
  => StructTypes.of<D>(value);

/// See [RaylibBase.rand].
double rand() => _rl.rand();

/// See [RaylibBase.randC].
double randC() => _rl.randC();

/// See [RaylibTempUtils.realloc].
MemoryPointer<RVoid> realloc(MemoryPointer oldPtr, int oldSize, int newSize)
  => Temp.Utils.realloc(oldPtr, oldSize, newSize);

/// See [RaylibTempUtils.memset].
void memset(MemoryPointer ptr, int value, int size)
  => Temp.Utils.memset(ptr, value, size);

/// See [RaylibTempUtils.memcpy].
void memcpy(MemoryPointer dest, MemoryPointer src, int n)
  => Temp.Utils.memcpy(dest, src, n);

/// See [RaylibTempUtils.memcmp].
int memcmp(MemoryPointer a, MemoryPointer b, int n)
  => Temp.Utils.memcmp(a, b, n);

/// See [RaylibTempUtils.strlen].
int strlen(MemoryPointer ptr)
  => Temp.Utils.strlen(ptr);

/// See [RaylibTempUtils.strnlen].
int strnlen(MemoryPointer ptr, int maxLen)
  => Temp.Utils.strnlen(ptr, maxLen);

/// See [RaylibTempUtils.strcmp].
int strcmp(MemoryPointer a, MemoryPointer b)
  => Temp.Utils.strcmp(a, b);

/// See [RaylibTempUtils.strcpy].
void strcpy(MemoryPointer dest, MemoryPointer src)
  => Temp.Utils.strcpy(dest, src);

/// See [RaylibTempUtils.strncpy].
void strncpy(MemoryPointer dest, MemoryPointer src, int n)
  => Temp.Utils.strncpy(dest, src, n);

/// See [RaylibTempUtils.strncat].
void strncat(MemoryPointer dest, MemoryPointer src, int n)
  => Temp.Utils.strncat(dest, src, n);

/// See [RaylibTempUtils.strstr].
MemoryPointer<RVoid> strstr(MemoryPointer haystack, MemoryPointer needle)
  => Temp.Utils.strstr(haystack, needle);

extension StringToRaylibC on String {
  MemoryPointer<RChar> get toC => Temp.String$.Value(this);
}

Color get LIGHTGRAY => .LIGHTGRAY;
Color get GRAY => .GRAY;
Color get DARKGRAY => .DARKGRAY;
Color get YELLOW => .YELLOW;
Color get GOLD => .GOLD;
Color get ORANGE => .ORANGE;
Color get PINK => .PINK;
Color get RED => .RED;
Color get MAROON => .MAROON;
Color get GREEN => .GREEN;
Color get LIME => .LIME;
Color get DARKGREEN => .DARKGREEN;
Color get SKYBLUE => .SKYBLUE;
Color get BLUE => .BLUE;
Color get DARKBLUE => .DARKBLUE;
Color get PURPLE => .PURPLE;
Color get VIOLET => .VIOLET;
Color get DARKPURPLE => .DARKPURPLE;
Color get BEIGE => .BEIGE;
Color get BROWN => .BROWN;
Color get DARKBROWN => .DARKBROWN;
Color get WHITE => .WHITE;
Color get BLACK => .BLACK;
Color get BLANK => .BLANK;
Color get MAGENTA => .MAGENTA;
Color get RAYWHITE => .RAYWHITE;
Color get TRANSPARENT => .TRANSPARENT;