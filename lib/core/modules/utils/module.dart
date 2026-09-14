part of '../../raylib_dartified_base.dart';

/// Dart-side utility helpers with no direct Raylib counterpart.
final class RaylibUtilsModule<R extends RaylibBase> extends RaylibModule<R> {

  RaylibUtilsModule(super.rl);

  /// Number of `uint32` words in an MD5 hash (128 bits).
  int get md5Uint32HashLength => 4;

  /// Number of `uint32` words in a SHA-1 hash (160 bits).
  int get sha1Uint32HashLength => 5;

  /// Number of `uint32` words in a SHA-256 hash (256 bits).
  int get sha256Uint32HashLength => 8;

  /// Combines multiple [RaylibEnum] values into a single bitmask via bitwise OR.
  int EnumsAsFlagsOr(Iterable<RaylibEnum> values) {
    return values.fold(0, (acc, e) => acc | e.value);
  }

  // final _fmtSpecifier = RegExp(r'%(?!%)[-+ #0]*\d*(\.\d+)?[hlLqjzt]*[diouxXeEfFgGaAcspn]');

  /// Checks if [s] contains any `printf format specifiers`.
  bool HasFormatSpecifier(String s) => _fmtSpecifier.hasMatch(s);

  // Format

  final _fmtSpecifier = RegExp(r'%(?!%)([-+ #0]*)(\d+|\*)?(?:\.(\d+|\*))?[hlLqjzt]*([diouxXeEfFgGaAcspn])');

  /// Formats [fmt] printf-style, consuming positional arguments from [args].
  ///
  /// Supports the standard conversions (`d i u o x X e E f F g G a A c s p`),
  /// flags (`- + space # 0`), width/precision (including `*`), and ignores
  /// length modifiers (`h l L q j z t`) since Dart ints/doubles are already
  /// fixed-width.
  ///
  /// Any literal `%` left over from substituted values is escaped to
  /// `%%` so native `printf` can't reinterpret it.
  ///
  /// Known caveats:
  /// - `%g`/`%G` use [double.toStringAsPrecision], which doesn't exactly
  ///   match C's "shortest of %e/%f, trim trailing zeros" rule, close
  ///   enough for logging, not bit-exact.
  /// - `%u` always prints via `toUnsigned(64)`. If a value is a genuinely
  ///   32-bit unsigned quantity represented as a negative 32-bit signed int,
  ///   this will print the wrong magnitude, length modifiers are currently
  ///   ignored, so there's no way to request `toUnsigned(32)` instead.
  /// - `NaN`/`Infinity` are not special-cased: `toStringAsFixed` and
  ///   `toStringAsExponential` throw on non-finite doubles, so passing one
  ///   to `%e/%f/%g` will throw rather than print `nan`/`inf`.
  String Format(String fmt, [List<Object?> args = const []]) {
    var argIdx = 0;
    Object? nextArg() {
      if (argIdx >= args.length) {
        throw StateError('`$fmt` expects more args than the ${args.length} provided.');
      }
      return args[argIdx++];
    }

    final out = StringBuffer();
    var last = 0;
    for (final m in _fmtSpecifier.allMatches(fmt)) {
      out.write(fmt.substring(last, m.start));
      last = m.end;
      final flags = m.group(1) ?? '';
      final width = _resolveIntField(m.group(2), nextArg);
      final precision = m.group(3) == null ? null : _resolveIntField(m.group(3), nextArg);
      out.write(_formatOne(m.group(4)!, flags, width, precision, nextArg));
    }
    out.write(fmt.substring(last));

    if (argIdx != args.length) {
      throw StateError('`$fmt` consumed $argIdx args but ${args.length} were provided.');
    }

    // Escape any literal `%` that came from substituted values so
    // native `printf` doesn't reinterpret it.
    return out.toString().replaceAll('%', '%%');
  }

