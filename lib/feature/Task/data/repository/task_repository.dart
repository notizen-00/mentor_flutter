import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:internship_app/core/const/constanst.dart';

import 'package:internship_app/core/utils/token_manager.dart';
import 'package:internship_app/feature/Task/data/model/task_model.dart'; // pastikan import model ini

class TaskRepository {
  final String baseUrl = AppConstants.baseUrl;

  final TokenManager _tokenManager;

  TaskRepository(this._tokenManager);

  Future<TaskModel?> create(TaskCreateData task) async {
    try {
      final token = await _tokenManager.getToken();
      if (token == null) throw Exception('Token tidak tersedia');
      log('Token: $token');

      final uri = Uri.parse('$baseUrl/task');
      final request = http.MultipartRequest('POST', uri)
        ..headers.addAll({
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        })
        ..fields['location_id'] = task.locationId.toString()
        ..fields['nama_task'] = task.namaTask
        ..fields['keterangan'] = task.keterangan;

      // Kirim tools sebagai array of objects: tools[index][tool_id], tools[index][qty]
      if (task.toolIds != null && task.toolIds!.isNotEmpty) {
        for (var i = 0; i < task.toolIds!.length; i++) {
          request.fields['tools[$i][tool_id]'] = task.toolIds![i].toString();
          // Pastikan toolQuantities ada dan index valid, kalau enggak default ke 1
          final qty =
              (task.toolQuantities != null && task.toolQuantities!.length > i)
                  ? task.toolQuantities![i].toString()
                  : '1';
          request.fields['tools[$i][qty]'] = qty;
        }
      }

      // Kirim progress sebagai array string: progress[index]
      if (task.progressList.isNotEmpty) {
        for (var i = 0; i < task.progressList.length; i++) {
          request.fields['progress[$i]'] = task.progressList[i];
        }
      }

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      log('Status Code: ${response.statusCode}');
      log('Response Body: ${response.body}');

      if (response.statusCode == 201 || response.statusCode == 200) {
        final body = jsonDecode(response.body);
        final isi = body['data'];
        return TaskModel.fromJson(isi);
      } else if (response.statusCode == 422) {
        final error = jsonDecode(response.body);
        log('Gagal simpan: $error', name: 'TaskRepository');
        throw Exception(error['message'] ?? 'Gagal menyimpan data task.');
      }
    } catch (e, stackTrace) {
      log('Terjadi kesalahan saat menyimpan data task: $e',
          name: 'TaskRepository');
      log('StackTrace: $stackTrace', name: 'TaskRepository');
      rethrow;
    }
    return null;
  }

  Future<List<TaskModel>> getCurrentTask() async {
    try {
      final token = await _tokenManager.getToken();
      if (token == null) throw Exception('Token tidak tersedia');

      final url = Uri.parse('$baseUrl/task');
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

        final List<dynamic> taskList = body['data'] ?? [];
        if (taskList.isEmpty) {
          throw Exception('Data Task tidak ditemukan.');
        }

        return taskList
            .map((taskJson) => TaskModel.fromJson(taskJson))
            .toList();
      } else {
        final Map<String, dynamic> body = jsonDecode(response.body);
        final errorMessage =
            body['message'] ?? 'Terjadi kesalahan saat memuat Task.';
        throw Exception('Gagal memuat Task: $errorMessage');
      }
    } catch (e, stackTrace) {
      log('Terjadi kesalahan saat getCurrentTask: $e', name: 'TaskRepository');
      log('StackTrace: $stackTrace');
      rethrow;
    }
  }
}
