// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TaskModel _$TaskModelFromJson(Map<String, dynamic> json) {
  return _TaskModel.fromJson(json);
}

/// @nodoc
mixin _$TaskModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'mentor_id')
  int get mentorId => throw _privateConstructorUsedError;
  @JsonKey(name: 'nama_task')
  String get namaTask => throw _privateConstructorUsedError;
  int get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'location_id')
  int get locationId => throw _privateConstructorUsedError;
  String? get keterangan => throw _privateConstructorUsedError;
  @JsonKey(name: 'task_tool')
  List<TaskTool> get taskTool => throw _privateConstructorUsedError;
  @JsonKey(name: 'task_user')
  List<TaskUser>? get taskUser => throw _privateConstructorUsedError;
  Mentor get mentor => throw _privateConstructorUsedError;
  Location get location => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskModelCopyWith<TaskModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskModelCopyWith<$Res> {
  factory $TaskModelCopyWith(TaskModel value, $Res Function(TaskModel) then) =
      _$TaskModelCopyWithImpl<$Res, TaskModel>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'mentor_id') int mentorId,
      @JsonKey(name: 'nama_task') String namaTask,
      int status,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'location_id') int locationId,
      String? keterangan,
      @JsonKey(name: 'task_tool') List<TaskTool> taskTool,
      @JsonKey(name: 'task_user') List<TaskUser>? taskUser,
      Mentor mentor,
      Location location});

  $MentorCopyWith<$Res> get mentor;
  $LocationCopyWith<$Res> get location;
}

