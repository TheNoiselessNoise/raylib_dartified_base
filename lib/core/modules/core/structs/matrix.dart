// Portions of this file are derived from raylib.
// Original work © Ramon Santamaria and contributors.
// Used under the zlib/libpng license. See LICENSE for details.
part of '../../../raylib_dartified_base.dart';

/// Backend-agnostic contract for [MatrixBase] structs.
///
/// Must be mixed into every concrete platform implementation of a Raylib
/// type to ensure a unified API surface across different backends.
mixin MatrixBase<
  M extends MatrixBase<M, V3, Q, V4>,
  V3 extends Vector3Base<V3, M, Q, V4>,
  Q extends QuaternionBase<Q, M, V3, V4>,
  V4 extends Vector4Base<V4, Q, M, V3>

> on RaylibStructObjectBase<M> {
  
  abstract double m0;
  abstract double m1;
  abstract double m2;
  abstract double m3;
  abstract double m4;
  abstract double m5;
  abstract double m6;
  abstract double m7;
  abstract double m8;
  abstract double m9;
  abstract double m10;
  abstract double m11;
  abstract double m12;
  abstract double m13;
  abstract double m14;
  abstract double m15;

  M set(
    num m0, num m1, num m2, num m3,
    num m4, num m5, num m6, num m7,
    num m8, num m9, num m10, num m11,
    num m12, num m13, num m14, num m15,
  ) {
    this.m0 = m0.toDouble(); this.m1 = m1.toDouble(); this.m2 = m2.toDouble(); this.m3 = m3.toDouble();
    this.m4 = m4.toDouble(); this.m5 = m5.toDouble(); this.m6 = m6.toDouble(); this.m7 = m7.toDouble();
    this.m8 = m8.toDouble(); this.m9 = m9.toDouble(); this.m10 = m10.toDouble(); this.m11 = m11.toDouble();
    this.m12 = m12.toDouble(); this.m13 = m13.toDouble(); this.m14 = m14.toDouble(); this.m15 = m15.toDouble();
    return this as M;
  }

  String format([int x0 = 0])
    => '[ ${[
      [m0, m1, m2, m3].map((x) => x.toStringAsFixed(x0)).join(', '),
      [m4, m5, m6, m7].map((x) => x.toStringAsFixed(x0)).join(', '),
      [m8, m9, m10, m11].map((x) => x.toStringAsFixed(x0)).join(', '),
      [m12, m13, m14, m15].map((x) => x.toStringAsFixed(x0)).join(', '),
    ].join('\n')} ]';

  M transpose() => RaylibMatrixFactories.createFactory(
    m0, m4, m8, m12,
    m1, m5, m9, m13,
    m2, m6, m10, m14,
    m3, m7, m11, m15,
  ) as M;

  M invert() {
    M result = RaylibMatrixFactories.zeroFactory() as M;

    final a00 = m0, a01 = m1, a02 = m2, a03 = m3;
    final a10 = m4, a11 = m5, a12 = m6, a13 = m7;
    final a20 = m8, a21 = m9, a22 = m10, a23 = m11;
    final a30 = m12, a31 = m13, a32 = m14, a33 = m15;

    final b00 = a00*a11 - a01*a10;
    final b01 = a00*a12 - a02*a10;
    final b02 = a00*a13 - a03*a10;
    final b03 = a01*a12 - a02*a11;
    final b04 = a01*a13 - a03*a11;
    final b05 = a02*a13 - a03*a12;
    final b06 = a20*a31 - a21*a30;
    final b07 = a20*a32 - a22*a30;
    final b08 = a20*a33 - a23*a30;
    final b09 = a21*a32 - a22*a31;
    final b10 = a21*a33 - a23*a31;
    final b11 = a22*a33 - a23*a32;

    final invDet = 1.0/(b00*b11 - b01*b10 + b02*b09 + b03*b08 - b04*b07 + b05*b06);

    result.m0 = (a11*b11 - a12*b10 + a13*b09)*invDet;
    result.m1 = (-a01*b11 + a02*b10 - a03*b09)*invDet;
    result.m2 = (a31*b05 - a32*b04 + a33*b03)*invDet;
    result.m3 = (-a21*b05 + a22*b04 - a23*b03)*invDet;
    result.m4 = (-a10*b11 + a12*b08 - a13*b07)*invDet;
    result.m5 = (a00*b11 - a02*b08 + a03*b07)*invDet;
    result.m6 = (-a30*b05 + a32*b02 - a33*b01)*invDet;
    result.m7 = (a20*b05 - a22*b02 + a23*b01)*invDet;
    result.m8 = (a10*b10 - a11*b08 + a13*b06)*invDet;
    result.m9 = (-a00*b10 + a01*b08 - a03*b06)*invDet;
    result.m10 = (a30*b04 - a31*b02 + a33*b00)*invDet;
    result.m11 = (-a20*b04 + a21*b02 - a23*b00)*invDet;
    result.m12 = (-a10*b09 + a11*b07 - a12*b06)*invDet;
    result.m13 = (a00*b09 - a01*b07 + a02*b06)*invDet;
    result.m14 = (-a30*b03 + a31*b01 - a32*b00)*invDet;
    result.m15 = (a20*b03 - a21*b01 + a22*b00)*invDet;

    return result;
  }

  M add(M o) => RaylibMatrixFactories.createFactory(
    m0+o.m0, m1+o.m1, m2+o.m2, m3+o.m3,
    m4+o.m4, m5+o.m5, m6+o.m6, m7+o.m7,
    m8+o.m8, m9+o.m9, m10+o.m10, m11+o.m11,
    m12+o.m12, m13+o.m13, m14+o.m14, m15+o.m15,
  ) as M;

  M sub(M o) => RaylibMatrixFactories.createFactory(
    m0-o.m0, m1-o.m1, m2-o.m2, m3-o.m3,
    m4-o.m4, m5-o.m5, m6-o.m6, m7-o.m7,
    m8-o.m8, m9-o.m9, m10-o.m10, m11-o.m11,
    m12-o.m12, m13-o.m13, m14-o.m14, m15-o.m15,
  ) as M;

  M mul(M o) => RaylibMatrixFactories.createFactory(
    m0*o.m0 + m1*o.m4 + m2*o.m8 + m3*o.m12,
    m0*o.m1 + m1*o.m5 + m2*o.m9 + m3*o.m13,
    m0*o.m2 + m1*o.m6 + m2*o.m10 + m3*o.m14,
    m0*o.m3 + m1*o.m7 + m2*o.m11 + m3*o.m15,
    m4*o.m0 + m5*o.m4 + m6*o.m8 + m7*o.m12,
    m4*o.m1 + m5*o.m5 + m6*o.m9 + m7*o.m13,
    m4*o.m2 + m5*o.m6 + m6*o.m10 + m7*o.m14,
    m4*o.m3 + m5*o.m7 + m6*o.m11 + m7*o.m15,
    m8*o.m0 + m9*o.m4 + m10*o.m8 + m11*o.m12,
    m8*o.m1 + m9*o.m5 + m10*o.m9 + m11*o.m13,
    m8*o.m2 + m9*o.m6 + m10*o.m10 + m11*o.m14,
    m8*o.m3 + m9*o.m7 + m10*o.m11 + m11*o.m15,
    m12*o.m0 + m13*o.m4 + m14*o.m8 + m15*o.m12,
    m12*o.m1 + m13*o.m5 + m14*o.m9 + m15*o.m13,
    m12*o.m2 + m13*o.m6 + m14*o.m10 + m15*o.m14,
    m12*o.m3 + m13*o.m7 + m14*o.m11 + m15*o.m15,
  ) as M;

  double determinant() =>
     m12*m9*m6*m3 -  m8*m13*m6*m3 - m12*m5*m10*m3 + m4*m13*m10*m3 +
     m8*m5*m14*m3 -  m4*m9*m14*m3 -  m12*m9*m2*m7 +  m8*m13*m2*m7 +
    m12*m1*m10*m7 - m0*m13*m10*m7 -  m8*m1*m14*m7 +  m0*m9*m14*m7 +
    m12*m5*m2*m11 - m4*m13*m2*m11 - m12*m1*m6*m11 + m0*m13*m6*m11 +
    m4*m1*m14*m11 - m0*m5*m14*m11 -  m8*m5*m2*m15 +  m4*m9*m2*m15 +
     m8*m1*m6*m15 -  m0*m9*m6*m15 - m4*m1*m10*m15 + m0*m5*m10*m15;

  double trace() => m0 + m5 + m10 + m15;

  (V3 translation, Q rotation, V3 scale) decompose() {
    late V3 translation;
    late Q rotation;
    late V3 scale;

    // Extract translation.
    translation = RaylibVector3Factories.createFactory(m12, m13, m14) as V3;

    // Extract upper-left for determinant computation
    final a = m0;
    final b = m4;
    final c = m8;
    final d = m1;
    final e = m5;
    final f = m9;
    final g = m2;
    final h = m6;
    final i = m10;
    final A = e*i - f*h;
    final B = f*g - d*i;
    final C = d*h - e*g;

    // Extract scale
    final det = a*A + b*B + c*C;
    V3 abc = RaylibVector3Factories.createFactory(a, b, c) as V3;
    V3 def = RaylibVector3Factories.createFactory(d, e, f) as V3;
    V3 ghi = RaylibVector3Factories.createFactory(g, h, i) as V3;

    V3 s = RaylibVector3Factories.createFactory(abc.length, def.length, ghi.length) as V3;
    if (det < 0) s = s.negate();
    scale = s;

    // Remove scale from the matrix if it is not close to zero
    M clone = this.clone();
    if (!RaylibFunctions.FloatEquals(det, 0)) {
      clone.m0 /= s.x;
      clone.m4 /= s.x;
      clone.m8 /= s.x;
      clone.m1 /= s.y;
      clone.m5 /= s.y;
      clone.m9 /= s.y;
      clone.m2 /= s.z;
      clone.m6 /= s.z;
      clone.m10 /= s.z;

      // Extract rotation
      rotation = RaylibQuaternionFactories.fromMatrix(clone) as Q;
    } else {
      // Set to identity if close to zero
      rotation = RaylibQuaternionFactories.identity() as Q;
    }

    return (translation, rotation, scale);
  }

  List<double> toArray() => [
    m0, m1, m2, m3,
    m4, m5, m6, m7,
    m8, m9, m10, m11,
    m12, m13, m14, m15
  ];

  @override
  String signature() => '$structName(${toArray().map((x) => x.f1).join(', ')})';
}