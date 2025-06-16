import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'logbook_model.freezed.dart';
part 'logbook_model.g.dart';

@freezed
class Logbook with _$Logbook {
  const factory Logbook({
    required int id,
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'mentor_id') required int mentorId,
    @JsonKey(name: 'nama_kegiatan') required String namaKegiatan,
    required String permasalahan,
    required String solusi,
    required String foto,
    required bool status,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    required User user,
    required User mentor,
    @JsonKey(name: 'logbook_verifikasi') LogbookVerifikasi? logbookVerifikasi,
  }) = _Logbook;

  factory Logbook.fromJson(Map<String, dynamic> json) =>
      _$LogbookFromJson(json);
}

@freezed
class LogbookVerifikasi with _$LogbookVerifikasi {
  const factory LogbookVerifikasi({
    required int id,
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'mentor_id') required int mentorId,
    @JsonKey(name: 'logbook_id') required int logbookId,
    required String keterangan,
    required int rating,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    required User user,
    required User mentor,
  }) = _LogbookVerifikasi;

  factory LogbookVerifikasi.fromJson(Map<String, dynamic> json) =>
      _$LogbookVerifikasiFromJson(json);
}

@freezed
class LogbookData with _$LogbookData {
  const factory LogbookData({
    @JsonKey(name: 'mentor_id') required int mentorId,
    required String permasalahan,
    required String solusi,
    @JsonKey(name: 'nama_kegiatan') required String namaKegiatan,

    /// Tidak bisa diserialisasi ke JSON
    @JsonKey(ignore: true) File? foto,
  }) = _LogbookData;

  factory LogbookData.fromJson(Map<String, dynamic> json) =>
      _$LogbookDataFromJson(json);

  /// Secara eksplisit hanya menyertakan field yang bisa diserialisasi
  @override
  Map<String, dynamic> toJson() => {
        'mentor_id': mentorId,
        'permasalahan': permasalahan,
        'solusi': solusi,
        'nama_kegiatan': namaKegiatan,
      };
}

@freezed
class User with _$User {
  const factory User({
    required int id,
    required String name,
    required String email,
    @JsonKey(name: 'email_verified_at') String? emailVerifiedAt,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    String? picture,
    SiswaModel? siswa,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class SiswaModel with _$SiswaModel {
  const factory SiswaModel({
    required int id,
    @JsonKey(name: 'user_id') required int userId,
    required int nisn,
    @JsonKey(name: 'asal_sekolah') required String asalSekolah,
    required String jurusan,
    @JsonKey(name: 'mulai_magang') required String mulaiMagang,
    @JsonKey(name: 'selesai_magang') required String selesaiMagang,
    required String alamat,
    required int status,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    @JsonKey(name: 'no_hp') required String noHp,
  }) = _SiswaModel;

  factory SiswaModel.fromJson(Map<String, dynamic> json) =>
      _$SiswaModelFromJson(json);
}
