import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:internship_app/core/const/constanst.dart';

import 'package:internship_app/core/utils/token_manager.dart';
import 'package:internship_app/feature/Task/data/model/task_model.dart';

class TaskRepository {
  final String baseUrl = AppConstants.baseUrl;

  final TokenManager _tokenManager;

  TaskRepository(this._tokenManager);

  Future<TaskModel?> create(
    int locationId,
    String namaTask,
    String keterangan,
  ) async {
    try {
      final token = await _tokenManager.getToken();
      log('Token: $token');

      final uri = Uri.parse('$baseUrl/task');
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
        final body = jsonDecode(response.body);
        final isi = body['data'];

        return TaskModel.fromJson(isi);
      } else {
        final error = jsonDecode(response.body);
        log('Gagal simpan: $error', name: 'TaskRepository');
        throw Exception(error['message'] ?? 'Gagal menyimpan data task.');
      }
    } catch (e, stackTrace) {
      log('Terjadi kesalahan saat menyimpan data task: $e',
          name: 'LogbookRepository');
      log('StackTrace: $stackTrace', name: 'LogbookRepository');
      rethrow;
    }
  }

  // Future<String> create(TaskData task) async {
  //   try {
  //     final token = await _tokenManager.getToken();
  //     log('Token: $token');

  //     final uri = Uri.parse('$baseUrl/Task');
  //     final request = http.MultipartRequest('POST', uri)
  //       ..headers.addAll({
  //         'Authorization': 'Bearer $token',
  //       })
  //       ..fields['mentor_id'] = Task.mentorId.toString()
  //       ..fields['permasalahan'] = Task.permasalahan
  //       ..fields['solusi'] = Task.solusi
  //       ..fields['nama_kegiatan'] = Task.namaKegiatan;

  //     if (Task.foto != null) {
  //       final file = await http.MultipartFile.fromPath(
  //         'foto',
  //         Task.foto!.path,
  //         contentType: MediaType('image',
  //             'jpeg'), // atau gunakan package mime untuk deteksi otomatis
  //       );
  //       request.files.add(file);
  //     }

  //     final streamedResponse = await request.send();
  //     final response = await http.Response.fromStream(streamedResponse);

  //     log('Status Code: ${response.statusCode}');
  //     log('Response Body: ${response.body}');

  //     if (response.statusCode == 201) {
  //       return 'sukses';
  //     } else {
  //       final error = jsonDecode(response.body);
  //       log('Gagal simpan: $error', name: 'TaskRepository');
  //       throw Exception(error['message'] ?? 'Gagal menyimpan data Task.');
  //     }
  //   } catch (e, stackTrace) {
  //     log('Terjadi kesalahan saat menyimpan data Task: $e',
  //         name: 'TaskRepository');
  //     log('StackTrace: $stackTrace', name: 'TaskRepository');
  //     rethrow;
  //   }
  // }

  Future<List<TaskModel>> getCurrentTask() async {
    try {
      final token = await _tokenManager.getToken();

      if (token == null) {
        throw Exception('Token tidak tersedia');
      }

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

        // Ensure 'data' is a list
        final List<dynamic> taskList = body['data'];
        log('Task List: $taskList');

        if (taskList.isNotEmpty) {
          // Map over the Task list to create a List<Task> from the data
          return taskList.map((taskJson) {
            return TaskModel.fromJson(
                taskJson); // Create Task object for each item
          }).toList();
        } else {
          throw Exception('Data Task tidak ditemukan.');
        }
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
