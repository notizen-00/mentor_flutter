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
