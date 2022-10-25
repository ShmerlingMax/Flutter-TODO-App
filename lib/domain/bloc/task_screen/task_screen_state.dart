part of 'task_screen_bloc.dart';

enum TaskScreenStatus { initial, loading, success, failure }

@freezed
class TaskScreenState with _$TaskScreenState {
  const factory TaskScreenState({
    @Default(TaskScreenStatus.initial) TaskScreenStatus status,
    int? index,
    @Default(Task()) Task currentTask,
  }) = _TaskScreenState;
}
