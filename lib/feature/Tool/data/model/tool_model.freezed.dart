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

Tool _$ToolFromJson(Map<String, dynamic> json) {
  return _Tool.fromJson(json);
}

/// @nodoc
mixin _$Tool {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'nama_alat')
  String get namaAlat => throw _privateConstructorUsedError;
  String get keterangan => throw _privateConstructorUsedError;
  int get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'foto_alat')
  String get fotoAlat => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  int get qty => throw _privateConstructorUsedError;
  @JsonKey(name: 'stock_opname')
  List<StockOpname> get stockOpname => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ToolCopyWith<Tool> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToolCopyWith<$Res> {
  factory $ToolCopyWith(Tool value, $Res Function(Tool) then) =
      _$ToolCopyWithImpl<$Res, Tool>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'nama_alat') String namaAlat,
      String keterangan,
      int status,
      @JsonKey(name: 'foto_alat') String fotoAlat,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      int qty,
      @JsonKey(name: 'stock_opname') List<StockOpname> stockOpname});
}

/// @nodoc
class _$ToolCopyWithImpl<$Res, $Val extends Tool>
    implements $ToolCopyWith<$Res> {
  _$ToolCopyWithImpl(this._value, this._then);

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
    Object? fotoAlat = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? qty = null,
    Object? stockOpname = null,
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
      fotoAlat: null == fotoAlat
          ? _value.fotoAlat
          : fotoAlat // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      stockOpname: null == stockOpname
          ? _value.stockOpname
          : stockOpname // ignore: cast_nullable_to_non_nullable
              as List<StockOpname>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ToolImplCopyWith<$Res> implements $ToolCopyWith<$Res> {
  factory _$$ToolImplCopyWith(
          _$ToolImpl value, $Res Function(_$ToolImpl) then) =
      __$$ToolImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'nama_alat') String namaAlat,
      String keterangan,
      int status,
      @JsonKey(name: 'foto_alat') String fotoAlat,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      int qty,
      @JsonKey(name: 'stock_opname') List<StockOpname> stockOpname});
}

/// @nodoc
class __$$ToolImplCopyWithImpl<$Res>
    extends _$ToolCopyWithImpl<$Res, _$ToolImpl>
    implements _$$ToolImplCopyWith<$Res> {
  __$$ToolImplCopyWithImpl(_$ToolImpl _value, $Res Function(_$ToolImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? namaAlat = null,
    Object? keterangan = null,
    Object? status = null,
    Object? fotoAlat = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? qty = null,
    Object? stockOpname = null,
  }) {
    return _then(_$ToolImpl(
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
      fotoAlat: null == fotoAlat
          ? _value.fotoAlat
          : fotoAlat // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      stockOpname: null == stockOpname
          ? _value._stockOpname
          : stockOpname // ignore: cast_nullable_to_non_nullable
              as List<StockOpname>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ToolImpl implements _Tool {
  const _$ToolImpl(
      {required this.id,
      @JsonKey(name: 'nama_alat') required this.namaAlat,
      required this.keterangan,
      required this.status,
      @JsonKey(name: 'foto_alat') required this.fotoAlat,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      required this.qty,
      @JsonKey(name: 'stock_opname')
      required final List<StockOpname> stockOpname})
      : _stockOpname = stockOpname;

  factory _$ToolImpl.fromJson(Map<String, dynamic> json) =>
      _$$ToolImplFromJson(json);

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
  final String fotoAlat;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @override
  final int qty;
  final List<StockOpname> _stockOpname;
  @override
  @JsonKey(name: 'stock_opname')
  List<StockOpname> get stockOpname {
    if (_stockOpname is EqualUnmodifiableListView) return _stockOpname;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stockOpname);
  }

  @override
  String toString() {
    return 'Tool(id: $id, namaAlat: $namaAlat, keterangan: $keterangan, status: $status, fotoAlat: $fotoAlat, createdAt: $createdAt, updatedAt: $updatedAt, qty: $qty, stockOpname: $stockOpname)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToolImpl &&
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
            (identical(other.qty, qty) || other.qty == qty) &&
            const DeepCollectionEquality()
                .equals(other._stockOpname, _stockOpname));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      namaAlat,
      keterangan,
      status,
      fotoAlat,
      createdAt,
      updatedAt,
      qty,
      const DeepCollectionEquality().hash(_stockOpname));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToolImplCopyWith<_$ToolImpl> get copyWith =>
      __$$ToolImplCopyWithImpl<_$ToolImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ToolImplToJson(
      this,
    );
  }
}

abstract class _Tool implements Tool {
  const factory _Tool(
      {required final int id,
      @JsonKey(name: 'nama_alat') required final String namaAlat,
      required final String keterangan,
      required final int status,
      @JsonKey(name: 'foto_alat') required final String fotoAlat,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'updated_at') required final DateTime updatedAt,
      required final int qty,
      @JsonKey(name: 'stock_opname')
      required final List<StockOpname> stockOpname}) = _$ToolImpl;

  factory _Tool.fromJson(Map<String, dynamic> json) = _$ToolImpl.fromJson;

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
  String get fotoAlat;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  int get qty;
  @override
  @JsonKey(name: 'stock_opname')
  List<StockOpname> get stockOpname;
  @override
  @JsonKey(ignore: true)
  _$$ToolImplCopyWith<_$ToolImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StockOpname _$StockOpnameFromJson(Map<String, dynamic> json) {
  return _StockOpname.fromJson(json);
}

/// @nodoc
mixin _$StockOpname {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'tool_id')
  int get toolId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'type_opname')
  String get typeOpname => throw _privateConstructorUsedError;
  @JsonKey(name: 'type_name')
  String get typeName => throw _privateConstructorUsedError;
  int get qty => throw _privateConstructorUsedError;
  String get keterangan => throw _privateConstructorUsedError;
  String get lokasi => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  ToolUser get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StockOpnameCopyWith<StockOpname> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockOpnameCopyWith<$Res> {
  factory $StockOpnameCopyWith(
          StockOpname value, $Res Function(StockOpname) then) =
      _$StockOpnameCopyWithImpl<$Res, StockOpname>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'tool_id') int toolId,
      @JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'type_opname') String typeOpname,
      @JsonKey(name: 'type_name') String typeName,
      int qty,
      String keterangan,
      String lokasi,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      ToolUser user});

  $ToolUserCopyWith<$Res> get user;
}