/// @nodoc
class _$TaskModelCopyWithImpl<$Res, $Val extends TaskModel>
    implements $TaskModelCopyWith<$Res> {
  _$TaskModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? mentorId = null,
    Object? namaTask = null,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? locationId = null,
    Object? keterangan = freezed,
    Object? taskTool = null,
    Object? taskUser = freezed,
    Object? mentor = null,
    Object? location = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      mentorId: null == mentorId
          ? _value.mentorId
          : mentorId // ignore: cast_nullable_to_non_nullable
              as int,
      namaTask: null == namaTask
          ? _value.namaTask
          : namaTask // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      locationId: null == locationId
          ? _value.locationId
          : locationId // ignore: cast_nullable_to_non_nullable
              as int,
      keterangan: freezed == keterangan
          ? _value.keterangan
          : keterangan // ignore: cast_nullable_to_non_nullable
              as String?,
      taskTool: null == taskTool
          ? _value.taskTool
          : taskTool // ignore: cast_nullable_to_non_nullable
              as List<TaskTool>,
      taskUser: freezed == taskUser
          ? _value.taskUser
          : taskUser // ignore: cast_nullable_to_non_nullable
              as List<TaskUser>?,
      mentor: null == mentor
          ? _value.mentor
          : mentor // ignore: cast_nullable_to_non_nullable
              as Mentor,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MentorCopyWith<$Res> get mentor {
    return $MentorCopyWith<$Res>(_value.mentor, (value) {
      return _then(_value.copyWith(mentor: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res> get location {
    return $LocationCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TaskModelImplCopyWith<$Res>
    implements $TaskModelCopyWith<$Res> {
  factory _$$TaskModelImplCopyWith(
          _$TaskModelImpl value, $Res Function(_$TaskModelImpl) then) =
      __$$TaskModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'mentor_id') int mentorId,
      @JsonKey(name: 'nama_task') String namaTask,
      int status,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'location_id') int locationId,
      String? keterangan,
      @JsonKey(name: 'task_tool') List<TaskTool> taskTool,
      @JsonKey(name: 'task_user') List<TaskUser>? taskUser,
      Mentor mentor,
      Location location});

  @override
  $MentorCopyWith<$Res> get mentor;
  @override
  $LocationCopyWith<$Res> get location;
}

/// @nodoc
class __$$TaskModelImplCopyWithImpl<$Res>
    extends _$TaskModelCopyWithImpl<$Res, _$TaskModelImpl>
    implements _$$TaskModelImplCopyWith<$Res> {
  __$$TaskModelImplCopyWithImpl(
      _$TaskModelImpl _value, $Res Function(_$TaskModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? mentorId = null,
    Object? namaTask = null,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? locationId = null,
    Object? keterangan = freezed,
    Object? taskTool = null,
    Object? taskUser = freezed,
    Object? mentor = null,
    Object? location = null,
  }) {
    return _then(_$TaskModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      mentorId: null == mentorId
          ? _value.mentorId
          : mentorId // ignore: cast_nullable_to_non_nullable
              as int,
      namaTask: null == namaTask
          ? _value.namaTask
          : namaTask // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      locationId: null == locationId
          ? _value.locationId
          : locationId // ignore: cast_nullable_to_non_nullable
              as int,
      keterangan: freezed == keterangan
          ? _value.keterangan
          : keterangan // ignore: cast_nullable_to_non_nullable
              as String?,
      taskTool: null == taskTool
          ? _value._taskTool
          : taskTool // ignore: cast_nullable_to_non_nullable
              as List<TaskTool>,
      taskUser: freezed == taskUser
          ? _value._taskUser
          : taskUser // ignore: cast_nullable_to_non_nullable
              as List<TaskUser>?,
      mentor: null == mentor
          ? _value.mentor
          : mentor // ignore: cast_nullable_to_non_nullable
              as Mentor,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskModelImpl implements _TaskModel {
  const _$TaskModelImpl(
      {required this.id,
      @JsonKey(name: 'mentor_id') required this.mentorId,
      @JsonKey(name: 'nama_task') required this.namaTask,
      required this.status,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      @JsonKey(name: 'location_id') required this.locationId,
      this.keterangan,
      @JsonKey(name: 'task_tool') required final List<TaskTool> taskTool,
      @JsonKey(name: 'task_user') final List<TaskUser>? taskUser,
      required this.mentor,
      required this.location})
      : _taskTool = taskTool,
        _taskUser = taskUser;

  factory _$TaskModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskModelImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'mentor_id')
  final int mentorId;
  @override
  @JsonKey(name: 'nama_task')
  final String namaTask;
  @override
  final int status;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'location_id')
  final int locationId;
  @override
  final String? keterangan;
  final List<TaskTool> _taskTool;
  @override
  @JsonKey(name: 'task_tool')
  List<TaskTool> get taskTool {
    if (_taskTool is EqualUnmodifiableListView) return _taskTool;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_taskTool);
  }

  final List<TaskUser>? _taskUser;
  @override
  @JsonKey(name: 'task_user')
  List<TaskUser>? get taskUser {
    final value = _taskUser;
    if (value == null) return null;
    if (_taskUser is EqualUnmodifiableListView) return _taskUser;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Mentor mentor;
  @override
  final Location location;

  @override
  String toString() {
    return 'TaskModel(id: $id, mentorId: $mentorId, namaTask: $namaTask, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, locationId: $locationId, keterangan: $keterangan, taskTool: $taskTool, taskUser: $taskUser, mentor: $mentor, location: $location)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.mentorId, mentorId) ||
                other.mentorId == mentorId) &&
            (identical(other.namaTask, namaTask) ||
                other.namaTask == namaTask) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.locationId, locationId) ||
                other.locationId == locationId) &&
            (identical(other.keterangan, keterangan) ||
                other.keterangan == keterangan) &&
            const DeepCollectionEquality().equals(other._taskTool, _taskTool) &&
            const DeepCollectionEquality().equals(other._taskUser, _taskUser) &&
            (identical(other.mentor, mentor) || other.mentor == mentor) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      mentorId,
      namaTask,
      status,
      createdAt,
      updatedAt,
      locationId,
      keterangan,
      const DeepCollectionEquality().hash(_taskTool),
      const DeepCollectionEquality().hash(_taskUser),
      mentor,
      location);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskModelImplCopyWith<_$TaskModelImpl> get copyWith =>
      __$$TaskModelImplCopyWithImpl<_$TaskModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskModelImplToJson(
      this,
    );
  }
}

