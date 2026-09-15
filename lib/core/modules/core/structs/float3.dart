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

  /// Describes the raw memory layout, construction, and pointer representation
  /// of this struct type.
  static final StructType<float3D> struct = .new(
    factory: float3D.new,
    layout: .aligned<float3Field>({
      .v: RArray(RFloat(), 3),
    }),
  );

  /// Raw memory layout of this object.
  static final StructLayout<float3Field> structLayout = struct.layoutOf();

  /// Field descriptor for [v].
  static final field_v = structLayout.scalarArray<double, RFloat>(.v);

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
    _v = field_v.live(() => op, .filled(field_v.codec.type.count, 0));
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