/// @nodoc
class _$StockOpnameCopyWithImpl<$Res, $Val extends StockOpname>
    implements $StockOpnameCopyWith<$Res> {
  _$StockOpnameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? toolId = null,
    Object? userId = null,
    Object? typeOpname = null,
    Object? typeName = null,
    Object? qty = null,
    Object? keterangan = null,
    Object? lokasi = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      toolId: null == toolId
          ? _value.toolId
          : toolId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      typeOpname: null == typeOpname
          ? _value.typeOpname
          : typeOpname // ignore: cast_nullable_to_non_nullable
              as String,
      typeName: null == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      keterangan: null == keterangan
          ? _value.keterangan
          : keterangan // ignore: cast_nullable_to_non_nullable
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
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as ToolUser,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ToolUserCopyWith<$Res> get user {
    return $ToolUserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StockOpnameImplCopyWith<$Res>
    implements $StockOpnameCopyWith<$Res> {
  factory _$$StockOpnameImplCopyWith(
          _$StockOpnameImpl value, $Res Function(_$StockOpnameImpl) then) =
      __$$StockOpnameImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'tool_id') int toolId,
      @JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'type_opname') String typeOpname,
      @JsonKey(name: 'type_name') String typeName,
      int qty,
      String keterangan,
      String lokasi,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      ToolUser user});

  @override
  $ToolUserCopyWith<$Res> get user;
}

/// @nodoc
class __$$StockOpnameImplCopyWithImpl<$Res>
    extends _$StockOpnameCopyWithImpl<$Res, _$StockOpnameImpl>
    implements _$$StockOpnameImplCopyWith<$Res> {
  __$$StockOpnameImplCopyWithImpl(
      _$StockOpnameImpl _value, $Res Function(_$StockOpnameImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? toolId = null,
    Object? userId = null,
    Object? typeOpname = null,
    Object? typeName = null,
    Object? qty = null,
    Object? keterangan = null,
    Object? lokasi = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? user = null,
  }) {
    return _then(_$StockOpnameImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      toolId: null == toolId
          ? _value.toolId
          : toolId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      typeOpname: null == typeOpname
          ? _value.typeOpname
          : typeOpname // ignore: cast_nullable_to_non_nullable
              as String,
      typeName: null == typeName
          ? _value.typeName
          : typeName // ignore: cast_nullable_to_non_nullable
              as String,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      keterangan: null == keterangan
          ? _value.keterangan
          : keterangan // ignore: cast_nullable_to_non_nullable
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
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as ToolUser,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StockOpnameImpl implements _StockOpname {
  const _$StockOpnameImpl(
      {required this.id,
      @JsonKey(name: 'tool_id') required this.toolId,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'type_opname') required this.typeOpname,
      @JsonKey(name: 'type_name') required this.typeName,
      required this.qty,
      required this.keterangan,
      required this.lokasi,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      required this.user});

  factory _$StockOpnameImpl.fromJson(Map<String, dynamic> json) =>
      _$$StockOpnameImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'tool_id')
  final int toolId;
  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  @JsonKey(name: 'type_opname')
  final String typeOpname;
  @override
  @JsonKey(name: 'type_name')
  final String typeName;
  @override
  final int qty;
  @override
  final String keterangan;
  @override
  final String lokasi;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @override
  final ToolUser user;

  @override
  String toString() {
    return 'StockOpname(id: $id, toolId: $toolId, userId: $userId, typeOpname: $typeOpname, typeName: $typeName, qty: $qty, keterangan: $keterangan, lokasi: $lokasi, createdAt: $createdAt, updatedAt: $updatedAt, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockOpnameImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.toolId, toolId) || other.toolId == toolId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.typeOpname, typeOpname) ||
                other.typeOpname == typeOpname) &&
            (identical(other.typeName, typeName) ||
                other.typeName == typeName) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.keterangan, keterangan) ||
                other.keterangan == keterangan) &&
            (identical(other.lokasi, lokasi) || other.lokasi == lokasi) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, toolId, userId, typeOpname,
      typeName, qty, keterangan, lokasi, createdAt, updatedAt, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StockOpnameImplCopyWith<_$StockOpnameImpl> get copyWith =>
      __$$StockOpnameImplCopyWithImpl<_$StockOpnameImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StockOpnameImplToJson(
      this,
    );
  }
}

