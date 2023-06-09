import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage {
  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  static const _keyValue = "Ctoken";
  static const _keydata = "Cdata";
  static const _keyname = "Cname";
  static const _keyStatus = "401";
  static const _keyOtp = "4001";

  static Future CustomerlogOut() async {
    await _secureStorage.delete(key: _keydata);
    await _secureStorage.delete(key: _keyname);
  }

  static Future saveToken(String token) async {
    await _secureStorage.write(key: _keyValue, value: token);
  }

  static Future<String?> getToken() async {
    String? res = await _secureStorage.read(
      key: _keyValue,
    );
    return res;
  }

  static Future saveData(String response) async {
    await _secureStorage.write(key: _keydata, value: response);
  }

  static Future<String?> getData() async {
    var res = await _secureStorage.read(
      key: _keydata,
    );
    return res;
  }

  static Future savename(String response) async {
    await _secureStorage.write(key: _keyname, value: response);
  }

  static Future<String?> getname() async {
    var res = await _secureStorage.read(
      key: _keyname,
    );
    return res;
  }

  static Future saveStatusCode(String statusCode) async {
    await _secureStorage.write(key: _keyStatus, value: statusCode);
  }

  static Future<String> getStatusCode() async {
    String? res = await _secureStorage.read(
      key: _keyStatus,
    );
    return res!;
  }

  static Future saveCustomerOtp(String token) async {
    await _secureStorage.write(key: _keyOtp, value: token);
  }

  static Future<String> getCustomerOtp() async {
    String? res = await _secureStorage.read(
      key: _keyOtp,
    );
    return res!;
  }
}
