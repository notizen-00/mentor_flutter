import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

@freezed
class TaskModel with _$TaskModel {
  const factory TaskModel({
    required int id,
    @JsonKey(name: 'mentor_id') required int mentorId,
    @JsonKey(name: 'nama_task') required String namaTask,
    required int status,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'location_id') required int locationId,
    @JsonKey(name: 'task_tool') required List<TaskTool> taskTool,
    @JsonKey(name: 'task_user') List<TaskUser>? taskUser,
    required Mentor mentor,
    required Location location,
  }) = _TaskModel;

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);
}

@freezed
class TaskTool with _$TaskTool {
  const factory TaskTool({
    required int id,
    @JsonKey(name: 'task_id') required int taskId,
    @JsonKey(name: 'tool_id') required int toolId,
    required int status,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'user_id') required int userId,
    required int qty,
    required Tool tool,
  }) = _TaskTool;

  factory TaskTool.fromJson(Map<String, dynamic> json) =>
      _$TaskToolFromJson(json);
}

@freezed
class Tool with _$Tool {
  const factory Tool({
    required int id,
    @JsonKey(name: 'nama_alat') required String namaAlat,
    String? keterangan,
    required int status,
    @JsonKey(name: 'foto_alat') String? fotoAlat,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    int? qty,
  }) = _Tool;

  factory Tool.fromJson(Map<String, dynamic> json) => _$ToolFromJson(json);
}

@freezed
class TaskUser with _$TaskUser {
  const factory TaskUser({
    required int id,
    @JsonKey(name: 'task_id') required int taskId,
    @JsonKey(name: 'user_id') required int userId,
    required int status,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _TaskUser;

  factory TaskUser.fromJson(Map<String, dynamic> json) =>
      _$TaskUserFromJson(json);
}

@freezed
class Mentor with _$Mentor {
  const factory Mentor({
    required int id,
    required String name,
    required String email,
    @JsonKey(name: 'email_verified_at') String? emailVerifiedAt,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _Mentor;

  factory Mentor.fromJson(Map<String, dynamic> json) => _$MentorFromJson(json);
}

@freezed
class Location with _$Location {
  const factory Location({
    required int id,
    @JsonKey(name: 'nama_lokasi') required String namaLokasi,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}