abstract class _TaskModel implements TaskModel {
  const factory _TaskModel(
      {required final int id,
      @JsonKey(name: 'mentor_id') required final int mentorId,
      @JsonKey(name: 'nama_task') required final String namaTask,
      required final int status,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'updated_at') required final DateTime updatedAt,
      @JsonKey(name: 'location_id') required final int locationId,
      final String? keterangan,
      @JsonKey(name: 'task_tool') required final List<TaskTool> taskTool,
      @JsonKey(name: 'task_user') final List<TaskUser>? taskUser,
      required final Mentor mentor,
      required final Location location}) = _$TaskModelImpl;

  factory _TaskModel.fromJson(Map<String, dynamic> json) =
      _$TaskModelImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'mentor_id')
  int get mentorId;
  @override
  @JsonKey(name: 'nama_task')
  String get namaTask;
  @override
  int get status;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'location_id')
  int get locationId;
  @override
  String? get keterangan;
  @override
  @JsonKey(name: 'task_tool')
  List<TaskTool> get taskTool;
  @override
  @JsonKey(name: 'task_user')
  List<TaskUser>? get taskUser;
  @override
  Mentor get mentor;
  @override
  Location get location;
  @override
  @JsonKey(ignore: true)
  _$$TaskModelImplCopyWith<_$TaskModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TaskTool _$TaskToolFromJson(Map<String, dynamic> json) {
  return _TaskTool.fromJson(json);
}

/// @nodoc
mixin _$TaskTool {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'task_id')
  int get taskId => throw _privateConstructorUsedError;
  @JsonKey(name: 'tool_id')
  int get toolId => throw _privateConstructorUsedError;
  int get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  int get qty => throw _privateConstructorUsedError;
  Tool get tool => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskToolCopyWith<TaskTool> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskToolCopyWith<$Res> {
  factory $TaskToolCopyWith(TaskTool value, $Res Function(TaskTool) then) =
      _$TaskToolCopyWithImpl<$Res, TaskTool>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'task_id') int taskId,
      @JsonKey(name: 'tool_id') int toolId,
      int status,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'user_id') int userId,
      int qty,
      Tool tool});

  $ToolCopyWith<$Res> get tool;
}

