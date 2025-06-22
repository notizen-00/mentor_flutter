import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:internship_app/core/const/constanst.dart';
import 'package:internship_app/core/utils/absensi_manager.dart';
import 'package:internship_app/core/utils/token_manager.dart';

import 'package:internship_app/feature/Absensi/data/model/absensi_model.dart';

class AbsensiRepository {
  final String baseUrl = AppConstants.baseUrl;
  final AbsensiManager _absensiManager;
  final TokenManager _tokenManager;

  AbsensiRepository(this._absensiManager, this._tokenManager);

  Future<HistoryAbsensiModel?> checkAbsen(String tipe) async {
    try {
      final token = await _tokenManager.getToken();
      log('Token: $token');

      final response = await http.get(
        Uri.parse('$baseUrl/absen/check?tipe=$tipe'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      final body = jsonDecode(response.body);
      log('Response Body: $body');
      await _absensiManager.getAbsensi();
      if (response.statusCode == 200) {
        if (body is Map<String, dynamic>) {
          final absensiModel = HistoryAbsensiModel.fromJson(body);
          return absensiModel;
        } else {
          throw Exception('Format data tidak valid.');
        }
      } else {
        // Jika error dari server, biasanya bentuknya String
        final message = body is String ? body : body.toString();
        throw Exception(message);
      }
    } catch (e, stackTrace) {
      log('Terjadi kesalahan saat menyimpan data Absensi: $e',
          name: 'AbsensiRepository');
      log('StackTrace: $stackTrace', name: 'AbsensiRepository');
      rethrow;
    }
  }

  Future<HistoryAbsensiModel?> absen(tipe) async {
    try {
      final token = await _tokenManager.getToken();
      log('Token: $token');

      final response =
          await http.post(Uri.parse('$baseUrl/absen/$tipe'), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      });

      log('Status Code: ${response.statusCode}');
      log('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);

        if (body is Map<String, dynamic>) {
          final absensiModel =
              HistoryAbsensiModel.fromJson(body['history_absen']);
          return absensiModel;
        } else {
          return null;
        }
      } else {
        final error = jsonDecode(response.body);
        log('Gagal simpan: $error', name: 'AbsensiRepository');
        // throw Exception(error['message'] ?? 'Gagal menyimpan data Absensi.');
      }
    } catch (e, stackTrace) {
      log('Terjadi kesalahan saat menyimpan data Absensi: $e',
          name: 'AbsensiRepository');
      log('StackTrace: $stackTrace', name: 'AbsensiRepository');
      return null;
    }
    return null;
  }
}