  int? _resolveIntField(String? raw, Object? Function() nextArg) {
    if (raw == null) return null;
    if (raw == '*') {
      final v = nextArg();
      if (v is! int) throw StateError('`*` field expects an int, got $v.');
      return v;
    }
    return int.parse(raw);
  }

  String _formatOne(String conv, String flags, int? width, int? precision, Object? Function() nextArg) {
    final leftAlign = flags.contains('-');
    final zeroPad = flags.contains('0') && !leftAlign;
    final plus = flags.contains('+');
    final space = flags.contains(' ');
    final alt = flags.contains('#');

    String body;
    switch (conv) {
      case 'd':
      case 'i':
        final v = _asInt(nextArg());
        body = v.abs().toString();
        if (precision != null) body = body.padLeft(precision, '0');
        body = v < 0 ? '-$body' : (plus ? '+$body' : (space ? ' $body' : body));
      case 'u':
        body = _asInt(nextArg()).toUnsigned(64).toString();
      case 'o':
        body = _asInt(nextArg()).toRadixString(8);
        if (alt && !body.startsWith('0')) body = '0$body';
      case 'x':
        body = _asInt(nextArg()).toRadixString(16);
        if (alt) body = '0x$body';
      case 'X':
        body = _asInt(nextArg()).toRadixString(16).toUpperCase();
        if (alt) body = '0X$body';
      case 'c':
        final v = nextArg();
        body = v is int ? String.fromCharCode(v) : v.toString();
      case 's':
        body = nextArg().toString();
        if (precision != null && precision < body.length) body = body.substring(0, precision);
      case 'e' || 'E' || 'f' || 'F' || 'g' || 'G' || 'a' || 'A':
        body = _formatFloat(_asDouble(nextArg()), conv, precision, plus, space);
      case 'p':
        body = '0x${_asInt(nextArg()).toRadixString(16)}';
      default:
        throw StateError('Unsupported format specifier `%$conv`.');
    }

    if (width != null && body.length < width) {
      body = leftAlign
          ? body.padRight(width)
          : (zeroPad && conv != 's' && conv != 'c' ? _zeroPadSigned(body, width) : body.padLeft(width));
    }
    return body;
  }

  String _zeroPadSigned(String s, int width) {
    final signed = s.startsWith('-') || s.startsWith('+');
    final sign = signed ? s[0] : '';
    final digits = signed ? s.substring(1) : s;
    return '$sign${digits.padLeft(width - sign.length, '0')}';
  }

  int _asInt(Object? v) => switch (v) {
    int i => i,
    double d => d.toInt(),
    _ => throw StateError('Expected int arg, got $v.'),
  };

  double _asDouble(Object? v) => switch (v) {
    double d => d,
    int i => i.toDouble(),
    _ => throw StateError('Expected numeric arg, got $v.'),
  };

  String _formatFloat(double v, String conv, int? precision, bool plus, bool space) {
    final p = precision ?? 6;
    var body = switch (conv) {
      'e' || 'E' => v.toStringAsExponential(p),
      'g' || 'G' => v.toStringAsPrecision(p == 0 ? 1 : p),
      _ => v.toStringAsFixed(p),
    };
    if (conv == 'E' || conv == 'G') body = body.toUpperCase();
    if (v >= 0) body = plus ? '+$body' : (space ? ' $body' : body);
    return body;
  }

  /// Splits on `_`, `-`, ` ` and camel/Pascal-case boundaries.
  List<String> TextSplitWords(String text) {
    final result = <String>[];
    final buffer = StringBuffer();
    for (var i = 0; i < text.length; i++) {
      final c = text[i];
      if (c == '_' || c == '-' || c == ' ') {
        if (buffer.isNotEmpty) {
          result.add(buffer.toString());
          buffer.clear();
        }
      } else if (buffer.isNotEmpty && c != c.toLowerCase() && c == c.toUpperCase()) {
        result.add(buffer.toString());
        buffer.clear();
        buffer.write(c);
      } else {
        buffer.write(c);
      }
    }
    if (buffer.isNotEmpty) result.add(buffer.toString());
    return result;
  }
}
