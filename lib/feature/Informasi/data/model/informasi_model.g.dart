// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'informasi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InformasiModelImpl _$$InformasiModelImplFromJson(Map<String, dynamic> json) =>
    _$InformasiModelImpl(
      id: (json['id'] as num).toInt(),
      namaInformasi: json['nama_informasi'] as String,
      jadwalInformasi: json['jadwal_informasi'] as String,
      deskripsi: json['deskripsi'] as String,
      lokasi: json['lokasi'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$InformasiModelImplToJson(
        _$InformasiModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama_informasi': instance.namaInformasi,
      'jadwal_informasi': instance.jadwalInformasi,
      'deskripsi': instance.deskripsi,
      'lokasi': instance.lokasi,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
