import 'dart:convert';
import 'package:internship_app/feature/Logbook/data/model/logbook_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogbookManager {
  static const String _tokenKey = 'Logbook';

  LogbookManager(SharedPreferences sharedPreferences);

  Future<void> saveLogbook(String logbookJson) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('Logbook', logbookJson);
  }

  Future<Logbook?> getLogbook() async {
    final prefs = await SharedPreferences.getInstance();
    final logbookJson = prefs.getString('Logbook');
    if (logbookJson != null) {
      return Logbook.fromJson(jsonDecode(logbookJson));
    }
    return null;
  }

  Future<void> clearLogbook() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }
}
