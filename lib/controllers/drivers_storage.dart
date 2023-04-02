import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DStorage {
  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  static const _keyValue = "token";
  static const _keydata = "data";
  static const _keyStatus = "401";
  static const _keyOtp = "4010";

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

  static Future<String> getDriverData() async {
    String? res = await _secureStorage.read(
      key: _keydata,
    );
    return res!;
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
