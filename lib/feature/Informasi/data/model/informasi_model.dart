import 'package:freezed_annotation/freezed_annotation.dart';

part 'informasi_model.freezed.dart';
part 'informasi_model.g.dart';

@freezed
class InformasiModel with _$InformasiModel {
  const factory InformasiModel({
    required int id,
    @JsonKey(name: 'nama_informasi') required String namaInformasi,
    @JsonKey(name: 'jadwal_informasi') required String jadwalInformasi,
    required String deskripsi,
    required String lokasi,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _InformasiModel;

  factory InformasiModel.fromJson(Map<String, dynamic> json) =>
      _$InformasiModelFromJson(json);
}
