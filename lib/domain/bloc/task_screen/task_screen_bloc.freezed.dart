// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'task_screen_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TaskScreenState {
  TaskScreenStatus get status => throw _privateConstructorUsedError;
  int? get index => throw _privateConstructorUsedError;
  Task get currentTask => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaskScreenStateCopyWith<TaskScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskScreenStateCopyWith<$Res> {
  factory $TaskScreenStateCopyWith(
          TaskScreenState value, $Res Function(TaskScreenState) then) =
      _$TaskScreenStateCopyWithImpl<$Res>;
  $Res call({TaskScreenStatus status, int? index, Task currentTask});

  $TaskCopyWith<$Res> get currentTask;
}

/// @nodoc
class _$TaskScreenStateCopyWithImpl<$Res>
    implements $TaskScreenStateCopyWith<$Res> {
  _$TaskScreenStateCopyWithImpl(this._value, this._then);

  final TaskScreenState _value;
  // ignore: unused_field
  final $Res Function(TaskScreenState) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? index = freezed,
    Object? currentTask = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TaskScreenStatus,
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      currentTask: currentTask == freezed
          ? _value.currentTask
          : currentTask // ignore: cast_nullable_to_non_nullable
              as Task,
    ));
  }

  @override
  $TaskCopyWith<$Res> get currentTask {
    return $TaskCopyWith<$Res>(_value.currentTask, (value) {
      return _then(_value.copyWith(currentTask: value));
    });
  }
}

/// @nodoc
abstract class _$$_TaskScreenStateCopyWith<$Res>
    implements $TaskScreenStateCopyWith<$Res> {
  factory _$$_TaskScreenStateCopyWith(
          _$_TaskScreenState value, $Res Function(_$_TaskScreenState) then) =
      __$$_TaskScreenStateCopyWithImpl<$Res>;
  @override
  $Res call({TaskScreenStatus status, int? index, Task currentTask});

  @override
  $TaskCopyWith<$Res> get currentTask;
}

/// @nodoc
class __$$_TaskScreenStateCopyWithImpl<$Res>
    extends _$TaskScreenStateCopyWithImpl<$Res>
    implements _$$_TaskScreenStateCopyWith<$Res> {
  __$$_TaskScreenStateCopyWithImpl(
      _$_TaskScreenState _value, $Res Function(_$_TaskScreenState) _then)
      : super(_value, (v) => _then(v as _$_TaskScreenState));

  @override
  _$_TaskScreenState get _value => super._value as _$_TaskScreenState;

  @override
  $Res call({
    Object? status = freezed,
    Object? index = freezed,
    Object? currentTask = freezed,
  }) {
    return _then(_$_TaskScreenState(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TaskScreenStatus,
      index: index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      currentTask: currentTask == freezed
          ? _value.currentTask
          : currentTask // ignore: cast_nullable_to_non_nullable
              as Task,
    ));
  }
}

/// @nodoc

class _$_TaskScreenState implements _TaskScreenState {
  const _$_TaskScreenState(
      {this.status = TaskScreenStatus.initial,
      this.index,
      this.currentTask = const Task()});

  @override
  @JsonKey()
  final TaskScreenStatus status;
  @override
  final int? index;
  @override
  @JsonKey()
  final Task currentTask;

  @override
  String toString() {
    return 'TaskScreenState(status: $status, index: $index, currentTask: $currentTask)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TaskScreenState &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.index, index) &&
            const DeepCollectionEquality()
                .equals(other.currentTask, currentTask));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(index),
      const DeepCollectionEquality().hash(currentTask));

  @JsonKey(ignore: true)
  @override
  _$$_TaskScreenStateCopyWith<_$_TaskScreenState> get copyWith =>
      __$$_TaskScreenStateCopyWithImpl<_$_TaskScreenState>(this, _$identity);
}

abstract class _TaskScreenState implements TaskScreenState {
  const factory _TaskScreenState(
      {final TaskScreenStatus status,
      final int? index,
      final Task currentTask}) = _$_TaskScreenState;

  @override
  TaskScreenStatus get status;
  @override
  int? get index;
  @override
  Task get currentTask;
  @override
  @JsonKey(ignore: true)
  _$$_TaskScreenStateCopyWith<_$_TaskScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
