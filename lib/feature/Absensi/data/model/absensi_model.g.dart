// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'absensi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HistoryAbsensiModelImpl _$$HistoryAbsensiModelImplFromJson(
        Map<String, dynamic> json) =>
    _$HistoryAbsensiModelImpl(
      userId: (json['user_id'] as num).toInt(),
      tanggal: json['tanggal'] as String,
      waktu: json['waktu'] as String,
      tipe: json['tipe'] as String,
      keterangan: json['keterangan'] as String?,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$$HistoryAbsensiModelImplToJson(
        _$HistoryAbsensiModelImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'tanggal': instance.tanggal,
      'waktu': instance.waktu,
      'tipe': instance.tipe,
      'keterangan': instance.keterangan,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
