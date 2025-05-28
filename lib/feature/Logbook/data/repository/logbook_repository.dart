import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:internship_app/core/const/constanst.dart';
import 'package:internship_app/core/utils/logbook_manager.dart';
import 'package:internship_app/core/utils/token_manager.dart';

import 'package:internship_app/feature/Logbook/data/model/logbook_model.dart';

class LogbookRepository {
  final String baseUrl = AppConstants.baseUrl;
  final LogbookManager _logbookManager;
  final TokenManager _tokenManager;

  LogbookRepository(this._logbookManager, this._tokenManager);

  Future<String> create(LogbookData logbook) async {
    try {
      final token = await _tokenManager.getToken();
      log('Token: $token');

      final uri = Uri.parse('$baseUrl/logbook');
      final request = http.MultipartRequest('POST', uri)
        ..headers.addAll({
          'Authorization': 'Bearer $token',
        })
        ..fields['mentor_id'] = logbook.mentorId.toString()
        ..fields['permasalahan'] = logbook.permasalahan
        ..fields['solusi'] = logbook.solusi
        ..fields['nama_kegiatan'] = logbook.namaKegiatan;

      if (logbook.foto != null) {
        final file = await http.MultipartFile.fromPath(
          'foto',
          logbook.foto!.path,
          contentType: MediaType('image',
              'jpeg'), // atau gunakan package mime untuk deteksi otomatis
        );
        request.files.add(file);
      }

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      log('Status Code: ${response.statusCode}');
      log('Response Body: ${response.body}');

      if (response.statusCode == 201) {
        final saved = await _logbookManager.getLogbook();
        log('Saved Logbook: $saved');

        return 'sukses';
      } else {
        final error = jsonDecode(response.body);
        log('Gagal simpan: $error', name: 'LogbookRepository');
        throw Exception(error['message'] ?? 'Gagal menyimpan data Logbook.');
      }
    } catch (e, stackTrace) {
      log('Terjadi kesalahan saat menyimpan data Logbook: $e',
          name: 'LogbookRepository');
      log('StackTrace: $stackTrace', name: 'LogbookRepository');
      rethrow;
    }
  }

  Future<List<Logbook>> getCurrentLogbook() async {
    try {
      final token = await _tokenManager.getToken();

      if (token == null) {
        throw Exception('Token tidak tersedia');
      }

      final url = Uri.parse('$baseUrl/logbook');
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );

      log('GET $url');
      log('Status Code: ${response.statusCode}');
      log('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> body = jsonDecode(response.body);

        // Ensure 'data' is a list
        final List<dynamic> logbookList = body['data'];
        log('Logbook List: $logbookList');

        if (logbookList.isNotEmpty) {
          // Map over the logbook list to create a List<Logbook> from the data
          return logbookList.map((logbookJson) {
            return Logbook.fromJson(
                logbookJson); // Create Logbook object for each item
          }).toList();
        } else {
          throw Exception('Data logbook tidak ditemukan.');
        }
      } else {
        final Map<String, dynamic> body = jsonDecode(response.body);
        final errorMessage =
            body['message'] ?? 'Terjadi kesalahan saat memuat logbook.';
        throw Exception('Gagal memuat logbook: $errorMessage');
      }
    } catch (e, stackTrace) {
      log('Terjadi kesalahan saat getCurrentLogbook: $e',
          name: 'LogbookRepository');
      log('StackTrace: $stackTrace');
      rethrow;
    }
  }
}
