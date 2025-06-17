import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:internship_app/core/const/constanst.dart';
import 'package:internship_app/core/utils/siswa_manager.dart';
import 'package:internship_app/core/utils/token_manager.dart';

import 'package:internship_app/feature/Siswa/data/model/siswa_model.dart';

class SiswaRepository {
  final String baseUrl = AppConstants.baseUrl;
  final SiswaManager _siswaManager;
  final TokenManager _tokenManager;

  SiswaRepository(this._siswaManager, this._tokenManager);

  Future<SiswaModel?> create(SiswaDataModel siswa) async {
    try {
      final param = siswa.toJson();
      log('Request Payload: $param');

      final token = await _tokenManager.getToken();
      log('Token: $token');

      final response = await http.post(
        Uri.parse('$baseUrl/siswa'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(param),
      );

      log('Status Code: ${response.statusCode}');
      log('Response Body: ${response.body}');

      if (response.statusCode == 201) {
        final body = jsonDecode(response.body);
        final siswaModel = SiswaModel.fromJson(body['data']);

        await _siswaManager.saveSiswa(jsonEncode(body['data']));

        final saved = await _siswaManager.getSiswa();
        log('Saved Siswa: $saved');

        return siswaModel;
      } else {
        final error = jsonDecode(response.body);
        log('Gagal simpan: $error', name: 'SiswaRepository');
        throw Exception(error['message'] ?? 'Gagal menyimpan data siswa.');
      }
    } catch (e, stackTrace) {
      log('Terjadi kesalahan saat menyimpan data siswa: $e',
          name: 'SiswaRepository');
      log('StackTrace: $stackTrace', name: 'SiswaRepository');
      rethrow;
    }
  }

  Future<UserModel?> register(
      String email, String password, String name) async {
    final response = await http.post(
      Uri.parse('$baseUrl/Siswa/register'),
      body: {'email': email, 'password': password, 'name': name},
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final user = UserModel.fromJson(body['user']);

      return user;
    } else {
      final error = jsonDecode(response.body);
      log('Login gagal: ${error['message']}', name: 'SiswaRepository');
      throw Exception('Login gagal: ${error['message']}');
    }
  }

  Future<List<SiswaModel>?> getListSiswa() async {
    final token = await _tokenManager.getToken();
    if (token == null) {
      throw Exception('Token tidak tersedia');
    }

    final response = await http.get(
      Uri.parse('$baseUrl/siswa'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body) as Map<String, dynamic>;

      // Pastikan formatnya { status: 'success', data: [ ... ] }
      if (body['status'] == 'success' && body['data'] is List) {
        final List<dynamic> dataList = body['data'];

        final List<SiswaModel> siswaList = dataList
            .map((item) => SiswaModel.fromJson(item as Map<String, dynamic>))
            .toList();

        return siswaList;
      } else {
        return null;
      }
    } else {
      final errorBody = jsonDecode(response.body) as Map<String, dynamic>;
      final message = errorBody['message'] ?? 'Gagal memuat data siswa.';
      log('Gagal memuat data siswa: $message', name: 'SiswaRepository');
      return null;
    }
  }

  Future<UserModel?> getCurrentUser() async {
    final token = await _tokenManager.getToken();
    if (token == null) {
      throw Exception('Token tidak tersedia');
    }

    final response = await http.get(
      Uri.parse('$baseUrl/user'),
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body) as Map<String, dynamic>;

      // Pastikan formatnya { status: 'success', data: { ... } }
      if (body['status'] == 'success' && body['user'] is Map<String, dynamic>) {
        final data = body['user'] as Map<String, dynamic>;

        // Simpan ke local storage
        await _siswaManager.saveSiswa(jsonEncode(data));

        // Kembalikan model
        return UserModel.fromJson(data);
      } else {
        return null;
      }
    } else {
      final errorBody = jsonDecode(response.body) as Map<String, dynamic>;
      final message = errorBody['message'] ?? 'Gagal memuat data user.';
      log('Gagal memuat data user: $message', name: 'SiswaRepository');
      return null;
    }
  }
}
