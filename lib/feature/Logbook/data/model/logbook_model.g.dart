// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logbook_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LogbookImpl _$$LogbookImplFromJson(Map<String, dynamic> json) =>
    _$LogbookImpl(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      mentorId: (json['mentor_id'] as num).toInt(),
      namaKegiatan: json['nama_kegiatan'] as String,
      permasalahan: json['permasalahan'] as String,
      solusi: json['solusi'] as String,
      foto: json['foto'] as String,
      status: json['status'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      mentor: User.fromJson(json['mentor'] as Map<String, dynamic>),
      logbookVerifikasi: json['logbook_verifikasi'] == null
          ? null
          : LogbookVerifikasi.fromJson(
              json['logbook_verifikasi'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LogbookImplToJson(_$LogbookImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'mentor_id': instance.mentorId,
      'nama_kegiatan': instance.namaKegiatan,
      'permasalahan': instance.permasalahan,
      'solusi': instance.solusi,
      'foto': instance.foto,
      'status': instance.status,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'user': instance.user,
      'mentor': instance.mentor,
      'logbook_verifikasi': instance.logbookVerifikasi,
    };

_$LogbookVerifikasiImpl _$$LogbookVerifikasiImplFromJson(
        Map<String, dynamic> json) =>
    _$LogbookVerifikasiImpl(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      mentorId: (json['mentor_id'] as num).toInt(),
      logbookId: (json['logbook_id'] as num).toInt(),
      keterangan: json['keterangan'] as String,
      rating: (json['rating'] as num).toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      mentor: User.fromJson(json['mentor'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LogbookVerifikasiImplToJson(
        _$LogbookVerifikasiImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'mentor_id': instance.mentorId,
      'logbook_id': instance.logbookId,
      'keterangan': instance.keterangan,
      'rating': instance.rating,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'user': instance.user,
      'mentor': instance.mentor,
    };

_$LogbookDataImpl _$$LogbookDataImplFromJson(Map<String, dynamic> json) =>
    _$LogbookDataImpl(
      mentorId: (json['mentor_id'] as num).toInt(),
      permasalahan: json['permasalahan'] as String,
      solusi: json['solusi'] as String,
      namaKegiatan: json['nama_kegiatan'] as String,
    );

Map<String, dynamic> _$$LogbookDataImplToJson(_$LogbookDataImpl instance) =>
    <String, dynamic>{
      'mentor_id': instance.mentorId,
      'permasalahan': instance.permasalahan,
      'solusi': instance.solusi,
      'nama_kegiatan': instance.namaKegiatan,
    };

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
      emailVerifiedAt: json['email_verified_at'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      picture: json['picture'] as String?,
      siswa: json['siswa'] == null
          ? null
          : SiswaModel.fromJson(json['siswa'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'email_verified_at': instance.emailVerifiedAt,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'picture': instance.picture,
      'siswa': instance.siswa,
    };

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
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      noHp: json['no_hp'] as String,
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
    };
