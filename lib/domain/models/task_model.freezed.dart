// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'task_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Task _$TaskFromJson(Map<String, dynamic> json) {
  return _Task.fromJson(json);
}

/// @nodoc
mixin _$Task {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get text => throw _privateConstructorUsedError;
  @HiveField(2)
  String get importance => throw _privateConstructorUsedError;
  @HiveField(3)
  @JsonKey(includeIfNull: false)
  int? get deadline => throw _privateConstructorUsedError;
  @HiveField(4)
  bool get done => throw _privateConstructorUsedError;
  @HiveField(5)
  @JsonKey(name: 'created_at')
  int get created => throw _privateConstructorUsedError;
  @HiveField(6)
  @JsonKey(name: 'changed_at')
  int get updated => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_updated_by')
  String get lastUpdatedBy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res>;
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String text,
      @HiveField(2) String importance,
      @HiveField(3) @JsonKey(includeIfNull: false) int? deadline,
      @HiveField(4) bool done,
      @HiveField(5) @JsonKey(name: 'created_at') int created,
      @HiveField(6) @JsonKey(name: 'changed_at') int updated,
      @JsonKey(name: 'last_updated_by') String lastUpdatedBy});
}

/// @nodoc
class _$TaskCopyWithImpl<$Res> implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  final Task _value;
  // ignore: unused_field
  final $Res Function(Task) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
    Object? importance = freezed,
    Object? deadline = freezed,
    Object? done = freezed,
    Object? created = freezed,
    Object? updated = freezed,
    Object? lastUpdatedBy = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      importance: importance == freezed
          ? _value.importance
          : importance // ignore: cast_nullable_to_non_nullable
              as String,
      deadline: deadline == freezed
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as int?,
      done: done == freezed
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
      created: created == freezed
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as int,
      updated: updated == freezed
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as int,
      lastUpdatedBy: lastUpdatedBy == freezed
          ? _value.lastUpdatedBy
          : lastUpdatedBy // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_TaskCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$$_TaskCopyWith(_$_Task value, $Res Function(_$_Task) then) =
      __$$_TaskCopyWithImpl<$Res>;
  @override
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String text,
      @HiveField(2) String importance,
      @HiveField(3) @JsonKey(includeIfNull: false) int? deadline,
      @HiveField(4) bool done,
      @HiveField(5) @JsonKey(name: 'created_at') int created,
      @HiveField(6) @JsonKey(name: 'changed_at') int updated,
      @JsonKey(name: 'last_updated_by') String lastUpdatedBy});
}

