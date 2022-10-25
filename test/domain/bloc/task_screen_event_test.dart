import 'package:todo/domain/bloc/task_screen/task_screen_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TaskScreenEvent', () {
    group('TaskScreenTaskOpened', () {
      test('supports value equality', () {
        expect(
          const TaskScreenTaskOpened(),
          equals(const TaskScreenTaskOpened()),
        );
      });

      test('props are correct', () {
        expect(
          const TaskScreenTaskOpened(index: 0).props,
          equals(<Object?>[0]),
        );
      });
    });

    group('TaskScreenTextChanged', () {
      test('supports value equality', () {
        expect(
          const TaskScreenTextChanged(text: 'text'),
          equals(const TaskScreenTextChanged(text: 'text')),
        );
      });

      test('props are correct', () {
        expect(
          const TaskScreenTextChanged(text: 'text').props,
          equals(<Object?>['text']),
        );
      });
    });

    group('TaskScreenImportanceChanged', () {
      test('supports value equality', () {
        expect(
          const TaskScreenImportanceChanged(importance: 'low'),
          equals(const TaskScreenImportanceChanged(importance: 'low')),
        );
      });

      test('props are correct', () {
        expect(
          const TaskScreenImportanceChanged(importance: 'low').props,
          equals(<Object?>['low']),
        );
      });
    });

    group('TaskScreenDeadlineChanged', () {
      test('supports value equality', () {
        expect(
          const TaskScreenDeadlineChanged(deadline: 25),
          equals(const TaskScreenDeadlineChanged(deadline: 25)),
        );
      });

      test('props are correct', () {
        expect(
          const TaskScreenDeadlineChanged(deadline: 25).props,
          equals(<Object?>[25]),
        );
      });
    });

    group('TaskScreenSaved', () {
      test('supports value equality', () {
        expect(
          TaskScreenSaved(),
          equals(TaskScreenSaved()),
        );
      });

      test('props are correct', () {
        expect(
          TaskScreenSaved().props,
          equals(<Object?>[]),
        );
      });
    });

    group('TaskScreenDeleted', () {
      test('supports value equality', () {
        expect(
          TaskScreenDeleted(),
          equals(TaskScreenDeleted()),
        );
      });

      test('props are correct', () {
        expect(
          TaskScreenDeleted().props,
          equals(<Object?>[]),
        );
      });
    });
  });
}
