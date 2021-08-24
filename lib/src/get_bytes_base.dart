import 'dart:typed_data';

abstract class GetBytes {
  static final _ = ByteData(8);
  static Endian endian = Endian.little;
  static void setEndian(Endian endian) {
    GetBytes.endian = endian;
  }

  static Uint8List fromInt8(int value) {
    _set(_.setInt8, value);
    return _get(1);
  }

  static Uint8List fromInt16(int value) {
    _set(_.setInt16, value);
    return _get(2);
  }

  static Uint8List fromInt32(int value) {
    _set(_.setInt32, value);
    return _get(4);
  }

  static Uint8List fromInt64(int value) {
    _set(_.setInt64, value);
    return _get(8);
  }

  static Uint8List fromUint8(int value) {
    _set(_.setUint8, value);
    return _get(1);
  }

  static Uint8List fromUint16(int value) {
    _set(_.setUint16, value);
    return _get(2);
  }

  static Uint8List fromUint32(int value) {
    _set(_.setUint32, value);
    return _get(4);
  }

  static Uint8List fromUint64(int value) {
    _set(_.setUint64, value);
    return _get(8);
  }

  static Uint8List fromFloat32(double value) {
    _set(_.setFloat32, value);
    return _get(4);
  }

  static Uint8List fromFloat64(double value) {
    _set(_.setFloat64, value);
    return _get(8);
  }

  static void _set(Function f, dynamic value) {
    if (f == _.setInt8 || f == _.setUint8) {
      f(0, value);
      return;
    }
    f(0, value, endian);
  }

  static Uint8List _get(int length) {
    return _.buffer.asUint8List(0, length);
  }
}
