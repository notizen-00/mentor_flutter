// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'logbook_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Logbook _$LogbookFromJson(Map<String, dynamic> json) {
  return _Logbook.fromJson(json);
}

/// @nodoc
mixin _$Logbook {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'mentor_id')
  int get mentorId => throw _privateConstructorUsedError;
  @JsonKey(name: 'nama_kegiatan')
  String get namaKegiatan => throw _privateConstructorUsedError;
  String get permasalahan => throw _privateConstructorUsedError;
  String get solusi => throw _privateConstructorUsedError;
  String get foto => throw _privateConstructorUsedError;
  bool get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  User get mentor => throw _privateConstructorUsedError;
  @JsonKey(name: 'logbook_verifikasi')
  LogbookVerifikasi? get logbookVerifikasi =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LogbookCopyWith<Logbook> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogbookCopyWith<$Res> {
  factory $LogbookCopyWith(Logbook value, $Res Function(Logbook) then) =
      _$LogbookCopyWithImpl<$Res, Logbook>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'mentor_id') int mentorId,
      @JsonKey(name: 'nama_kegiatan') String namaKegiatan,
      String permasalahan,
      String solusi,
      String foto,
      bool status,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      User user,
      User mentor,
      @JsonKey(name: 'logbook_verifikasi')
      LogbookVerifikasi? logbookVerifikasi});

  $UserCopyWith<$Res> get user;
  $UserCopyWith<$Res> get mentor;
  $LogbookVerifikasiCopyWith<$Res>? get logbookVerifikasi;
}

