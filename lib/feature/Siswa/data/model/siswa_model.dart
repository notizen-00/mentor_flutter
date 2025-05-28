import 'package:freezed_annotation/freezed_annotation.dart';

part 'siswa_model.freezed.dart';
part 'siswa_model.g.dart';

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
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    @JsonKey(name: 'no_hp') required String noHp,
    required UserModel user,
  }) = _SiswaModel;

  factory SiswaModel.fromJson(Map<String, dynamic> json) =>
      _$SiswaModelFromJson(json);
}

@freezed
class SiswaDataModel with _$SiswaDataModel {
  const factory SiswaDataModel({
    required int nisn,
    @JsonKey(name: 'asal_sekolah') required String asalSekolah,
    required String jurusan,
    @JsonKey(name: 'mulai_magang') required String mulaiMagang,
    @JsonKey(name: 'selesai_magang') required String selesaiMagang,
    required String alamat,
    @JsonKey(name: 'no_hp') required String noHp,
  }) = _SiswaDataModel;

  factory SiswaDataModel.fromJson(Map<String, dynamic> json) =>
      _$SiswaDataModelFromJson(json);
}

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required int id,
    required String name,
    required String email,
    String? picture,
    @JsonKey(name: 'email_verified_at') String? emailVerifiedAt,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
