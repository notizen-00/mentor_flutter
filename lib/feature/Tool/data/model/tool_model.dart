import 'package:freezed_annotation/freezed_annotation.dart';

part 'tool_model.freezed.dart';
part 'tool_model.g.dart';

@freezed
class ToolModel with _$ToolModel {
  const factory ToolModel({
    required int id,
    @JsonKey(name: 'nama_alat') required String namaAlat,
    required String keterangan,
    required int status,
    @JsonKey(name: 'foto_alat') String? fotoAlat,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    required int qty,
  }) = _ToolModel;

  factory ToolModel.fromJson(Map<String, dynamic> json) =>
      _$ToolModelFromJson(json);
}

@freezed
class Tool with _$Tool {
  const factory Tool({
    required int id,
    @JsonKey(name: 'nama_alat') required String namaAlat,
    required String keterangan,
    required int status,
    @JsonKey(name: 'foto_alat') required String fotoAlat,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    required int qty,
    @JsonKey(name: 'stock_opname') required List<StockOpname> stockOpname,
  }) = _Tool;

  factory Tool.fromJson(Map<String, dynamic> json) => _$ToolFromJson(json);
}

@freezed
class StockOpname with _$StockOpname {
  const factory StockOpname({
    required int id,
    @JsonKey(name: 'tool_id') required int toolId,
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'type_opname') required String typeOpname,
    @JsonKey(name: 'type_name') required String typeName,
    required int qty,
    required String keterangan,
    required String lokasi,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    required ToolUser user,
  }) = _StockOpname;

  factory StockOpname.fromJson(Map<String, dynamic> json) =>
      _$StockOpnameFromJson(json);
}

@freezed
class ToolUser with _$ToolUser {
  const factory ToolUser({
    required int id,
    required String name,
    required String email,
    @JsonKey(name: 'email_verified_at') DateTime? emailVerifiedAt,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    String? picture,
  }) = _ToolUser;

  factory ToolUser.fromJson(Map<String, dynamic> json) =>
      _$ToolUserFromJson(json);
}
