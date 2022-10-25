part of 'main_screen_bloc.dart';

enum MainScreenStatus { initial, loading, success, failure }

@freezed
class MainScreenState with _$MainScreenState {
  const factory MainScreenState({
    @Default(MainScreenStatus.initial) MainScreenStatus status,
    @Default([]) List<Task> tasks,
    @Default(false) bool completedTasksVisibility,
  }) = _MainScreenState;
}
