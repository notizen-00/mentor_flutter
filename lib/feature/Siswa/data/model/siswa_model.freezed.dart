// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'siswa_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SiswaModel _$SiswaModelFromJson(Map<String, dynamic> json) {
  return _SiswaModel.fromJson(json);
}

/// @nodoc
mixin _$SiswaModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  int get nisn => throw _privateConstructorUsedError;
  @JsonKey(name: 'asal_sekolah')
  String get asalSekolah => throw _privateConstructorUsedError;
  String get jurusan => throw _privateConstructorUsedError;
  @JsonKey(name: 'mulai_magang')
  String get mulaiMagang => throw _privateConstructorUsedError;
  @JsonKey(name: 'selesai_magang')
  String get selesaiMagang => throw _privateConstructorUsedError;
  String get alamat => throw _privateConstructorUsedError;
  int get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'no_hp')
  String get noHp => throw _privateConstructorUsedError;
  UserModel get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SiswaModelCopyWith<SiswaModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SiswaModelCopyWith<$Res> {
  factory $SiswaModelCopyWith(
          SiswaModel value, $Res Function(SiswaModel) then) =
      _$SiswaModelCopyWithImpl<$Res, SiswaModel>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'user_id') int userId,
      int nisn,
      @JsonKey(name: 'asal_sekolah') String asalSekolah,
      String jurusan,
      @JsonKey(name: 'mulai_magang') String mulaiMagang,
      @JsonKey(name: 'selesai_magang') String selesaiMagang,
      String alamat,
      int status,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      @JsonKey(name: 'no_hp') String noHp,
      UserModel user});

  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class _$SiswaModelCopyWithImpl<$Res, $Val extends SiswaModel>
    implements $SiswaModelCopyWith<$Res> {
  _$SiswaModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? nisn = null,
    Object? asalSekolah = null,
    Object? jurusan = null,
    Object? mulaiMagang = null,
    Object? selesaiMagang = null,
    Object? alamat = null,
    Object? status = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? noHp = null,
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      nisn: null == nisn
          ? _value.nisn
          : nisn // ignore: cast_nullable_to_non_nullable
              as int,
      asalSekolah: null == asalSekolah
          ? _value.asalSekolah
          : asalSekolah // ignore: cast_nullable_to_non_nullable
              as String,
      jurusan: null == jurusan
          ? _value.jurusan
          : jurusan // ignore: cast_nullable_to_non_nullable
              as String,
      mulaiMagang: null == mulaiMagang
          ? _value.mulaiMagang
          : mulaiMagang // ignore: cast_nullable_to_non_nullable
              as String,
      selesaiMagang: null == selesaiMagang
          ? _value.selesaiMagang
          : selesaiMagang // ignore: cast_nullable_to_non_nullable
              as String,
      alamat: null == alamat
          ? _value.alamat
          : alamat // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      noHp: null == noHp
          ? _value.noHp
          : noHp // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get user {
    return $UserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SiswaModelImplCopyWith<$Res>
    implements $SiswaModelCopyWith<$Res> {
  factory _$$SiswaModelImplCopyWith(
          _$SiswaModelImpl value, $Res Function(_$SiswaModelImpl) then) =
      __$$SiswaModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'user_id') int userId,
      int nisn,
      @JsonKey(name: 'asal_sekolah') String asalSekolah,
      String jurusan,
      @JsonKey(name: 'mulai_magang') String mulaiMagang,
      @JsonKey(name: 'selesai_magang') String selesaiMagang,
      String alamat,
      int status,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      @JsonKey(name: 'no_hp') String noHp,
      UserModel user});

  @override
  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$$SiswaModelImplCopyWithImpl<$Res>
    extends _$SiswaModelCopyWithImpl<$Res, _$SiswaModelImpl>
    implements _$$SiswaModelImplCopyWith<$Res> {
  __$$SiswaModelImplCopyWithImpl(
      _$SiswaModelImpl _value, $Res Function(_$SiswaModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? nisn = null,
    Object? asalSekolah = null,
    Object? jurusan = null,
    Object? mulaiMagang = null,
    Object? selesaiMagang = null,
    Object? alamat = null,
    Object? status = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? noHp = null,
    Object? user = null,
  }) {
    return _then(_$SiswaModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      nisn: null == nisn
          ? _value.nisn
          : nisn // ignore: cast_nullable_to_non_nullable
              as int,
      asalSekolah: null == asalSekolah
          ? _value.asalSekolah
          : asalSekolah // ignore: cast_nullable_to_non_nullable
              as String,
      jurusan: null == jurusan
          ? _value.jurusan
          : jurusan // ignore: cast_nullable_to_non_nullable
              as String,
      mulaiMagang: null == mulaiMagang
          ? _value.mulaiMagang
          : mulaiMagang // ignore: cast_nullable_to_non_nullable
              as String,
      selesaiMagang: null == selesaiMagang
          ? _value.selesaiMagang
          : selesaiMagang // ignore: cast_nullable_to_non_nullable
              as String,
      alamat: null == alamat
          ? _value.alamat
          : alamat // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      noHp: null == noHp
          ? _value.noHp
          : noHp // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SiswaModelImpl implements _SiswaModel {
  const _$SiswaModelImpl(
      {required this.id,
      @JsonKey(name: 'user_id') required this.userId,
      required this.nisn,
      @JsonKey(name: 'asal_sekolah') required this.asalSekolah,
      required this.jurusan,
      @JsonKey(name: 'mulai_magang') required this.mulaiMagang,
      @JsonKey(name: 'selesai_magang') required this.selesaiMagang,
      required this.alamat,
      required this.status,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      @JsonKey(name: 'no_hp') required this.noHp,
      required this.user});

  factory _$SiswaModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SiswaModelImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  final int nisn;
  @override
  @JsonKey(name: 'asal_sekolah')
  final String asalSekolah;
  @override
  final String jurusan;
  @override
  @JsonKey(name: 'mulai_magang')
  final String mulaiMagang;
  @override
  @JsonKey(name: 'selesai_magang')
  final String selesaiMagang;
  @override
  final String alamat;
  @override
  final int status;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @override
  @JsonKey(name: 'no_hp')
  final String noHp;
  @override
  final UserModel user;

  @override
  String toString() {
    return 'SiswaModel(id: $id, userId: $userId, nisn: $nisn, asalSekolah: $asalSekolah, jurusan: $jurusan, mulaiMagang: $mulaiMagang, selesaiMagang: $selesaiMagang, alamat: $alamat, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, noHp: $noHp, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SiswaModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.nisn, nisn) || other.nisn == nisn) &&
            (identical(other.asalSekolah, asalSekolah) ||
                other.asalSekolah == asalSekolah) &&
            (identical(other.jurusan, jurusan) || other.jurusan == jurusan) &&
            (identical(other.mulaiMagang, mulaiMagang) ||
                other.mulaiMagang == mulaiMagang) &&
            (identical(other.selesaiMagang, selesaiMagang) ||
                other.selesaiMagang == selesaiMagang) &&
            (identical(other.alamat, alamat) || other.alamat == alamat) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.noHp, noHp) || other.noHp == noHp) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      nisn,
      asalSekolah,
      jurusan,
      mulaiMagang,
      selesaiMagang,
      alamat,
      status,
      createdAt,
      updatedAt,
      noHp,
      user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SiswaModelImplCopyWith<_$SiswaModelImpl> get copyWith =>
      __$$SiswaModelImplCopyWithImpl<_$SiswaModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SiswaModelImplToJson(
      this,
    );
  }
}

