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

_$ToolImpl _$$ToolImplFromJson(Map<String, dynamic> json) => _$ToolImpl(
      id: (json['id'] as num).toInt(),
      namaAlat: json['nama_alat'] as String,
      keterangan: json['keterangan'] as String,
      status: (json['status'] as num).toInt(),
      fotoAlat: json['foto_alat'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      qty: (json['qty'] as num).toInt(),
      stockOpname: (json['stock_opname'] as List<dynamic>)
          .map((e) => StockOpname.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ToolImplToJson(_$ToolImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama_alat': instance.namaAlat,
      'keterangan': instance.keterangan,
      'status': instance.status,
      'foto_alat': instance.fotoAlat,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'qty': instance.qty,
      'stock_opname': instance.stockOpname,
    };

_$StockOpnameImpl _$$StockOpnameImplFromJson(Map<String, dynamic> json) =>
    _$StockOpnameImpl(
      id: (json['id'] as num).toInt(),
      toolId: (json['tool_id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      typeOpname: json['type_opname'] as String,
      typeName: json['type_name'] as String,
      qty: (json['qty'] as num).toInt(),
      keterangan: json['keterangan'] as String,
      lokasi: json['lokasi'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      user: ToolUser.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$StockOpnameImplToJson(_$StockOpnameImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tool_id': instance.toolId,
      'user_id': instance.userId,
      'type_opname': instance.typeOpname,
      'type_name': instance.typeName,
      'qty': instance.qty,
      'keterangan': instance.keterangan,
      'lokasi': instance.lokasi,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'user': instance.user,
    };

_$ToolUserImpl _$$ToolUserImplFromJson(Map<String, dynamic> json) =>
    _$ToolUserImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
      emailVerifiedAt: json['email_verified_at'] == null
          ? null
          : DateTime.parse(json['email_verified_at'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      picture: json['picture'] as String?,
    );

Map<String, dynamic> _$$ToolUserImplToJson(_$ToolUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'email_verified_at': instance.emailVerifiedAt?.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'picture': instance.picture,
    };
