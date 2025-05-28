import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:internship_app/core/const/constanst.dart';
import 'package:internship_app/core/utils/token_manager.dart';

import 'package:internship_app/feature/Informasi/data/model/informasi_model.dart';

class InformasiRepository {
  final String baseUrl = AppConstants.baseUrl;
  final TokenManager _tokenManager;

  InformasiRepository(this._tokenManager);

  Future<List<InformasiModel>> getCurrentInformasi() async {
    try {
      final token = await _tokenManager.getToken();

      if (token == null) {
        throw Exception('Token tidak tersedia');
      }

      final url = Uri.parse('$baseUrl/informasi');
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
        final List<dynamic> informasiList = body['data'];
        log('Informasi List: $informasiList');

        if (informasiList.isNotEmpty) {
          // Map over the Informasi list to create a List<Informasi> from the data
          return informasiList.map((informasiJson) {
            return InformasiModel.fromJson(
                informasiJson); // Create Informasi object for each item
          }).toList();
        } else {
          throw Exception('Data Informasi tidak ditemukan.');
        }
      } else {
        final Map<String, dynamic> body = jsonDecode(response.body);
        final errorMessage =
            body['message'] ?? 'Terjadi kesalahan saat memuat Informasi.';
        throw Exception('Gagal memuat Informasi: $errorMessage');
      }
    } catch (e, stackTrace) {
      log('Terjadi kesalahan saat getCurrentInformasi: $e',
          name: 'InformasiRepository');
      log('StackTrace: $stackTrace');
      rethrow;
    }
  }
}