abstract class _SiswaModel implements SiswaModel {
  const factory _SiswaModel(
      {required final int id,
      @JsonKey(name: 'user_id') required final int userId,
      required final int nisn,
      @JsonKey(name: 'asal_sekolah') required final String asalSekolah,
      required final String jurusan,
      @JsonKey(name: 'mulai_magang') required final String mulaiMagang,
      @JsonKey(name: 'selesai_magang') required final String selesaiMagang,
      required final String alamat,
      required final int status,
      @JsonKey(name: 'created_at') final String? createdAt,
      @JsonKey(name: 'updated_at') final String? updatedAt,
      @JsonKey(name: 'no_hp') required final String noHp,
      required final UserModel user}) = _$SiswaModelImpl;

  factory _SiswaModel.fromJson(Map<String, dynamic> json) =
      _$SiswaModelImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  int get nisn;
  @override
  @JsonKey(name: 'asal_sekolah')
  String get asalSekolah;
  @override
  String get jurusan;
  @override
  @JsonKey(name: 'mulai_magang')
  String get mulaiMagang;
  @override
  @JsonKey(name: 'selesai_magang')
  String get selesaiMagang;
  @override
  String get alamat;
  @override
  int get status;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;
  @override
  @JsonKey(name: 'no_hp')
  String get noHp;
  @override
  UserModel get user;
  @override
  @JsonKey(ignore: true)
  _$$SiswaModelImplCopyWith<_$SiswaModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SiswaDataModel _$SiswaDataModelFromJson(Map<String, dynamic> json) {
  return _SiswaDataModel.fromJson(json);
}

/// @nodoc
mixin _$SiswaDataModel {
  int get nisn => throw _privateConstructorUsedError;
  @JsonKey(name: 'asal_sekolah')
  String get asalSekolah => throw _privateConstructorUsedError;
  String get jurusan => throw _privateConstructorUsedError;
  @JsonKey(name: 'mulai_magang')
  String get mulaiMagang => throw _privateConstructorUsedError;
  @JsonKey(name: 'selesai_magang')
  String get selesaiMagang => throw _privateConstructorUsedError;
  String get alamat => throw _privateConstructorUsedError;
  @JsonKey(name: 'no_hp')
  String get noHp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SiswaDataModelCopyWith<SiswaDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SiswaDataModelCopyWith<$Res> {
  factory $SiswaDataModelCopyWith(
          SiswaDataModel value, $Res Function(SiswaDataModel) then) =
      _$SiswaDataModelCopyWithImpl<$Res, SiswaDataModel>;
  @useResult
  $Res call(
      {int nisn,
      @JsonKey(name: 'asal_sekolah') String asalSekolah,
      String jurusan,
      @JsonKey(name: 'mulai_magang') String mulaiMagang,
      @JsonKey(name: 'selesai_magang') String selesaiMagang,
      String alamat,
      @JsonKey(name: 'no_hp') String noHp});
}

/// @nodoc
class _$SiswaDataModelCopyWithImpl<$Res, $Val extends SiswaDataModel>
    implements $SiswaDataModelCopyWith<$Res> {
  _$SiswaDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nisn = null,
    Object? asalSekolah = null,
    Object? jurusan = null,
    Object? mulaiMagang = null,
    Object? selesaiMagang = null,
    Object? alamat = null,
    Object? noHp = null,
  }) {
    return _then(_value.copyWith(
      nisn: null == nisn
          ? _value.nisn
          : nisn // ignore: cast_nullable_to_non_nullable
              as int,
      asalSekolah: null == asalSekolah
          ? _value.asalSekolah
          : asalSekolah // ignore: cast_nullable_to_non_nullable
              as String,
      jurusan: null == jurusan
          ? _value.jurusan
          : jurusan // ignore: cast_nullable_to_non_nullable
              as String,
      mulaiMagang: null == mulaiMagang
          ? _value.mulaiMagang
          : mulaiMagang // ignore: cast_nullable_to_non_nullable
              as String,
      selesaiMagang: null == selesaiMagang
          ? _value.selesaiMagang
          : selesaiMagang // ignore: cast_nullable_to_non_nullable
              as String,
      alamat: null == alamat
          ? _value.alamat
          : alamat // ignore: cast_nullable_to_non_nullable
              as String,
      noHp: null == noHp
          ? _value.noHp
          : noHp // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SiswaDataModelImplCopyWith<$Res>
    implements $SiswaDataModelCopyWith<$Res> {
  factory _$$SiswaDataModelImplCopyWith(_$SiswaDataModelImpl value,
          $Res Function(_$SiswaDataModelImpl) then) =
      __$$SiswaDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int nisn,
      @JsonKey(name: 'asal_sekolah') String asalSekolah,
      String jurusan,
      @JsonKey(name: 'mulai_magang') String mulaiMagang,
      @JsonKey(name: 'selesai_magang') String selesaiMagang,
      String alamat,
      @JsonKey(name: 'no_hp') String noHp});
}

/// @nodoc
class __$$SiswaDataModelImplCopyWithImpl<$Res>
    extends _$SiswaDataModelCopyWithImpl<$Res, _$SiswaDataModelImpl>
    implements _$$SiswaDataModelImplCopyWith<$Res> {
  __$$SiswaDataModelImplCopyWithImpl(
      _$SiswaDataModelImpl _value, $Res Function(_$SiswaDataModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nisn = null,
    Object? asalSekolah = null,
    Object? jurusan = null,
    Object? mulaiMagang = null,
    Object? selesaiMagang = null,
    Object? alamat = null,
    Object? noHp = null,
  }) {
    return _then(_$SiswaDataModelImpl(
      nisn: null == nisn
          ? _value.nisn
          : nisn // ignore: cast_nullable_to_non_nullable
              as int,
      asalSekolah: null == asalSekolah
          ? _value.asalSekolah
          : asalSekolah // ignore: cast_nullable_to_non_nullable
              as String,
      jurusan: null == jurusan
          ? _value.jurusan
          : jurusan // ignore: cast_nullable_to_non_nullable
              as String,
      mulaiMagang: null == mulaiMagang
          ? _value.mulaiMagang
          : mulaiMagang // ignore: cast_nullable_to_non_nullable
              as String,
      selesaiMagang: null == selesaiMagang
          ? _value.selesaiMagang
          : selesaiMagang // ignore: cast_nullable_to_non_nullable
              as String,
      alamat: null == alamat
          ? _value.alamat
          : alamat // ignore: cast_nullable_to_non_nullable
              as String,
      noHp: null == noHp
          ? _value.noHp
          : noHp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SiswaDataModelImpl implements _SiswaDataModel {
  const _$SiswaDataModelImpl(
      {required this.nisn,
      @JsonKey(name: 'asal_sekolah') required this.asalSekolah,
      required this.jurusan,
      @JsonKey(name: 'mulai_magang') required this.mulaiMagang,
      @JsonKey(name: 'selesai_magang') required this.selesaiMagang,
      required this.alamat,
      @JsonKey(name: 'no_hp') required this.noHp});

  factory _$SiswaDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SiswaDataModelImplFromJson(json);

  @override
  final int nisn;
  @override
  @JsonKey(name: 'asal_sekolah')
  final String asalSekolah;
  @override
  final String jurusan;
  @override
  @JsonKey(name: 'mulai_magang')
  final String mulaiMagang;
  @override
  @JsonKey(name: 'selesai_magang')
  final String selesaiMagang;
  @override
  final String alamat;
  @override
  @JsonKey(name: 'no_hp')
  final String noHp;

  @override
  String toString() {
    return 'SiswaDataModel(nisn: $nisn, asalSekolah: $asalSekolah, jurusan: $jurusan, mulaiMagang: $mulaiMagang, selesaiMagang: $selesaiMagang, alamat: $alamat, noHp: $noHp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SiswaDataModelImpl &&
            (identical(other.nisn, nisn) || other.nisn == nisn) &&
            (identical(other.asalSekolah, asalSekolah) ||
                other.asalSekolah == asalSekolah) &&
            (identical(other.jurusan, jurusan) || other.jurusan == jurusan) &&
            (identical(other.mulaiMagang, mulaiMagang) ||
                other.mulaiMagang == mulaiMagang) &&
            (identical(other.selesaiMagang, selesaiMagang) ||
                other.selesaiMagang == selesaiMagang) &&
            (identical(other.alamat, alamat) || other.alamat == alamat) &&
            (identical(other.noHp, noHp) || other.noHp == noHp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, nisn, asalSekolah, jurusan,
      mulaiMagang, selesaiMagang, alamat, noHp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SiswaDataModelImplCopyWith<_$SiswaDataModelImpl> get copyWith =>
      __$$SiswaDataModelImplCopyWithImpl<_$SiswaDataModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SiswaDataModelImplToJson(
      this,
    );
  }
}

abstract class _SiswaDataModel implements SiswaDataModel {
  const factory _SiswaDataModel(
          {required final int nisn,
          @JsonKey(name: 'asal_sekolah') required final String asalSekolah,
          required final String jurusan,
          @JsonKey(name: 'mulai_magang') required final String mulaiMagang,
          @JsonKey(name: 'selesai_magang') required final String selesaiMagang,
          required final String alamat,
          @JsonKey(name: 'no_hp') required final String noHp}) =
      _$SiswaDataModelImpl;

  factory _SiswaDataModel.fromJson(Map<String, dynamic> json) =
      _$SiswaDataModelImpl.fromJson;

  @override
  int get nisn;
  @override
  @JsonKey(name: 'asal_sekolah')
  String get asalSekolah;
  @override
  String get jurusan;
  @override
  @JsonKey(name: 'mulai_magang')
  String get mulaiMagang;
  @override
  @JsonKey(name: 'selesai_magang')
  String get selesaiMagang;
  @override
  String get alamat;
  @override
  @JsonKey(name: 'no_hp')
  String get noHp;
  @override
  @JsonKey(ignore: true)
  _$$SiswaDataModelImplCopyWith<_$SiswaDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get picture => throw _privateConstructorUsedError;
  @JsonKey(name: 'email_verified_at')
  String? get emailVerifiedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      String email,
      String? picture,
      @JsonKey(name: 'email_verified_at') String? emailVerifiedAt,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? picture = freezed,
    Object? emailVerifiedAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      picture: freezed == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerifiedAt: freezed == emailVerifiedAt
          ? _value.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String email,
      String? picture,
      @JsonKey(name: 'email_verified_at') String? emailVerifiedAt,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt});
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? picture = freezed,
    Object? emailVerifiedAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$UserModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      picture: freezed == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerifiedAt: freezed == emailVerifiedAt
          ? _value.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl implements _UserModel {
  const _$UserModelImpl(
      {required this.id,
      required this.name,
      required this.email,
      this.picture,
      @JsonKey(name: 'email_verified_at') this.emailVerifiedAt,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt});

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String email;
  @override
  final String? picture;
  @override
  @JsonKey(name: 'email_verified_at')
  final String? emailVerifiedAt;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String updatedAt;

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, picture: $picture, emailVerifiedAt: $emailVerifiedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.picture, picture) || other.picture == picture) &&
            (identical(other.emailVerifiedAt, emailVerifiedAt) ||
                other.emailVerifiedAt == emailVerifiedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, email, picture,
      emailVerifiedAt, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
          {required final int id,
          required final String name,
          required final String email,
          final String? picture,
          @JsonKey(name: 'email_verified_at') final String? emailVerifiedAt,
          @JsonKey(name: 'created_at') required final String createdAt,
          @JsonKey(name: 'updated_at') required final String updatedAt}) =
      _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get email;
  @override
  String? get picture;
  @override
  @JsonKey(name: 'email_verified_at')
  String? get emailVerifiedAt;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
