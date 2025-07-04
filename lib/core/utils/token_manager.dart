import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class TokenManager {
  static const String _tokenKey = 'auth_token';

  TokenManager(SharedPreferences sharedPreferences);

  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token.toString());
    log('Sukses simpan token');
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    // print(prefs.getString(_tokenKey));
    return prefs.getString(_tokenKey);
  }

  Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }
}
