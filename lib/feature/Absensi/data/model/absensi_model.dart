import 'package:freezed_annotation/freezed_annotation.dart';

part 'absensi_model.freezed.dart';
part 'absensi_model.g.dart';

@freezed
class HistoryAbsensiModel with _$HistoryAbsensiModel {
  const factory HistoryAbsensiModel({
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'tanggal') required String tanggal,
    @JsonKey(name: 'waktu') required String waktu,
    @JsonKey(name: 'tipe') required String tipe,
    @JsonKey(name: 'keterangan') String? keterangan,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _HistoryAbsensiModel;

  factory HistoryAbsensiModel.fromJson(Map<String, dynamic> json) =>
      _$HistoryAbsensiModelFromJson(json);
}
