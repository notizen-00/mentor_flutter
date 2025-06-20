// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tool_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ToolModel _$ToolModelFromJson(Map<String, dynamic> json) {
  return _ToolModel.fromJson(json);
}

/// @nodoc
mixin _$ToolModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'nama_alat')
  String get namaAlat => throw _privateConstructorUsedError;
  String get keterangan => throw _privateConstructorUsedError;
  int get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'foto_alat')
  String? get fotoAlat => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String get updatedAt => throw _privateConstructorUsedError;
  int get qty => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ToolModelCopyWith<ToolModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToolModelCopyWith<$Res> {
  factory $ToolModelCopyWith(ToolModel value, $Res Function(ToolModel) then) =
      _$ToolModelCopyWithImpl<$Res, ToolModel>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'nama_alat') String namaAlat,
      String keterangan,
      int status,
      @JsonKey(name: 'foto_alat') String? fotoAlat,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      int qty});
}

/// @nodoc
class _$ToolModelCopyWithImpl<$Res, $Val extends ToolModel>
    implements $ToolModelCopyWith<$Res> {
  _$ToolModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? namaAlat = null,
    Object? keterangan = null,
    Object? status = null,
    Object? fotoAlat = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? qty = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      namaAlat: null == namaAlat
          ? _value.namaAlat
          : namaAlat // ignore: cast_nullable_to_non_nullable
              as String,
      keterangan: null == keterangan
          ? _value.keterangan
          : keterangan // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      fotoAlat: freezed == fotoAlat
          ? _value.fotoAlat
          : fotoAlat // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ToolModelImplCopyWith<$Res>
    implements $ToolModelCopyWith<$Res> {
  factory _$$ToolModelImplCopyWith(
          _$ToolModelImpl value, $Res Function(_$ToolModelImpl) then) =
      __$$ToolModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'nama_alat') String namaAlat,
      String keterangan,
      int status,
      @JsonKey(name: 'foto_alat') String? fotoAlat,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      int qty});
}

/// @nodoc
class __$$ToolModelImplCopyWithImpl<$Res>
    extends _$ToolModelCopyWithImpl<$Res, _$ToolModelImpl>
    implements _$$ToolModelImplCopyWith<$Res> {
  __$$ToolModelImplCopyWithImpl(
      _$ToolModelImpl _value, $Res Function(_$ToolModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? namaAlat = null,
    Object? keterangan = null,
    Object? status = null,
    Object? fotoAlat = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? qty = null,
  }) {
    return _then(_$ToolModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      namaAlat: null == namaAlat
          ? _value.namaAlat
          : namaAlat // ignore: cast_nullable_to_non_nullable
              as String,
      keterangan: null == keterangan
          ? _value.keterangan
          : keterangan // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      fotoAlat: freezed == fotoAlat
          ? _value.fotoAlat
          : fotoAlat // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ToolModelImpl implements _ToolModel {
  const _$ToolModelImpl(
      {required this.id,
      @JsonKey(name: 'nama_alat') required this.namaAlat,
      required this.keterangan,
      required this.status,
      @JsonKey(name: 'foto_alat') this.fotoAlat,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      required this.qty});

  factory _$ToolModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ToolModelImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'nama_alat')
  final String namaAlat;
  @override
  final String keterangan;
  @override
  final int status;
  @override
  @JsonKey(name: 'foto_alat')
  final String? fotoAlat;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @override
  final int qty;

  @override
  String toString() {
    return 'ToolModel(id: $id, namaAlat: $namaAlat, keterangan: $keterangan, status: $status, fotoAlat: $fotoAlat, createdAt: $createdAt, updatedAt: $updatedAt, qty: $qty)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToolModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.namaAlat, namaAlat) ||
                other.namaAlat == namaAlat) &&
            (identical(other.keterangan, keterangan) ||
                other.keterangan == keterangan) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.fotoAlat, fotoAlat) ||
                other.fotoAlat == fotoAlat) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.qty, qty) || other.qty == qty));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, namaAlat, keterangan, status,
      fotoAlat, createdAt, updatedAt, qty);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToolModelImplCopyWith<_$ToolModelImpl> get copyWith =>
      __$$ToolModelImplCopyWithImpl<_$ToolModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ToolModelImplToJson(
      this,
    );
  }
}

abstract class _ToolModel implements ToolModel {
  const factory _ToolModel(
      {required final int id,
      @JsonKey(name: 'nama_alat') required final String namaAlat,
      required final String keterangan,
      required final int status,
      @JsonKey(name: 'foto_alat') final String? fotoAlat,
      @JsonKey(name: 'created_at') required final String createdAt,
      @JsonKey(name: 'updated_at') required final String updatedAt,
      required final int qty}) = _$ToolModelImpl;

  factory _ToolModel.fromJson(Map<String, dynamic> json) =
      _$ToolModelImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'nama_alat')
  String get namaAlat;
  @override
  String get keterangan;
  @override
  int get status;
  @override
  @JsonKey(name: 'foto_alat')
  String? get fotoAlat;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String get updatedAt;
  @override
  int get qty;
  @override
  @JsonKey(ignore: true)
  _$$ToolModelImplCopyWith<_$ToolModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
