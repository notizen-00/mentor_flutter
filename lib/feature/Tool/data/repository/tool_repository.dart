import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:internship_app/core/const/constanst.dart';
import 'package:internship_app/core/utils/token_manager.dart';

import 'package:internship_app/feature/Tool/data/model/tool_model.dart';

class ToolRepository {
  final String baseUrl = AppConstants.baseUrl;
  final TokenManager _tokenManager;

  ToolRepository(this._tokenManager);

  Future<String> create(
    int locationId,
    String namaTask,
    String keterangan,
  ) async {
    try {
      final token = await _tokenManager.getToken();
      log('Token: $token');

      final uri = Uri.parse('$baseUrl/tool');
      final request = http.MultipartRequest('POST', uri)
        ..headers.addAll(
            {'Authorization': 'Bearer $token', 'Accept': 'Application/json'})
        ..fields['location_id'] = locationId.toString()
        ..fields['nama_task'] = namaTask
        ..fields['keterangan'] = keterangan;

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      log('Status Code: ${response.statusCode}');
      log('Response Body: ${response.body}');

      if (response.statusCode == 201 || response.statusCode == 200) {
        return 'sukses';
      } else {
        final error = jsonDecode(response.body);
        log('Gagal simpan: $error', name: 'TaskRepository');
        throw Exception(error['message'] ?? 'Gagal menyimpan data task.');
      }
    } catch (e, stackTrace) {
      log('Terjadi kesalahan saat menyimpan data task: $e',
          name: 'ToolRepository');
      log('StackTrace: $stackTrace', name: 'ToolRepository');
      rethrow;
    }
  }

  Future<List<ToolModel>> getCurrentTool() async {
    try {
      final token = await _tokenManager.getToken();

      if (token == null) {
        throw Exception('Token tidak tersedia');
      }

      final url = Uri.parse('$baseUrl/tool');
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
        final List<dynamic> toolList = body['data'];
        log('Tool List: $toolList');

        if (toolList.isNotEmpty) {
          // Map over the Tool list to create a List<Tool> from the data
          return toolList.map((toolJson) {
            return ToolModel.fromJson(
                toolJson); // Create Tool object for each item
          }).toList();
        } else {
          throw Exception('Data Tool tidak ditemukan.');
        }
      } else {
        final Map<String, dynamic> body = jsonDecode(response.body);
        final errorMessage =
            body['message'] ?? 'Terjadi kesalahan saat memuat Tool.';
        throw Exception('Gagal memuat Tool: $errorMessage');
      }
    } catch (e, stackTrace) {
      log('Terjadi kesalahan saat getCurrentTool: $e', name: 'ToolRepository');
      log('StackTrace: $stackTrace');
      rethrow;
    }
  }
}
