// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'siswa_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SiswaModelImpl _$$SiswaModelImplFromJson(Map<String, dynamic> json) =>
    _$SiswaModelImpl(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      nisn: (json['nisn'] as num).toInt(),
      asalSekolah: json['asal_sekolah'] as String,
      jurusan: json['jurusan'] as String,
      mulaiMagang: json['mulai_magang'] as String,
      selesaiMagang: json['selesai_magang'] as String,
      alamat: json['alamat'] as String,
      status: (json['status'] as num).toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      noHp: json['no_hp'] as String,
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SiswaModelImplToJson(_$SiswaModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'nisn': instance.nisn,
      'asal_sekolah': instance.asalSekolah,
      'jurusan': instance.jurusan,
      'mulai_magang': instance.mulaiMagang,
      'selesai_magang': instance.selesaiMagang,
      'alamat': instance.alamat,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'no_hp': instance.noHp,
      'user': instance.user,
    };

_$SiswaDataModelImpl _$$SiswaDataModelImplFromJson(Map<String, dynamic> json) =>
    _$SiswaDataModelImpl(
      nisn: (json['nisn'] as num).toInt(),
      asalSekolah: json['asal_sekolah'] as String,
      jurusan: json['jurusan'] as String,
      mulaiMagang: json['mulai_magang'] as String,
      selesaiMagang: json['selesai_magang'] as String,
      alamat: json['alamat'] as String,
      noHp: json['no_hp'] as String,
    );

Map<String, dynamic> _$$SiswaDataModelImplToJson(
        _$SiswaDataModelImpl instance) =>
    <String, dynamic>{
      'nisn': instance.nisn,
      'asal_sekolah': instance.asalSekolah,
      'jurusan': instance.jurusan,
      'mulai_magang': instance.mulaiMagang,
      'selesai_magang': instance.selesaiMagang,
      'alamat': instance.alamat,
      'no_hp': instance.noHp,
    };

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
      picture: json['picture'] as String?,
      emailVerifiedAt: json['email_verified_at'] as String?,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'picture': instance.picture,
      'email_verified_at': instance.emailVerifiedAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
