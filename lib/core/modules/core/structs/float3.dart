// Portions of this file are derived from raylib.
// Original work © Ramon Santamaria and contributors.
// Used under the zlib/libpng license. See LICENSE for details.
// ignore_for_file: camel_case_types

part of '../../../raylib_dartified_base.dart';

enum float3Field with StructFields {
  v,
}

/// Raylib's `float3` struct holding 3 `float` values
class float3D extends RaylibStructLiteral<float3D> {

  //   ░██████   ░██████████░█████████  ░██     ░██   ░██████  ░██████████
  //  ░██   ░██      ░██    ░██     ░██ ░██     ░██  ░██   ░██     ░██    
  // ░██             ░██    ░██     ░██ ░██     ░██ ░██            ░██    
  //  ░████████      ░██    ░█████████  ░██     ░██ ░██            ░██    
  //         ░██     ░██    ░██   ░██   ░██     ░██ ░██            ░██    
  //  ░██   ░██      ░██    ░██    ░██   ░██   ░██   ░██   ░██     ░██    
  //   ░██████       ░██    ░██     ░██   ░██████     ░██████      ░██    

  @override
  StructLayout<float3Field> get structLayout => struct;

  /// Raw memory layout of the C struct (field order, offsets, and backing [RType]s).
  static final StructLayout<float3Field> struct = .aligned({
    .v: RArray(RFloat(), 3),
  });

  /// Wraps [ptr] as a [StructPointer]; if [ptr] is `null`, the returned
  /// [StructPointer] wraps [MemoryPointer.nullptr].
  static StructPointer<float3D> pointer(MemoryPointer? ptr)
    => .nullable(ptr, struct, float3D.new, float3D.pointer);

  // TODO: make all the fields public
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

  float3D({
    super.op,
    List<double>? v,
  }) {
    _v = _vF.live(() => op, .filled(_vF.codec.type.count, 0));
  }

  factory float3D.zero() => .new();

  factory float3D.float3(
    num v0,
    num v1,
    num v2,
  ) => .new(
    v: [
      v0.toDouble(),
      v1.toDouble(),
      v2.toDouble(),
    ],
  );

  @override
  float3D setDart(float3D o) {
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
  float3D clone() => .new(
    op: op,
    v: .from(v),
  );

  List<double> toArray() => v.materialize();

  @override
  String signature() => '$structName(${v.materialize().join(', ')})';
}