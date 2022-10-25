import 'package:todo/domain/models/task_model.dart';
import 'package:todo/data/storage.dart';
import 'package:todo/domain/bloc/task_screen/task_screen_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

import 'test_injectable.dart';

class MockStorage extends Mock implements Storage {}

class FakeTask extends Fake implements Task {}

void main() {
  late MockStorage mockStorage;
  late Task task;

  setUpAll(() {
    configureDependencies();
    registerFallbackValue((FakeTask()));
  });

  setUp(() {
    task = const Task(
      id: 'id_1',
      text: 'text',
      importance: 'low',
      deadline: 1,
      done: true,
      created: 1,
      updated: 2,
      lastUpdatedBy: '0',
    );

    mockStorage = MockStorage();
  });

  group('TaskScreenBloc', () {
    TaskScreenBloc buildBloc() {
      return TaskScreenBloc(mockStorage);
    }

    group('constructor', () {
      test('works properly', () => expect(buildBloc, returnsNormally));

      test('has correct initial state', () {
        expect(
          buildBloc().state,
          equals(const TaskScreenState()),
        );
      });
    });

    group('TaskScreenTaskOpened', () {
      blocTest<TaskScreenBloc, TaskScreenState>(
        'emits state with updated index and currentTask'
        'when storage get task',
        setUp: () => {
          when(
            () => mockStorage.getTask(any()),
          ).thenAnswer((_) => task)
        },
        build: buildBloc,
        act: (bloc) => bloc.add(const TaskScreenTaskOpened(index: 0)),
        verify: (_) {
          verify(() => mockStorage.getTask(any(that: equals(0)))).called(1);
        },
        expect: () => [
          TaskScreenState(index: 0, currentTask: task),
        ],
      );

      blocTest<TaskScreenBloc, TaskScreenState>(
        'emits state with updated index and currentTask'
        'when storage doesn\'t get task',
        build: buildBloc,
        act: (bloc) => bloc.add(const TaskScreenTaskOpened()),
        expect: () => [
          const TaskScreenState(index: null, currentTask: Task()),
        ],
      );
    });

    group('TaskScreenTextChanged', () {
      blocTest<TaskScreenBloc, TaskScreenState>(
        'emits state with updated currentTask.text',
        build: buildBloc,
        seed: () => const TaskScreenState(),
        act: (bloc) => bloc.add(const TaskScreenTextChanged(text: 'text')),
        expect: () => [
          const TaskScreenState(currentTask: Task(text: 'text')),
        ],
      );
    });

    group('TaskScreenImportanceChanged', () {
      blocTest<TaskScreenBloc, TaskScreenState>(
        'emits state with updated currentTask.importance',
        build: buildBloc,
        seed: () => const TaskScreenState(),
        act: (bloc) =>
            bloc.add(const TaskScreenImportanceChanged(importance: 'low')),
        expect: () => [
          const TaskScreenState(currentTask: Task(importance: 'low')),
        ],
      );
    });

    group('TaskScreenDeadlineChanged', () {
      blocTest<TaskScreenBloc, TaskScreenState>(
        'emits state with updated currentTask.deadline',
        build: buildBloc,
        seed: () => const TaskScreenState(),
        act: (bloc) => bloc.add(const TaskScreenDeadlineChanged(deadline: 25)),
        expect: () => [
          const TaskScreenState(currentTask: Task(deadline: 25)),
        ],
      );
    });

    group('TaskScreenSaved', () {
      blocTest<TaskScreenBloc, TaskScreenState>(
        'adds task using storage',
        setUp: () {
          when(() => mockStorage.addTask(any())).thenAnswer((_) async {});
        },
        build: buildBloc,
        seed: () => const TaskScreenState(),
        act: (bloc) => bloc.add(TaskScreenSaved()),
        verify: (bloc) {
          verify(
            () => mockStorage.addTask(
              any(
                that: isA<Task>()
                    .having((t) => t.id, 'id', equals(''))
                    .having((t) => t.text, 'text', equals(''))
                    .having((t) => t.importance, 'importance', equals('basic'))
                    .having((t) => t.deadline, 'deadline', equals(null))
                    .having((t) => t.done, 'done', equals(false))
                    .having((t) => t.created, 'created', equals(0))
                    .having((t) => t.updated, 'updated', equals(0))
                    .having(
                      (t) => t.lastUpdatedBy,
                      'lastUpdatedBy',
                      equals('0'),
                    ),
              ),
            ),
          ).called(1);
        },
      );

      blocTest<TaskScreenBloc, TaskScreenState>(
        'updates task using storage',
        setUp: () {
          when(() => mockStorage.updateTask(any(), any()))
              .thenAnswer((_) async {});
        },
        build: buildBloc,
        seed: () => const TaskScreenState(index: 0),
        act: (bloc) => bloc.add(TaskScreenSaved()),
        verify: (bloc) {
          verify(
            () => mockStorage.updateTask(
              any(that: equals(0)),
              any(
                that: isA<Task>()
                    .having((t) => t.id, 'id', equals(''))
                    .having((t) => t.text, 'text', equals(''))
                    .having((t) => t.importance, 'importance', equals('basic'))
                    .having((t) => t.deadline, 'deadline', equals(null))
                    .having((t) => t.done, 'done', equals(false))
                    .having((t) => t.created, 'created', equals(0))
                    .having((t) => t.updated, 'updated', equals(0))
                    .having(
                      (t) => t.lastUpdatedBy,
                      'lastUpdatedBy',
                      equals('0'),
                    ),
              ),
            ),
          ).called(1);
        },
      );
    });

    group('TaskScreenDeleted', () {
      blocTest<TaskScreenBloc, TaskScreenState>(
        'deletes task using storage',
        setUp: () {
          when(() => mockStorage.deleteTask(any())).thenAnswer((_) async {});
        },
        build: buildBloc,
        seed: () => const TaskScreenState(index: 0),
        act: (bloc) => bloc.add(TaskScreenDeleted()),
        verify: (bloc) {
          verify(
            () => mockStorage.deleteTask(
              any(that: equals(0)),
            ),
          ).called(1);
        },
      );

      blocTest<TaskScreenBloc, TaskScreenState>(
        'not deletes task using storage',
        build: buildBloc,
        seed: () => const TaskScreenState(),
        act: (bloc) => bloc.add(TaskScreenDeleted()),
        verify: (bloc) {
          verifyNever(() => mockStorage.deleteTask(any()));
        },
      );
    });
  });
}
