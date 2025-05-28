import 'dart:convert';
import 'package:internship_app/feature/Siswa/data/model/siswa_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SiswaManager {
  static const String _tokenKey = 'siswa';

  SiswaManager(SharedPreferences sharedPreferences);

  Future<void> saveSiswa(String siswaJson) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('siswa', siswaJson);
  }

  Future<SiswaModel?> getSiswa() async {
    final prefs = await SharedPreferences.getInstance();
    final siswaJson = prefs.getString('siswa');
    if (siswaJson != null) {
      return SiswaModel.fromJson(jsonDecode(siswaJson));
    }
    return null;
  }

  Future<void> clearSiswa() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }
}
