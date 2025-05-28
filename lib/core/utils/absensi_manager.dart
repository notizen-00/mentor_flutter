import 'dart:convert';
import 'package:internship_app/feature/Absensi/data/model/absensi_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AbsensiManager {
  static const String _tokenKey = 'Absensi';

  AbsensiManager(SharedPreferences sharedPreferences);

  Future<void> saveAbsensi(String absensiJson) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('Absensi', absensiJson);
  }

  Future<HistoryAbsensiModel?> getAbsensi() async {
    final prefs = await SharedPreferences.getInstance();
    final absensiJson = prefs.getString('Absensi');
    if (absensiJson != null) {
      return HistoryAbsensiModel.fromJson(jsonDecode(absensiJson));
    }
    return null;
  }

  Future<void> clearAbsensi() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }
}