abstract class _StockOpname implements StockOpname {
  const factory _StockOpname(
      {required final int id,
      @JsonKey(name: 'tool_id') required final int toolId,
      @JsonKey(name: 'user_id') required final int userId,
      @JsonKey(name: 'type_opname') required final String typeOpname,
      @JsonKey(name: 'type_name') required final String typeName,
      required final int qty,
      required final String keterangan,
      required final String lokasi,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'updated_at') required final DateTime updatedAt,
      required final ToolUser user}) = _$StockOpnameImpl;

  factory _StockOpname.fromJson(Map<String, dynamic> json) =
      _$StockOpnameImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'tool_id')
  int get toolId;
  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  @JsonKey(name: 'type_opname')
  String get typeOpname;
  @override
  @JsonKey(name: 'type_name')
  String get typeName;
  @override
  int get qty;
  @override
  String get keterangan;
  @override
  String get lokasi;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  ToolUser get user;
  @override
  @JsonKey(ignore: true)
  _$$StockOpnameImplCopyWith<_$StockOpnameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ToolUser _$ToolUserFromJson(Map<String, dynamic> json) {
  return _ToolUser.fromJson(json);
}

/// @nodoc
mixin _$ToolUser {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'email_verified_at')
  DateTime? get emailVerifiedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String? get picture => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ToolUserCopyWith<ToolUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToolUserCopyWith<$Res> {
  factory $ToolUserCopyWith(ToolUser value, $Res Function(ToolUser) then) =
      _$ToolUserCopyWithImpl<$Res, ToolUser>;
  @useResult
  $Res call(
      {int id,
      String name,
      String email,
      @JsonKey(name: 'email_verified_at') DateTime? emailVerifiedAt,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      String? picture});
}

/// @nodoc
class _$ToolUserCopyWithImpl<$Res, $Val extends ToolUser>
    implements $ToolUserCopyWith<$Res> {
  _$ToolUserCopyWithImpl(this._value, this._then);

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
    Object? picture = freezed,
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
              as DateTime?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      picture: freezed == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ToolUserImplCopyWith<$Res>
    implements $ToolUserCopyWith<$Res> {
  factory _$$ToolUserImplCopyWith(
          _$ToolUserImpl value, $Res Function(_$ToolUserImpl) then) =
      __$$ToolUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String email,
      @JsonKey(name: 'email_verified_at') DateTime? emailVerifiedAt,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      String? picture});
}

/// @nodoc
class __$$ToolUserImplCopyWithImpl<$Res>
    extends _$ToolUserCopyWithImpl<$Res, _$ToolUserImpl>
    implements _$$ToolUserImplCopyWith<$Res> {
  __$$ToolUserImplCopyWithImpl(
      _$ToolUserImpl _value, $Res Function(_$ToolUserImpl) _then)
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
    Object? picture = freezed,
  }) {
    return _then(_$ToolUserImpl(
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
              as DateTime?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      picture: freezed == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ToolUserImpl implements _ToolUser {
  const _$ToolUserImpl(
      {required this.id,
      required this.name,
      required this.email,
      @JsonKey(name: 'email_verified_at') this.emailVerifiedAt,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      this.picture});

  factory _$ToolUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$ToolUserImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String email;
  @override
  @JsonKey(name: 'email_verified_at')
  final DateTime? emailVerifiedAt;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @override
  final String? picture;

  @override
  String toString() {
    return 'ToolUser(id: $id, name: $name, email: $email, emailVerifiedAt: $emailVerifiedAt, createdAt: $createdAt, updatedAt: $updatedAt, picture: $picture)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToolUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.emailVerifiedAt, emailVerifiedAt) ||
                other.emailVerifiedAt == emailVerifiedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.picture, picture) || other.picture == picture));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, email, emailVerifiedAt,
      createdAt, updatedAt, picture);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToolUserImplCopyWith<_$ToolUserImpl> get copyWith =>
      __$$ToolUserImplCopyWithImpl<_$ToolUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ToolUserImplToJson(
      this,
    );
  }
}

abstract class _ToolUser implements ToolUser {
  const factory _ToolUser(
      {required final int id,
      required final String name,
      required final String email,
      @JsonKey(name: 'email_verified_at') final DateTime? emailVerifiedAt,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'updated_at') required final DateTime updatedAt,
      final String? picture}) = _$ToolUserImpl;

  factory _ToolUser.fromJson(Map<String, dynamic> json) =
      _$ToolUserImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get email;
  @override
  @JsonKey(name: 'email_verified_at')
  DateTime? get emailVerifiedAt;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  String? get picture;
  @override
  @JsonKey(ignore: true)
  _$$ToolUserImplCopyWith<_$ToolUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