/// @nodoc
class _$LogbookCopyWithImpl<$Res, $Val extends Logbook>
    implements $LogbookCopyWith<$Res> {
  _$LogbookCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? mentorId = null,
    Object? namaKegiatan = null,
    Object? permasalahan = null,
    Object? solusi = null,
    Object? foto = null,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? user = null,
    Object? mentor = null,
    Object? logbookVerifikasi = freezed,
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
      mentorId: null == mentorId
          ? _value.mentorId
          : mentorId // ignore: cast_nullable_to_non_nullable
              as int,
      namaKegiatan: null == namaKegiatan
          ? _value.namaKegiatan
          : namaKegiatan // ignore: cast_nullable_to_non_nullable
              as String,
      permasalahan: null == permasalahan
          ? _value.permasalahan
          : permasalahan // ignore: cast_nullable_to_non_nullable
              as String,
      solusi: null == solusi
          ? _value.solusi
          : solusi // ignore: cast_nullable_to_non_nullable
              as String,
      foto: null == foto
          ? _value.foto
          : foto // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      mentor: null == mentor
          ? _value.mentor
          : mentor // ignore: cast_nullable_to_non_nullable
              as User,
      logbookVerifikasi: freezed == logbookVerifikasi
          ? _value.logbookVerifikasi
          : logbookVerifikasi // ignore: cast_nullable_to_non_nullable
              as LogbookVerifikasi?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get mentor {
    return $UserCopyWith<$Res>(_value.mentor, (value) {
      return _then(_value.copyWith(mentor: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LogbookVerifikasiCopyWith<$Res>? get logbookVerifikasi {
    if (_value.logbookVerifikasi == null) {
      return null;
    }

    return $LogbookVerifikasiCopyWith<$Res>(_value.logbookVerifikasi!, (value) {
      return _then(_value.copyWith(logbookVerifikasi: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LogbookImplCopyWith<$Res> implements $LogbookCopyWith<$Res> {
  factory _$$LogbookImplCopyWith(
          _$LogbookImpl value, $Res Function(_$LogbookImpl) then) =
      __$$LogbookImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'mentor_id') int mentorId,
      @JsonKey(name: 'nama_kegiatan') String namaKegiatan,
      String permasalahan,
      String solusi,
      String foto,
      bool status,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      User user,
      User mentor,
      @JsonKey(name: 'logbook_verifikasi')
      LogbookVerifikasi? logbookVerifikasi});

  @override
  $UserCopyWith<$Res> get user;
  @override
  $UserCopyWith<$Res> get mentor;
  @override
  $LogbookVerifikasiCopyWith<$Res>? get logbookVerifikasi;
}

/// @nodoc
class __$$LogbookImplCopyWithImpl<$Res>
    extends _$LogbookCopyWithImpl<$Res, _$LogbookImpl>
    implements _$$LogbookImplCopyWith<$Res> {
  __$$LogbookImplCopyWithImpl(
      _$LogbookImpl _value, $Res Function(_$LogbookImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? mentorId = null,
    Object? namaKegiatan = null,
    Object? permasalahan = null,
    Object? solusi = null,
    Object? foto = null,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? user = null,
    Object? mentor = null,
    Object? logbookVerifikasi = freezed,
  }) {
    return _then(_$LogbookImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      mentorId: null == mentorId
          ? _value.mentorId
          : mentorId // ignore: cast_nullable_to_non_nullable
              as int,
      namaKegiatan: null == namaKegiatan
          ? _value.namaKegiatan
          : namaKegiatan // ignore: cast_nullable_to_non_nullable
              as String,
      permasalahan: null == permasalahan
          ? _value.permasalahan
          : permasalahan // ignore: cast_nullable_to_non_nullable
              as String,
      solusi: null == solusi
          ? _value.solusi
          : solusi // ignore: cast_nullable_to_non_nullable
              as String,
      foto: null == foto
          ? _value.foto
          : foto // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      mentor: null == mentor
          ? _value.mentor
          : mentor // ignore: cast_nullable_to_non_nullable
              as User,
      logbookVerifikasi: freezed == logbookVerifikasi
          ? _value.logbookVerifikasi
          : logbookVerifikasi // ignore: cast_nullable_to_non_nullable
              as LogbookVerifikasi?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LogbookImpl implements _Logbook {
  const _$LogbookImpl(
      {required this.id,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'mentor_id') required this.mentorId,
      @JsonKey(name: 'nama_kegiatan') required this.namaKegiatan,
      required this.permasalahan,
      required this.solusi,
      required this.foto,
      required this.status,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      required this.user,
      required this.mentor,
      @JsonKey(name: 'logbook_verifikasi') this.logbookVerifikasi});

  factory _$LogbookImpl.fromJson(Map<String, dynamic> json) =>
      _$$LogbookImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  @JsonKey(name: 'mentor_id')
  final int mentorId;
  @override
  @JsonKey(name: 'nama_kegiatan')
  final String namaKegiatan;
  @override
  final String permasalahan;
  @override
  final String solusi;
  @override
  final String foto;
  @override
  final bool status;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @override
  final User user;
  @override
  final User mentor;
  @override
  @JsonKey(name: 'logbook_verifikasi')
  final LogbookVerifikasi? logbookVerifikasi;

  @override
  String toString() {
    return 'Logbook(id: $id, userId: $userId, mentorId: $mentorId, namaKegiatan: $namaKegiatan, permasalahan: $permasalahan, solusi: $solusi, foto: $foto, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, user: $user, mentor: $mentor, logbookVerifikasi: $logbookVerifikasi)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogbookImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.mentorId, mentorId) ||
                other.mentorId == mentorId) &&
            (identical(other.namaKegiatan, namaKegiatan) ||
                other.namaKegiatan == namaKegiatan) &&
            (identical(other.permasalahan, permasalahan) ||
                other.permasalahan == permasalahan) &&
            (identical(other.solusi, solusi) || other.solusi == solusi) &&
            (identical(other.foto, foto) || other.foto == foto) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.mentor, mentor) || other.mentor == mentor) &&
            (identical(other.logbookVerifikasi, logbookVerifikasi) ||
                other.logbookVerifikasi == logbookVerifikasi));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      mentorId,
      namaKegiatan,
      permasalahan,
      solusi,
      foto,
      status,
      createdAt,
      updatedAt,
      user,
      mentor,
      logbookVerifikasi);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LogbookImplCopyWith<_$LogbookImpl> get copyWith =>
      __$$LogbookImplCopyWithImpl<_$LogbookImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LogbookImplToJson(
      this,
    );
  }
}

abstract class _Logbook implements Logbook {
  const factory _Logbook(
      {required final int id,
      @JsonKey(name: 'user_id') required final int userId,
      @JsonKey(name: 'mentor_id') required final int mentorId,
      @JsonKey(name: 'nama_kegiatan') required final String namaKegiatan,
      required final String permasalahan,
      required final String solusi,
      required final String foto,
      required final bool status,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'updated_at') required final DateTime updatedAt,
      required final User user,
      required final User mentor,
      @JsonKey(name: 'logbook_verifikasi')
      final LogbookVerifikasi? logbookVerifikasi}) = _$LogbookImpl;

  factory _Logbook.fromJson(Map<String, dynamic> json) = _$LogbookImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  @JsonKey(name: 'mentor_id')
  int get mentorId;
  @override
  @JsonKey(name: 'nama_kegiatan')
  String get namaKegiatan;
  @override
  String get permasalahan;
  @override
  String get solusi;
  @override
  String get foto;
  @override
  bool get status;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  User get user;
  @override
  User get mentor;
  @override
  @JsonKey(name: 'logbook_verifikasi')
  LogbookVerifikasi? get logbookVerifikasi;
  @override
  @JsonKey(ignore: true)
  _$$LogbookImplCopyWith<_$LogbookImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LogbookVerifikasi _$LogbookVerifikasiFromJson(Map<String, dynamic> json) {
  return _LogbookVerifikasi.fromJson(json);
}

/// @nodoc
mixin _$LogbookVerifikasi {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'mentor_id')
  int get mentorId => throw _privateConstructorUsedError;
  @JsonKey(name: 'logbook_id')
  int get logbookId => throw _privateConstructorUsedError;
  String get keterangan => throw _privateConstructorUsedError;
  int get rating => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  User get mentor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LogbookVerifikasiCopyWith<LogbookVerifikasi> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogbookVerifikasiCopyWith<$Res> {
  factory $LogbookVerifikasiCopyWith(
          LogbookVerifikasi value, $Res Function(LogbookVerifikasi) then) =
      _$LogbookVerifikasiCopyWithImpl<$Res, LogbookVerifikasi>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'mentor_id') int mentorId,
      @JsonKey(name: 'logbook_id') int logbookId,
      String keterangan,
      int rating,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      User user,
      User mentor});

  $UserCopyWith<$Res> get user;
  $UserCopyWith<$Res> get mentor;
}

/// @nodoc
class _$LogbookVerifikasiCopyWithImpl<$Res, $Val extends LogbookVerifikasi>
    implements $LogbookVerifikasiCopyWith<$Res> {
  _$LogbookVerifikasiCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? mentorId = null,
    Object? logbookId = null,
    Object? keterangan = null,
    Object? rating = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? user = null,
    Object? mentor = null,
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
      mentorId: null == mentorId
          ? _value.mentorId
          : mentorId // ignore: cast_nullable_to_non_nullable
              as int,
      logbookId: null == logbookId
          ? _value.logbookId
          : logbookId // ignore: cast_nullable_to_non_nullable
              as int,
      keterangan: null == keterangan
          ? _value.keterangan
          : keterangan // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      mentor: null == mentor
          ? _value.mentor
          : mentor // ignore: cast_nullable_to_non_nullable
              as User,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get mentor {
    return $UserCopyWith<$Res>(_value.mentor, (value) {
      return _then(_value.copyWith(mentor: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LogbookVerifikasiImplCopyWith<$Res>
    implements $LogbookVerifikasiCopyWith<$Res> {
  factory _$$LogbookVerifikasiImplCopyWith(_$LogbookVerifikasiImpl value,
          $Res Function(_$LogbookVerifikasiImpl) then) =
      __$$LogbookVerifikasiImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'mentor_id') int mentorId,
      @JsonKey(name: 'logbook_id') int logbookId,
      String keterangan,
      int rating,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      User user,
      User mentor});

  @override
  $UserCopyWith<$Res> get user;
  @override
  $UserCopyWith<$Res> get mentor;
}

/// @nodoc
class __$$LogbookVerifikasiImplCopyWithImpl<$Res>
    extends _$LogbookVerifikasiCopyWithImpl<$Res, _$LogbookVerifikasiImpl>
    implements _$$LogbookVerifikasiImplCopyWith<$Res> {
  __$$LogbookVerifikasiImplCopyWithImpl(_$LogbookVerifikasiImpl _value,
      $Res Function(_$LogbookVerifikasiImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? mentorId = null,
    Object? logbookId = null,
    Object? keterangan = null,
    Object? rating = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? user = null,
    Object? mentor = null,
  }) {
    return _then(_$LogbookVerifikasiImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      mentorId: null == mentorId
          ? _value.mentorId
          : mentorId // ignore: cast_nullable_to_non_nullable
              as int,
      logbookId: null == logbookId
          ? _value.logbookId
          : logbookId // ignore: cast_nullable_to_non_nullable
              as int,
      keterangan: null == keterangan
          ? _value.keterangan
          : keterangan // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      mentor: null == mentor
          ? _value.mentor
          : mentor // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LogbookVerifikasiImpl implements _LogbookVerifikasi {
  const _$LogbookVerifikasiImpl(
      {required this.id,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'mentor_id') required this.mentorId,
      @JsonKey(name: 'logbook_id') required this.logbookId,
      required this.keterangan,
      required this.rating,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      required this.user,
      required this.mentor});

  factory _$LogbookVerifikasiImpl.fromJson(Map<String, dynamic> json) =>
      _$$LogbookVerifikasiImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  @JsonKey(name: 'mentor_id')
  final int mentorId;
  @override
  @JsonKey(name: 'logbook_id')
  final int logbookId;
  @override
  final String keterangan;
  @override
  final int rating;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @override
  final User user;
  @override
  final User mentor;

  @override
  String toString() {
    return 'LogbookVerifikasi(id: $id, userId: $userId, mentorId: $mentorId, logbookId: $logbookId, keterangan: $keterangan, rating: $rating, createdAt: $createdAt, updatedAt: $updatedAt, user: $user, mentor: $mentor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogbookVerifikasiImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.mentorId, mentorId) ||
                other.mentorId == mentorId) &&
            (identical(other.logbookId, logbookId) ||
                other.logbookId == logbookId) &&
            (identical(other.keterangan, keterangan) ||
                other.keterangan == keterangan) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.mentor, mentor) || other.mentor == mentor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, mentorId, logbookId,
      keterangan, rating, createdAt, updatedAt, user, mentor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LogbookVerifikasiImplCopyWith<_$LogbookVerifikasiImpl> get copyWith =>
      __$$LogbookVerifikasiImplCopyWithImpl<_$LogbookVerifikasiImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LogbookVerifikasiImplToJson(
      this,
    );
  }
}

abstract class _LogbookVerifikasi implements LogbookVerifikasi {
  const factory _LogbookVerifikasi(
      {required final int id,
      @JsonKey(name: 'user_id') required final int userId,
      @JsonKey(name: 'mentor_id') required final int mentorId,
      @JsonKey(name: 'logbook_id') required final int logbookId,
      required final String keterangan,
      required final int rating,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'updated_at') required final DateTime updatedAt,
      required final User user,
      required final User mentor}) = _$LogbookVerifikasiImpl;

  factory _LogbookVerifikasi.fromJson(Map<String, dynamic> json) =
      _$LogbookVerifikasiImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  @JsonKey(name: 'mentor_id')
  int get mentorId;
  @override
  @JsonKey(name: 'logbook_id')
  int get logbookId;
  @override
  String get keterangan;
  @override
  int get rating;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  User get user;
  @override
  User get mentor;
  @override
  @JsonKey(ignore: true)
  _$$LogbookVerifikasiImplCopyWith<_$LogbookVerifikasiImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LogbookData _$LogbookDataFromJson(Map<String, dynamic> json) {
  return _LogbookData.fromJson(json);
}

/// @nodoc
mixin _$LogbookData {
  @JsonKey(name: 'mentor_id')
  int get mentorId => throw _privateConstructorUsedError;
  String get permasalahan => throw _privateConstructorUsedError;
  String get solusi => throw _privateConstructorUsedError;
  @JsonKey(name: 'nama_kegiatan')
  String get namaKegiatan => throw _privateConstructorUsedError;

  /// Tidak bisa diserialisasi ke JSON
  @JsonKey(ignore: true)
  File? get foto => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LogbookDataCopyWith<LogbookData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogbookDataCopyWith<$Res> {
  factory $LogbookDataCopyWith(
          LogbookData value, $Res Function(LogbookData) then) =
      _$LogbookDataCopyWithImpl<$Res, LogbookData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'mentor_id') int mentorId,
      String permasalahan,
      String solusi,
      @JsonKey(name: 'nama_kegiatan') String namaKegiatan,
      @JsonKey(ignore: true) File? foto});
}

/// @nodoc
class _$LogbookDataCopyWithImpl<$Res, $Val extends LogbookData>
    implements $LogbookDataCopyWith<$Res> {
  _$LogbookDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mentorId = null,
    Object? permasalahan = null,
    Object? solusi = null,
    Object? namaKegiatan = null,
    Object? foto = freezed,
  }) {
    return _then(_value.copyWith(
      mentorId: null == mentorId
          ? _value.mentorId
          : mentorId // ignore: cast_nullable_to_non_nullable
              as int,
      permasalahan: null == permasalahan
          ? _value.permasalahan
          : permasalahan // ignore: cast_nullable_to_non_nullable
              as String,
      solusi: null == solusi
          ? _value.solusi
          : solusi // ignore: cast_nullable_to_non_nullable
              as String,
      namaKegiatan: null == namaKegiatan
          ? _value.namaKegiatan
          : namaKegiatan // ignore: cast_nullable_to_non_nullable
              as String,
      foto: freezed == foto
          ? _value.foto
          : foto // ignore: cast_nullable_to_non_nullable
              as File?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LogbookDataImplCopyWith<$Res>
    implements $LogbookDataCopyWith<$Res> {
  factory _$$LogbookDataImplCopyWith(
          _$LogbookDataImpl value, $Res Function(_$LogbookDataImpl) then) =
      __$$LogbookDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'mentor_id') int mentorId,
      String permasalahan,
      String solusi,
      @JsonKey(name: 'nama_kegiatan') String namaKegiatan,
      @JsonKey(ignore: true) File? foto});
}

/// @nodoc
class __$$LogbookDataImplCopyWithImpl<$Res>
    extends _$LogbookDataCopyWithImpl<$Res, _$LogbookDataImpl>
    implements _$$LogbookDataImplCopyWith<$Res> {
  __$$LogbookDataImplCopyWithImpl(
      _$LogbookDataImpl _value, $Res Function(_$LogbookDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mentorId = null,
    Object? permasalahan = null,
    Object? solusi = null,
    Object? namaKegiatan = null,
    Object? foto = freezed,
  }) {
    return _then(_$LogbookDataImpl(
      mentorId: null == mentorId
          ? _value.mentorId
          : mentorId // ignore: cast_nullable_to_non_nullable
              as int,
      permasalahan: null == permasalahan
          ? _value.permasalahan
          : permasalahan // ignore: cast_nullable_to_non_nullable
              as String,
      solusi: null == solusi
          ? _value.solusi
          : solusi // ignore: cast_nullable_to_non_nullable
              as String,
      namaKegiatan: null == namaKegiatan
          ? _value.namaKegiatan
          : namaKegiatan // ignore: cast_nullable_to_non_nullable
              as String,
      foto: freezed == foto
          ? _value.foto
          : foto // ignore: cast_nullable_to_non_nullable
              as File?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LogbookDataImpl implements _LogbookData {
  const _$LogbookDataImpl(
      {@JsonKey(name: 'mentor_id') required this.mentorId,
      required this.permasalahan,
      required this.solusi,
      @JsonKey(name: 'nama_kegiatan') required this.namaKegiatan,
      @JsonKey(ignore: true) this.foto});

  factory _$LogbookDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$LogbookDataImplFromJson(json);

  @override
  @JsonKey(name: 'mentor_id')
  final int mentorId;
  @override
  final String permasalahan;
  @override
  final String solusi;
  @override
  @JsonKey(name: 'nama_kegiatan')
  final String namaKegiatan;

  /// Tidak bisa diserialisasi ke JSON
  @override
  @JsonKey(ignore: true)
  final File? foto;

  @override
  String toString() {
    return 'LogbookData(mentorId: $mentorId, permasalahan: $permasalahan, solusi: $solusi, namaKegiatan: $namaKegiatan, foto: $foto)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogbookDataImpl &&
            (identical(other.mentorId, mentorId) ||
                other.mentorId == mentorId) &&
            (identical(other.permasalahan, permasalahan) ||
                other.permasalahan == permasalahan) &&
            (identical(other.solusi, solusi) || other.solusi == solusi) &&
            (identical(other.namaKegiatan, namaKegiatan) ||
                other.namaKegiatan == namaKegiatan) &&
            (identical(other.foto, foto) || other.foto == foto));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, mentorId, permasalahan, solusi, namaKegiatan, foto);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LogbookDataImplCopyWith<_$LogbookDataImpl> get copyWith =>
      __$$LogbookDataImplCopyWithImpl<_$LogbookDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LogbookDataImplToJson(
      this,
    );
  }
}

abstract class _LogbookData implements LogbookData {
  const factory _LogbookData(
      {@JsonKey(name: 'mentor_id') required final int mentorId,
      required final String permasalahan,
      required final String solusi,
      @JsonKey(name: 'nama_kegiatan') required final String namaKegiatan,
      @JsonKey(ignore: true) final File? foto}) = _$LogbookDataImpl;

  factory _LogbookData.fromJson(Map<String, dynamic> json) =
      _$LogbookDataImpl.fromJson;

  @override
  @JsonKey(name: 'mentor_id')
  int get mentorId;
  @override
  String get permasalahan;
  @override
  String get solusi;
  @override
  @JsonKey(name: 'nama_kegiatan')
  String get namaKegiatan;
  @override

  /// Tidak bisa diserialisasi ke JSON
  @JsonKey(ignore: true)
  File? get foto;
  @override
  @JsonKey(ignore: true)
  _$$LogbookDataImplCopyWith<_$LogbookDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'email_verified_at')
  String? get emailVerifiedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {int id,
      String name,
      String email,
      @JsonKey(name: 'email_verified_at') String? emailVerifiedAt,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

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
      emailVerifiedAt: freezed == emailVerifiedAt
          ? _value.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String email,
      @JsonKey(name: 'email_verified_at') String? emailVerifiedAt,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? email = null,
    Object? emailVerifiedAt = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$UserImpl(
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
      emailVerifiedAt: freezed == emailVerifiedAt
          ? _value.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$UserImpl implements _User {
  const _$UserImpl(
      {required this.id,
      required this.name,
      required this.email,
      @JsonKey(name: 'email_verified_at') this.emailVerifiedAt,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String email;
  @override
  @JsonKey(name: 'email_verified_at')
  final String? emailVerifiedAt;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, emailVerifiedAt: $emailVerifiedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.emailVerifiedAt, emailVerifiedAt) ||
                other.emailVerifiedAt == emailVerifiedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, email, emailVerifiedAt, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
          {required final int id,
          required final String name,
          required final String email,
          @JsonKey(name: 'email_verified_at') final String? emailVerifiedAt,
          @JsonKey(name: 'created_at') required final DateTime createdAt,
          @JsonKey(name: 'updated_at') required final DateTime updatedAt}) =
      _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get email;
  @override
  @JsonKey(name: 'email_verified_at')
  String? get emailVerifiedAt;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
