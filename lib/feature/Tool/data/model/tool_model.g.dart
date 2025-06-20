// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tool_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ToolModelImpl _$$ToolModelImplFromJson(Map<String, dynamic> json) =>
    _$ToolModelImpl(
      id: (json['id'] as num).toInt(),
      namaAlat: json['nama_alat'] as String,
      keterangan: json['keterangan'] as String,
      status: (json['status'] as num).toInt(),
      fotoAlat: json['foto_alat'] as String?,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      qty: (json['qty'] as num).toInt(),
    );

Map<String, dynamic> _$$ToolModelImplToJson(_$ToolModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama_alat': instance.namaAlat,
      'keterangan': instance.keterangan,
      'status': instance.status,
      'foto_alat': instance.fotoAlat,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'qty': instance.qty,
    };
