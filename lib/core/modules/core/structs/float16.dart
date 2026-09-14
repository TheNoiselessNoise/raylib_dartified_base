// Portions of this file are derived from raylib.
// Original work © Ramon Santamaria and contributors.
// Used under the zlib/libpng license. See LICENSE for details.
// ignore_for_file: camel_case_types

part of '../../../raylib_dartified_base.dart';

enum float16Field with StructFields {
  v,
}

/// Raylib's `float16` struct holding 16 `float` values
class float16D extends RaylibStructLiteral<float16D> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  @override
  StructLayout<float16Field> get structLayout => struct;

  /// Raw memory layout of the C struct (field order, offsets, and backing [RType]s).
  static final StructLayout<float16Field> struct = .aligned({
    .v: RArray(RFloat(), 16),
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<float16D> pointer(MemoryPointer? ptr)
    => .nullable(ptr, struct, float16D.new, float16D.pointer);

  static final _vF = struct.scalarArray<double, RFloat>(.v);

  // ░███████   ░██████████ ░██████████
  // ░██   ░██  ░██         ░██        
  // ░██    ░██ ░██         ░██        
  // ░██    ░██ ░█████████  ░█████████ 
  // ░██    ░██ ░██         ░██        
  // ░██   ░██  ░██         ░██        
  // ░███████   ░██████████ ░██        
  
  late final StructLiveList<double, RFloat> _v;
  StructLiveList<double, RFloat> get v => _v;
  set v(List<double> value) => _v.inner = value;

  float16D({
    super.op,
    List<double>? v,
  }) {
    _v = _vF.live(() => op, .filled(_vF.codec.type.count, 0));
  }

  factory float16D.zero() => .new();

  factory float16D.float16(
    num v0, num v1, num v2, num v3,
    num v4, num v5, num v6, num v7,
    num v8, num v9, num v10, num v11,
    num v12, num v13, num v14, num v15
  ) => .new(
    v: [
      v0, v1, v2, v3,
      v4, v5, v6, v7,
      v8, v9, v10, v11,
      v12, v13, v14, v15
    ].map((x) => x.toDouble()).toList(),
  );

  @override
  float16D setDart(float16D o) {
    v = .from(o.v);
    return this;
  }

  @override
  void structWriteInto(MemoryPointer p) {
    _v.writeInto(p);
  }

  @override
  void structReadFrom(MemoryPointer p) {
    _v.readFrom(p);
  }

  @override
  float16D clone() => .new(
    op: op,
    v: .from(v),
  );

  List<double> toArray() => v.materialize();

  @override
  String signature() => '$structName(${v.materialize().join(', ')})';
}