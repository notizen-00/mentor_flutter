import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:internship_app/feature/Logbook/data/model/logbook_model.dart';
import 'package:internship_app/feature/Tool/data/model/tool_model.dart';

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
    String? keterangan,
    @JsonKey(name: 'task_tool') List<TaskTool>? taskTool,
    @JsonKey(name: 'task_user') List<TaskUser>? taskUser,
    @JsonKey(name: 'task_schema') required List<TaskSchema> taskSchema,
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
    ToolModel? tool,
  }) = _TaskTool;

  factory TaskTool.fromJson(Map<String, dynamic> json) =>
      _$TaskToolFromJson(json);
}

@freezed
class TaskSchema with _$TaskSchema {
  const factory TaskSchema({
    required int id,
    @JsonKey(name: 'task_id') required int taskId,
    @JsonKey(name: 'nama_schema') required String namaSchema,
    required int status,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _TaskSchema;

  factory TaskSchema.fromJson(Map<String, dynamic> json) =>
      _$TaskSchemaFromJson(json);
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
    User? user,
  }) = _TaskUser;

  factory TaskUser.fromJson(Map<String, dynamic> json) =>
      _$TaskUserFromJson(json);
}

@freezed
class TaskCreateData with _$TaskCreateData {
  const factory TaskCreateData({
    required int locationId,
    required String namaTask,
    required String keterangan,
    List<int>? toolIds,
    List<int>? toolQuantities,
    required List<String> progressList,
  }) = _TaskCreateData;

  factory TaskCreateData.fromJson(Map<String, dynamic> json) =>
      _$TaskCreateDataFromJson(json);
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
