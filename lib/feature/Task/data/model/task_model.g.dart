// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskModelImpl _$$TaskModelImplFromJson(Map<String, dynamic> json) =>
    _$TaskModelImpl(
      id: (json['id'] as num).toInt(),
      mentorId: (json['mentor_id'] as num).toInt(),
      namaTask: json['nama_task'] as String,
      status: (json['status'] as num).toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      locationId: (json['location_id'] as num).toInt(),
      taskTool: (json['task_tool'] as List<dynamic>)
          .map((e) => TaskTool.fromJson(e as Map<String, dynamic>))
          .toList(),
      taskUser: (json['task_user'] as List<dynamic>?)
          ?.map((e) => TaskUser.fromJson(e as Map<String, dynamic>))
          .toList(),
      keterangan: json['keterangan'] as String?,
      mentor: Mentor.fromJson(json['mentor'] as Map<String, dynamic>),
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TaskModelImplToJson(_$TaskModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mentor_id': instance.mentorId,
      'nama_task': instance.namaTask,
      'status': instance.status,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'location_id': instance.locationId,
      'task_tool': instance.taskTool,
      'task_user': instance.taskUser,
      'keterangan': instance.keterangan,
      'mentor': instance.mentor,
      'location': instance.location,
    };

_$TaskToolImpl _$$TaskToolImplFromJson(Map<String, dynamic> json) =>
    _$TaskToolImpl(
      id: (json['id'] as num).toInt(),
      taskId: (json['task_id'] as num).toInt(),
      toolId: (json['tool_id'] as num).toInt(),
      status: (json['status'] as num).toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      userId: (json['user_id'] as num).toInt(),
      qty: (json['qty'] as num).toInt(),
      tool: Tool.fromJson(json['tool'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TaskToolImplToJson(_$TaskToolImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'task_id': instance.taskId,
      'tool_id': instance.toolId,
      'status': instance.status,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'user_id': instance.userId,
      'qty': instance.qty,
      'tool': instance.tool,
    };

_$ToolImpl _$$ToolImplFromJson(Map<String, dynamic> json) => _$ToolImpl(
      id: (json['id'] as num).toInt(),
      namaAlat: json['nama_alat'] as String,
      keterangan: json['keterangan'] as String?,
      status: (json['status'] as num).toInt(),
      fotoAlat: json['foto_alat'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      qty: (json['qty'] as num?)?.toInt(),
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
    };

_$TaskUserImpl _$$TaskUserImplFromJson(Map<String, dynamic> json) =>
    _$TaskUserImpl(
      id: (json['id'] as num).toInt(),
      taskId: (json['task_id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      status: (json['status'] as num).toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TaskUserImplToJson(_$TaskUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'task_id': instance.taskId,
      'user_id': instance.userId,
      'status': instance.status,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'user': instance.user,
    };

_$MentorImpl _$$MentorImplFromJson(Map<String, dynamic> json) => _$MentorImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
      emailVerifiedAt: json['email_verified_at'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$MentorImplToJson(_$MentorImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'email_verified_at': instance.emailVerifiedAt,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };

_$LocationImpl _$$LocationImplFromJson(Map<String, dynamic> json) =>
    _$LocationImpl(
      id: (json['id'] as num).toInt(),
      namaLokasi: json['nama_lokasi'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$LocationImplToJson(_$LocationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nama_lokasi': instance.namaLokasi,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
