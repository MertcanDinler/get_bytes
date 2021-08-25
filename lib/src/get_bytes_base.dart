import 'dart:typed_data';

abstract class GetBytes {
  static final _ = ByteData.view(Uint8List(8).buffer);
  static Endian defaultEndian = Endian.little;
  static void setDefaultEndian(Endian endian) {
    GetBytes.defaultEndian = endian;
  }

  static Uint8List fromInt8(int value, [Endian? endian]) {
    _set(_.setInt8, value, endian);
    return _get(1);
  }

  static Uint8List fromInt16(int value, [Endian? endian]) {
    _set(_.setInt16, value, endian);
    return _get(2);
  }

  static Uint8List fromInt32(int value, [Endian? endian]) {
    _set(_.setInt32, value, endian);
    return _get(4);
  }

  static Uint8List fromInt64(int value, [Endian? endian]) {
    _set(_.setInt64, value, endian);
    return _get(8);
  }

  static Uint8List fromUint8(int value, [Endian? endian]) {
    _set(_.setUint8, value, endian);
    return _get(1);
  }

  static Uint8List fromUint16(int value, [Endian? endian]) {
    _set(_.setUint16, value, endian);
    return _get(2);
  }

  static Uint8List fromUint32(int value, [Endian? endian]) {
    _set(_.setUint32, value, endian);
    return _get(4);
  }

  static Uint8List fromUint64(int value, [Endian? endian]) {
    _set(_.setUint64, value, endian);
    return _get(8);
  }

  static Uint8List fromFloat32(double value, [Endian? endian]) {
    _set(_.setFloat32, value, endian);
    return _get(4);
  }

  static Uint8List fromFloat64(double value, [Endian? endian]) {
    _set(_.setFloat64, value, endian);
    return _get(8);
  }

  static void _set(Function f, dynamic value, [Endian? endian]) {
    if (f == _.setInt8 || f == _.setUint8) {
      f(0, value);
      return;
    }
    f(0, value, endian ?? GetBytes.defaultEndian);
  }

  static Uint8List _get(int length) {
    return _.buffer.asUint8List(0, length);
  }
}

extension GetBytesExtInt on int {
  Uint8List toInt8Bytes() => GetBytes.fromInt8(this);
  Uint8List toInt16Bytes([Endian? endian]) => GetBytes.fromInt16(this, endian);
  Uint8List toInt32Bytes([Endian? endian]) => GetBytes.fromInt64(this, endian);
  Uint8List toInt64Bytes([Endian? endian]) => GetBytes.fromInt64(this, endian);

  Uint8List toUint8Bytes() => GetBytes.fromUint8(this);
  Uint8List toUint16Bytes([Endian? endian]) =>
      GetBytes.fromUint16(this, endian);
  Uint8List toUint32Bytes([Endian? endian]) =>
      GetBytes.fromUint32(this, endian);
  Uint8List toUint64Bytes([Endian? endian]) =>
      GetBytes.fromUint64(this, endian);
}

extension GetBytesExtFloat on double {
  Uint8List toFloat32Bytes([Endian? endian]) =>
      GetBytes.fromFloat32(this, endian);
  Uint8List toFloat64Bytes([Endian? endian]) =>
      GetBytes.fromFloat64(this, endian);
}