/// @nodoc
class __$$_TaskCopyWithImpl<$Res> extends _$TaskCopyWithImpl<$Res>
    implements _$$_TaskCopyWith<$Res> {
  __$$_TaskCopyWithImpl(_$_Task _value, $Res Function(_$_Task) _then)
      : super(_value, (v) => _then(v as _$_Task));

  @override
  _$_Task get _value => super._value as _$_Task;

  @override
  $Res call({
    Object? id = freezed,
    Object? text = freezed,
    Object? importance = freezed,
    Object? deadline = freezed,
    Object? done = freezed,
    Object? created = freezed,
    Object? updated = freezed,
    Object? lastUpdatedBy = freezed,
  }) {
    return _then(_$_Task(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      text: text == freezed
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
      importance: importance == freezed
          ? _value.importance
          : importance // ignore: cast_nullable_to_non_nullable
              as String,
      deadline: deadline == freezed
          ? _value.deadline
          : deadline // ignore: cast_nullable_to_non_nullable
              as int?,
      done: done == freezed
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
      created: created == freezed
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as int,
      updated: updated == freezed
          ? _value.updated
          : updated // ignore: cast_nullable_to_non_nullable
              as int,
      lastUpdatedBy: lastUpdatedBy == freezed
          ? _value.lastUpdatedBy
          : lastUpdatedBy // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 0, adapterName: 'TaskAdapter')
class _$_Task with DiagnosticableTreeMixin implements _Task {
  const _$_Task(
      {@HiveField(0) this.id = '',
      @HiveField(1) this.text = '',
      @HiveField(2) this.importance = 'basic',
      @HiveField(3) @JsonKey(includeIfNull: false) this.deadline,
      @HiveField(4) this.done = false,
      @HiveField(5) @JsonKey(name: 'created_at') this.created = 0,
      @HiveField(6) @JsonKey(name: 'changed_at') this.updated = 0,
      @JsonKey(name: 'last_updated_by') this.lastUpdatedBy = '0'});

  factory _$_Task.fromJson(Map<String, dynamic> json) => _$$_TaskFromJson(json);

  @override
  @JsonKey()
  @HiveField(0)
  final String id;
  @override
  @JsonKey()
  @HiveField(1)
  final String text;
  @override
  @JsonKey()
  @HiveField(2)
  final String importance;
  @override
  @HiveField(3)
  @JsonKey(includeIfNull: false)
  final int? deadline;
  @override
  @JsonKey()
  @HiveField(4)
  final bool done;
  @override
  @HiveField(5)
  @JsonKey(name: 'created_at')
  final int created;
  @override
  @HiveField(6)
  @JsonKey(name: 'changed_at')
  final int updated;
  @override
  @JsonKey(name: 'last_updated_by')
  final String lastUpdatedBy;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Task(id: $id, text: $text, importance: $importance, deadline: $deadline, done: $done, created: $created, updated: $updated, lastUpdatedBy: $lastUpdatedBy)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Task'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('text', text))
      ..add(DiagnosticsProperty('importance', importance))
      ..add(DiagnosticsProperty('deadline', deadline))
      ..add(DiagnosticsProperty('done', done))
      ..add(DiagnosticsProperty('created', created))
      ..add(DiagnosticsProperty('updated', updated))
      ..add(DiagnosticsProperty('lastUpdatedBy', lastUpdatedBy));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Task &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.text, text) &&
            const DeepCollectionEquality()
                .equals(other.importance, importance) &&
            const DeepCollectionEquality().equals(other.deadline, deadline) &&
            const DeepCollectionEquality().equals(other.done, done) &&
            const DeepCollectionEquality().equals(other.created, created) &&
            const DeepCollectionEquality().equals(other.updated, updated) &&
            const DeepCollectionEquality()
                .equals(other.lastUpdatedBy, lastUpdatedBy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(text),
      const DeepCollectionEquality().hash(importance),
      const DeepCollectionEquality().hash(deadline),
      const DeepCollectionEquality().hash(done),
      const DeepCollectionEquality().hash(created),
      const DeepCollectionEquality().hash(updated),
      const DeepCollectionEquality().hash(lastUpdatedBy));

  @JsonKey(ignore: true)
  @override
  _$$_TaskCopyWith<_$_Task> get copyWith =>
      __$$_TaskCopyWithImpl<_$_Task>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TaskToJson(
      this,
    );
  }
}

abstract class _Task implements Task {
  const factory _Task(
      {@HiveField(0) final String id,
      @HiveField(1) final String text,
      @HiveField(2) final String importance,
      @HiveField(3) @JsonKey(includeIfNull: false) final int? deadline,
      @HiveField(4) final bool done,
      @HiveField(5) @JsonKey(name: 'created_at') final int created,
      @HiveField(6) @JsonKey(name: 'changed_at') final int updated,
      @JsonKey(name: 'last_updated_by') final String lastUpdatedBy}) = _$_Task;

  factory _Task.fromJson(Map<String, dynamic> json) = _$_Task.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get text;
  @override
  @HiveField(2)
  String get importance;
  @override
  @HiveField(3)
  @JsonKey(includeIfNull: false)
  int? get deadline;
  @override
  @HiveField(4)
  bool get done;
  @override
  @HiveField(5)
  @JsonKey(name: 'created_at')
  int get created;
  @override
  @HiveField(6)
  @JsonKey(name: 'changed_at')
  int get updated;
  @override
  @JsonKey(name: 'last_updated_by')
  String get lastUpdatedBy;
  @override
  @JsonKey(ignore: true)
  _$$_TaskCopyWith<_$_Task> get copyWith => throw _privateConstructorUsedError;
}
