import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:todo/data/storage.dart';
import 'package:todo/domain/injection.dart';
import 'package:todo/domain/models/task_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/domain/services/firebase_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_screen_event.dart';
part 'task_screen_state.dart';
part 'task_screen_bloc.freezed.dart';

@injectable
class TaskScreenBloc extends Bloc<TaskScreenEvent, TaskScreenState> {
  TaskScreenBloc(this._storage) : super(const TaskScreenState()) {
    on<TaskScreenTaskOpened>(_onTaskOpened);
    on<TaskScreenTextChanged>(_onTextChanged);
    on<TaskScreenImportanceChanged>(_onImportanceChanged);
    on<TaskScreenDeadlineChanged>(_onDeadlineChanged);
    on<TaskScreenSaved>(_onSaved);
    on<TaskScreenDeleted>(_onDeleted);
  }

  final Storage _storage;

  void _onTaskOpened(
    TaskScreenTaskOpened event,
    Emitter<TaskScreenState> emit,
  ) {
    Task task = const Task();
    if (event.index != null) {
      task = _storage.getTask(event.index!);
    }
    emit(
      state.copyWith(
        index: event.index,
        currentTask: task,
      ),
    );
  }

  void _onTextChanged(
    TaskScreenTextChanged event,
    Emitter<TaskScreenState> emit,
  ) {
    emit(
      state.copyWith(
        currentTask: state.currentTask.copyWith(text: event.text),
      ),
    );
  }

  void _onImportanceChanged(
    TaskScreenImportanceChanged event,
    Emitter<TaskScreenState> emit,
  ) {
    emit(
      state.copyWith(
        currentTask: state.currentTask.copyWith(importance: event.importance),
      ),
    );
  }

  void _onDeadlineChanged(
    TaskScreenDeadlineChanged event,
    Emitter<TaskScreenState> emit,
  ) {
    emit(
      state.copyWith(
        currentTask: state.currentTask.copyWith(deadline: event.deadline),
      ),
    );
  }

  Future<void> _onSaved(
    TaskScreenSaved event,
    Emitter<TaskScreenState> emit,
  ) async {
    var task = state.currentTask;
    if (state.index == null) {
      await _storage.addTask(task);
      locator<FirebaseService>().logAddEvent();
    } else {
      await _storage.updateTask(state.index!, task);
    }
  }

  Future<void> _onDeleted(
    TaskScreenDeleted event,
    Emitter<TaskScreenState> emit,
  ) async {
    if (state.index != null) {
      await _storage.deleteTask(state.index!);
      locator<FirebaseService>().logDeleteEvent();
    }
  }
}
