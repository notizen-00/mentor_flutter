// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'informasi_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InformasiModel _$InformasiModelFromJson(Map<String, dynamic> json) {
  return _InformasiModel.fromJson(json);
}

/// @nodoc
mixin _$InformasiModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'nama_informasi')
  String get namaInformasi => throw _privateConstructorUsedError;
  @JsonKey(name: 'jadwal_informasi')
  String get jadwalInformasi => throw _privateConstructorUsedError;
  String get deskripsi => throw _privateConstructorUsedError;
  String get lokasi => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InformasiModelCopyWith<InformasiModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InformasiModelCopyWith<$Res> {
  factory $InformasiModelCopyWith(
          InformasiModel value, $Res Function(InformasiModel) then) =
      _$InformasiModelCopyWithImpl<$Res, InformasiModel>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'nama_informasi') String namaInformasi,
      @JsonKey(name: 'jadwal_informasi') String jadwalInformasi,
      String deskripsi,
      String lokasi,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class _$InformasiModelCopyWithImpl<$Res, $Val extends InformasiModel>
    implements $InformasiModelCopyWith<$Res> {
  _$InformasiModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? namaInformasi = null,
    Object? jadwalInformasi = null,
    Object? deskripsi = null,
    Object? lokasi = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      namaInformasi: null == namaInformasi
          ? _value.namaInformasi
          : namaInformasi // ignore: cast_nullable_to_non_nullable
              as String,
      jadwalInformasi: null == jadwalInformasi
          ? _value.jadwalInformasi
          : jadwalInformasi // ignore: cast_nullable_to_non_nullable
              as String,
      deskripsi: null == deskripsi
          ? _value.deskripsi
          : deskripsi // ignore: cast_nullable_to_non_nullable
              as String,
      lokasi: null == lokasi
          ? _value.lokasi
          : lokasi // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InformasiModelImplCopyWith<$Res>
    implements $InformasiModelCopyWith<$Res> {
  factory _$$InformasiModelImplCopyWith(_$InformasiModelImpl value,
          $Res Function(_$InformasiModelImpl) then) =
      __$$InformasiModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'nama_informasi') String namaInformasi,
      @JsonKey(name: 'jadwal_informasi') String jadwalInformasi,
      String deskripsi,
      String lokasi,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class __$$InformasiModelImplCopyWithImpl<$Res>
    extends _$InformasiModelCopyWithImpl<$Res, _$InformasiModelImpl>
    implements _$$InformasiModelImplCopyWith<$Res> {
  __$$InformasiModelImplCopyWithImpl(
      _$InformasiModelImpl _value, $Res Function(_$InformasiModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? namaInformasi = null,
    Object? jadwalInformasi = null,
    Object? deskripsi = null,
    Object? lokasi = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$InformasiModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      namaInformasi: null == namaInformasi
          ? _value.namaInformasi
          : namaInformasi // ignore: cast_nullable_to_non_nullable
              as String,
      jadwalInformasi: null == jadwalInformasi
          ? _value.jadwalInformasi
          : jadwalInformasi // ignore: cast_nullable_to_non_nullable
              as String,
      deskripsi: null == deskripsi
          ? _value.deskripsi
          : deskripsi // ignore: cast_nullable_to_non_nullable
              as String,
      lokasi: null == lokasi
          ? _value.lokasi
          : lokasi // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InformasiModelImpl implements _InformasiModel {
  const _$InformasiModelImpl(
      {required this.id,
      @JsonKey(name: 'nama_informasi') required this.namaInformasi,
      @JsonKey(name: 'jadwal_informasi') required this.jadwalInformasi,
      required this.deskripsi,
      required this.lokasi,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt});

  factory _$InformasiModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InformasiModelImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'nama_informasi')
  final String namaInformasi;
  @override
  @JsonKey(name: 'jadwal_informasi')
  final String jadwalInformasi;
  @override
  final String deskripsi;
  @override
  final String lokasi;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'InformasiModel(id: $id, namaInformasi: $namaInformasi, jadwalInformasi: $jadwalInformasi, deskripsi: $deskripsi, lokasi: $lokasi, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InformasiModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.namaInformasi, namaInformasi) ||
                other.namaInformasi == namaInformasi) &&
            (identical(other.jadwalInformasi, jadwalInformasi) ||
                other.jadwalInformasi == jadwalInformasi) &&
            (identical(other.deskripsi, deskripsi) ||
                other.deskripsi == deskripsi) &&
            (identical(other.lokasi, lokasi) || other.lokasi == lokasi) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, namaInformasi,
      jadwalInformasi, deskripsi, lokasi, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InformasiModelImplCopyWith<_$InformasiModelImpl> get copyWith =>
      __$$InformasiModelImplCopyWithImpl<_$InformasiModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InformasiModelImplToJson(
      this,
    );
  }
}

abstract class _InformasiModel implements InformasiModel {
  const factory _InformasiModel(
      {required final int id,
      @JsonKey(name: 'nama_informasi') required final String namaInformasi,
      @JsonKey(name: 'jadwal_informasi') required final String jadwalInformasi,
      required final String deskripsi,
      required final String lokasi,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'updated_at')
      required final DateTime updatedAt}) = _$InformasiModelImpl;

  factory _InformasiModel.fromJson(Map<String, dynamic> json) =
      _$InformasiModelImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'nama_informasi')
  String get namaInformasi;
  @override
  @JsonKey(name: 'jadwal_informasi')
  String get jadwalInformasi;
  @override
  String get deskripsi;
  @override
  String get lokasi;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$InformasiModelImplCopyWith<_$InformasiModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
