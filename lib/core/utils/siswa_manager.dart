import 'dart:convert';
import 'dart:developer';
import 'package:internship_app/feature/Siswa/data/model/siswa_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SiswaManager {
  static const String _tokenKey = 'siswa';

  SiswaManager(SharedPreferences sharedPreferences);

  Future<void> saveSiswa(String siswaJson) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, siswaJson);
    log('[SiswaManager] Siswa saved: $siswaJson');
  }

  Future<UserModel?> getSiswa() async {
    final prefs = await SharedPreferences.getInstance();
    final siswaJson = prefs.getString(_tokenKey);
    log('[SiswaManager] Siswa retrieved: $siswaJson');

    if (siswaJson != null) {
      try {
        final user = UserModel.fromJson(jsonDecode(siswaJson));
        log('[SiswaManager] Parsed user: $user');
        return user;
      } catch (e) {
        log('[SiswaManager] Error decoding user: $e');
      }
    }
    return null;
  }

  Future<void> clearSiswa() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }
}
