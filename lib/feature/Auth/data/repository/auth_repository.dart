import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:internship_app/core/const/constanst.dart';
import 'package:internship_app/core/utils/token_manager.dart';
import 'package:internship_app/feature/Auth/data/model/user_model.dart';

class AuthRepository {
  final String baseUrl = AppConstants.baseUrl;
  final TokenManager _tokenManager;

  AuthRepository(this._tokenManager);

  Future<UserModel?> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/login-mentor'),
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final token = body['token'];
      final user = UserModel.fromJson(body['user']);

      log('Token diterima: $token', name: 'AuthRepository');

      await _tokenManager.saveToken(token);

      log('$token');

      return user;
    } else {
      final error = jsonDecode(response.body);
      log('Login gagal: ${error['message']}', name: 'AuthRepository');
      throw Exception('Login gagal: ${error['message']}');
    }
  }

  Future<String> register(String email, String password, String name) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/auth/register'),
        body: {'email': email, 'password': password, 'name': name},
      );

      log('Response Status: ${response.statusCode}');
      log('Response Body: ${response.body}');

      if (response.statusCode == 201) {
        final body = jsonDecode(response.body);
        if (body['status'] == 'success') {
          return 'sukses';
        } else {
          throw Exception(
              'Register gagal: ${body['message'] ?? 'Terjadi kesalahan'}');
        }
      } else {
        final error = jsonDecode(response.body);
        log('Register gagal: ${error['message']}', name: 'AuthRepository');
        throw Exception('Register gagal: ${error['message']}');
      }
    } catch (e) {
      log('Register error: $e', name: 'AuthRepository');
      rethrow;
    }
  }

  Future<UserModel?> getCurrentUser() async {
    final token = await _tokenManager.getToken();

    if (token == null || token.isEmpty) {
      throw Exception('Token tidak tersedia');
    }

    final response = await http.get(
      Uri.parse('$baseUrl/user/me'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return UserModel.fromJson(body['data']);
    } else {
      final error = jsonDecode(response.body);
      log('Gagal memuat data user: ${error['message']}',
          name: 'AuthRepository');
      throw Exception('Gagal memuat data user: ${error['message']}');
    }
  }
}
