import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class GlobalStorage {
  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  static const _keyValue = "Gtoken";

  static Future saveToken(String token) async {
    await _secureStorage.write(key: _keyValue, value: token);
  }

  static Future<String?> getToken() async {
    String? res = await _secureStorage.read(
      key: _keyValue,
    );
    return res;
  }
}
