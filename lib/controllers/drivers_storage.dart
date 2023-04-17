import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DStorage {
  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  static const _keyValue = "Dtoken";
  static const _keydata = "Ddata";
  static const _keyComp = "Dcomplete";
  static const _keyStatus = "401";
  static const _keyOtp = "4080";
  static Future clear(String token) async {
    await _secureStorage.deleteAll();
  }

  static Future saveDriverToken(String token) async {
    await _secureStorage.write(key: _keyValue, value: token);
  }

  static Future<String> getDriverToken() async {
    String? res = await _secureStorage.read(
      key: _keyValue,
    );
    return res!;
  }

  static Future saveDriverData(String data) async {
    await _secureStorage.write(key: _keydata, value: data);
  }

  static Future<String?> getDriverData() async {
    String? res = await _secureStorage.read(
      key: _keydata,
    );
    return res;
  }

  static Future saveCompleteData(String data) async {
    await _secureStorage.write(key: _keyComp, value: data);
  }

  static Future<String?> getCompleteData() async {
    String? res = await _secureStorage.read(
      key: _keyComp,
    );
    return res;
  }

  static Future saveDriverStatusCode(String statusCode) async {
    await _secureStorage.write(key: _keyStatus, value: statusCode);
  }

  static Future<String> getDriverStatusCode() async {
    String? res = await _secureStorage.read(
      key: _keyStatus,
    );
    return res!;
  }

  static Future saveDriverOtp(String token) async {
    await _secureStorage.write(key: _keyOtp, value: token);
  }

  static Future<String> getDriverOtp() async {
    String? res = await _secureStorage.read(
      key: _keyOtp,
    );
    return res!;
  }
}