/// @nodoc
class _$TaskToolCopyWithImpl<$Res, $Val extends TaskTool>
    implements $TaskToolCopyWith<$Res> {
  _$TaskToolCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? taskId = null,
    Object? toolId = null,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? userId = null,
    Object? qty = null,
    Object? tool = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as int,
      toolId: null == toolId
          ? _value.toolId
          : toolId // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      tool: null == tool
          ? _value.tool
          : tool // ignore: cast_nullable_to_non_nullable
              as Tool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ToolCopyWith<$Res> get tool {
    return $ToolCopyWith<$Res>(_value.tool, (value) {
      return _then(_value.copyWith(tool: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TaskToolImplCopyWith<$Res>
    implements $TaskToolCopyWith<$Res> {
  factory _$$TaskToolImplCopyWith(
          _$TaskToolImpl value, $Res Function(_$TaskToolImpl) then) =
      __$$TaskToolImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'task_id') int taskId,
      @JsonKey(name: 'tool_id') int toolId,
      int status,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'user_id') int userId,
      int qty,
      Tool tool});

  @override
  $ToolCopyWith<$Res> get tool;
}

/// @nodoc
class __$$TaskToolImplCopyWithImpl<$Res>
    extends _$TaskToolCopyWithImpl<$Res, _$TaskToolImpl>
    implements _$$TaskToolImplCopyWith<$Res> {
  __$$TaskToolImplCopyWithImpl(
      _$TaskToolImpl _value, $Res Function(_$TaskToolImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? taskId = null,
    Object? toolId = null,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? userId = null,
    Object? qty = null,
    Object? tool = null,
  }) {
    return _then(_$TaskToolImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as int,
      toolId: null == toolId
          ? _value.toolId
          : toolId // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      tool: null == tool
          ? _value.tool
          : tool // ignore: cast_nullable_to_non_nullable
              as Tool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskToolImpl implements _TaskTool {
  const _$TaskToolImpl(
      {required this.id,
      @JsonKey(name: 'task_id') required this.taskId,
      @JsonKey(name: 'tool_id') required this.toolId,
      required this.status,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      @JsonKey(name: 'user_id') required this.userId,
      required this.qty,
      required this.tool});

  factory _$TaskToolImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskToolImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'task_id')
  final int taskId;
  @override
  @JsonKey(name: 'tool_id')
  final int toolId;
  @override
  final int status;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  final int qty;
  @override
  final Tool tool;

  @override
  String toString() {
    return 'TaskTool(id: $id, taskId: $taskId, toolId: $toolId, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, userId: $userId, qty: $qty, tool: $tool)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskToolImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            (identical(other.toolId, toolId) || other.toolId == toolId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.tool, tool) || other.tool == tool));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, taskId, toolId, status,
      createdAt, updatedAt, userId, qty, tool);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskToolImplCopyWith<_$TaskToolImpl> get copyWith =>
      __$$TaskToolImplCopyWithImpl<_$TaskToolImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskToolImplToJson(
      this,
    );
  }
}

abstract class _TaskTool implements TaskTool {
  const factory _TaskTool(
      {required final int id,
      @JsonKey(name: 'task_id') required final int taskId,
      @JsonKey(name: 'tool_id') required final int toolId,
      required final int status,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'updated_at') required final DateTime updatedAt,
      @JsonKey(name: 'user_id') required final int userId,
      required final int qty,
      required final Tool tool}) = _$TaskToolImpl;

  factory _TaskTool.fromJson(Map<String, dynamic> json) =
      _$TaskToolImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'task_id')
  int get taskId;
  @override
  @JsonKey(name: 'tool_id')
  int get toolId;
  @override
  int get status;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  int get qty;
  @override
  Tool get tool;
  @override
  @JsonKey(ignore: true)
  _$$TaskToolImplCopyWith<_$TaskToolImpl> get copyWith =>
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
  String? get keterangan => throw _privateConstructorUsedError;
  int get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'foto_alat')
  String? get fotoAlat => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  int? get qty => throw _privateConstructorUsedError;

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
      String? keterangan,
      int status,
      @JsonKey(name: 'foto_alat') String? fotoAlat,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      int? qty});
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
    Object? keterangan = freezed,
    Object? status = null,
    Object? fotoAlat = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? qty = freezed,
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
      keterangan: freezed == keterangan
          ? _value.keterangan
          : keterangan // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      qty: freezed == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int?,
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
      String? keterangan,
      int status,
      @JsonKey(name: 'foto_alat') String? fotoAlat,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      int? qty});
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
    Object? keterangan = freezed,
    Object? status = null,
    Object? fotoAlat = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? qty = freezed,
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
      keterangan: freezed == keterangan
          ? _value.keterangan
          : keterangan // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      qty: freezed == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ToolImpl implements _Tool {
  const _$ToolImpl(
      {required this.id,
      @JsonKey(name: 'nama_alat') required this.namaAlat,
      this.keterangan,
      required this.status,
      @JsonKey(name: 'foto_alat') this.fotoAlat,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      this.qty});

  factory _$ToolImpl.fromJson(Map<String, dynamic> json) =>
      _$$ToolImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'nama_alat')
  final String namaAlat;
  @override
  final String? keterangan;
  @override
  final int status;
  @override
  @JsonKey(name: 'foto_alat')
  final String? fotoAlat;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @override
  final int? qty;

  @override
  String toString() {
    return 'Tool(id: $id, namaAlat: $namaAlat, keterangan: $keterangan, status: $status, fotoAlat: $fotoAlat, createdAt: $createdAt, updatedAt: $updatedAt, qty: $qty)';
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
            (identical(other.qty, qty) || other.qty == qty));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, namaAlat, keterangan, status,
      fotoAlat, createdAt, updatedAt, qty);

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
      final String? keterangan,
      required final int status,
      @JsonKey(name: 'foto_alat') final String? fotoAlat,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'updated_at') required final DateTime updatedAt,
      final int? qty}) = _$ToolImpl;

  factory _Tool.fromJson(Map<String, dynamic> json) = _$ToolImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'nama_alat')
  String get namaAlat;
  @override
  String? get keterangan;
  @override
  int get status;
  @override
  @JsonKey(name: 'foto_alat')
  String? get fotoAlat;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  int? get qty;
  @override
  @JsonKey(ignore: true)
  _$$ToolImplCopyWith<_$ToolImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TaskUser _$TaskUserFromJson(Map<String, dynamic> json) {
  return _TaskUser.fromJson(json);
}

/// @nodoc
mixin _$TaskUser {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'task_id')
  int get taskId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  int get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskUserCopyWith<TaskUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskUserCopyWith<$Res> {
  factory $TaskUserCopyWith(TaskUser value, $Res Function(TaskUser) then) =
      _$TaskUserCopyWithImpl<$Res, TaskUser>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'task_id') int taskId,
      @JsonKey(name: 'user_id') int userId,
      int status,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      User? user});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$TaskUserCopyWithImpl<$Res, $Val extends TaskUser>
    implements $TaskUserCopyWith<$Res> {
  _$TaskUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? taskId = null,
    Object? userId = null,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TaskUserImplCopyWith<$Res>
    implements $TaskUserCopyWith<$Res> {
  factory _$$TaskUserImplCopyWith(
          _$TaskUserImpl value, $Res Function(_$TaskUserImpl) then) =
      __$$TaskUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'task_id') int taskId,
      @JsonKey(name: 'user_id') int userId,
      int status,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      User? user});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$TaskUserImplCopyWithImpl<$Res>
    extends _$TaskUserCopyWithImpl<$Res, _$TaskUserImpl>
    implements _$$TaskUserImplCopyWith<$Res> {
  __$$TaskUserImplCopyWithImpl(
      _$TaskUserImpl _value, $Res Function(_$TaskUserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? taskId = null,
    Object? userId = null,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? user = freezed,
  }) {
    return _then(_$TaskUserImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      taskId: null == taskId
          ? _value.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskUserImpl implements _TaskUser {
  const _$TaskUserImpl(
      {required this.id,
      @JsonKey(name: 'task_id') required this.taskId,
      @JsonKey(name: 'user_id') required this.userId,
      required this.status,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      this.user});

  factory _$TaskUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskUserImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'task_id')
  final int taskId;
  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  final int status;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @override
  final User? user;

  @override
  String toString() {
    return 'TaskUser(id: $id, taskId: $taskId, userId: $userId, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.taskId, taskId) || other.taskId == taskId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, taskId, userId, status, createdAt, updatedAt, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskUserImplCopyWith<_$TaskUserImpl> get copyWith =>
      __$$TaskUserImplCopyWithImpl<_$TaskUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskUserImplToJson(
      this,
    );
  }
}

abstract class _TaskUser implements TaskUser {
  const factory _TaskUser(
      {required final int id,
      @JsonKey(name: 'task_id') required final int taskId,
      @JsonKey(name: 'user_id') required final int userId,
      required final int status,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'updated_at') required final DateTime updatedAt,
      final User? user}) = _$TaskUserImpl;

  factory _TaskUser.fromJson(Map<String, dynamic> json) =
      _$TaskUserImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'task_id')
  int get taskId;
  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  int get status;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  User? get user;
  @override
  @JsonKey(ignore: true)
  _$$TaskUserImplCopyWith<_$TaskUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Mentor _$MentorFromJson(Map<String, dynamic> json) {
  return _Mentor.fromJson(json);
}

/// @nodoc
mixin _$Mentor {
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
  $MentorCopyWith<Mentor> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MentorCopyWith<$Res> {
  factory $MentorCopyWith(Mentor value, $Res Function(Mentor) then) =
      _$MentorCopyWithImpl<$Res, Mentor>;
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
class _$MentorCopyWithImpl<$Res, $Val extends Mentor>
    implements $MentorCopyWith<$Res> {
  _$MentorCopyWithImpl(this._value, this._then);

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
abstract class _$$MentorImplCopyWith<$Res> implements $MentorCopyWith<$Res> {
  factory _$$MentorImplCopyWith(
          _$MentorImpl value, $Res Function(_$MentorImpl) then) =
      __$$MentorImplCopyWithImpl<$Res>;
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
class __$$MentorImplCopyWithImpl<$Res>
    extends _$MentorCopyWithImpl<$Res, _$MentorImpl>
    implements _$$MentorImplCopyWith<$Res> {
  __$$MentorImplCopyWithImpl(
      _$MentorImpl _value, $Res Function(_$MentorImpl) _then)
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
    return _then(_$MentorImpl(
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
class _$MentorImpl implements _Mentor {
  const _$MentorImpl(
      {required this.id,
      required this.name,
      required this.email,
      @JsonKey(name: 'email_verified_at') this.emailVerifiedAt,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt});

  factory _$MentorImpl.fromJson(Map<String, dynamic> json) =>
      _$$MentorImplFromJson(json);

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
    return 'Mentor(id: $id, name: $name, email: $email, emailVerifiedAt: $emailVerifiedAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MentorImpl &&
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
  _$$MentorImplCopyWith<_$MentorImpl> get copyWith =>
      __$$MentorImplCopyWithImpl<_$MentorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MentorImplToJson(
      this,
    );
  }
}

abstract class _Mentor implements Mentor {
  const factory _Mentor(
          {required final int id,
          required final String name,
          required final String email,
          @JsonKey(name: 'email_verified_at') final String? emailVerifiedAt,
          @JsonKey(name: 'created_at') required final DateTime createdAt,
          @JsonKey(name: 'updated_at') required final DateTime updatedAt}) =
      _$MentorImpl;

  factory _Mentor.fromJson(Map<String, dynamic> json) = _$MentorImpl.fromJson;

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
  _$$MentorImplCopyWith<_$MentorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Location _$LocationFromJson(Map<String, dynamic> json) {
  return _Location.fromJson(json);
}

/// @nodoc
mixin _$Location {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'nama_lokasi')
  String get namaLokasi => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationCopyWith<Location> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationCopyWith<$Res> {
  factory $LocationCopyWith(Location value, $Res Function(Location) then) =
      _$LocationCopyWithImpl<$Res, Location>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'nama_lokasi') String namaLokasi,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class _$LocationCopyWithImpl<$Res, $Val extends Location>
    implements $LocationCopyWith<$Res> {
  _$LocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? namaLokasi = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      namaLokasi: null == namaLokasi
          ? _value.namaLokasi
          : namaLokasi // ignore: cast_nullable_to_non_nullable
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
abstract class _$$LocationImplCopyWith<$Res>
    implements $LocationCopyWith<$Res> {
  factory _$$LocationImplCopyWith(
          _$LocationImpl value, $Res Function(_$LocationImpl) then) =
      __$$LocationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'nama_lokasi') String namaLokasi,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class __$$LocationImplCopyWithImpl<$Res>
    extends _$LocationCopyWithImpl<$Res, _$LocationImpl>
    implements _$$LocationImplCopyWith<$Res> {
  __$$LocationImplCopyWithImpl(
      _$LocationImpl _value, $Res Function(_$LocationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? namaLokasi = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$LocationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      namaLokasi: null == namaLokasi
          ? _value.namaLokasi
          : namaLokasi // ignore: cast_nullable_to_non_nullable
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
class _$LocationImpl implements _Location {
  const _$LocationImpl(
      {required this.id,
      @JsonKey(name: 'nama_lokasi') required this.namaLokasi,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt});

  factory _$LocationImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'nama_lokasi')
  final String namaLokasi;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Location(id: $id, namaLokasi: $namaLokasi, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.namaLokasi, namaLokasi) ||
                other.namaLokasi == namaLokasi) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, namaLokasi, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationImplCopyWith<_$LocationImpl> get copyWith =>
      __$$LocationImplCopyWithImpl<_$LocationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationImplToJson(
      this,
    );
  }
}

abstract class _Location implements Location {
  const factory _Location(
          {required final int id,
          @JsonKey(name: 'nama_lokasi') required final String namaLokasi,
          @JsonKey(name: 'created_at') required final DateTime createdAt,
          @JsonKey(name: 'updated_at') required final DateTime updatedAt}) =
      _$LocationImpl;

  factory _Location.fromJson(Map<String, dynamic> json) =
      _$LocationImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'nama_lokasi')
  String get namaLokasi;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$LocationImplCopyWith<_$LocationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
