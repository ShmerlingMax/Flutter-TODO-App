import 'package:todo/domain/models/task_model.dart';

abstract class ILocalStorage {
  Future<List<Task>> getTasks();
  Stream<List<Task>> getTasksStreamController();
  Task getTask(int index);
  Future<void> addTask(Task task);
  Future<void> deleteTask(int index);
  Future<void> updateTask(int index, Task task);
  Future<void> replaceTasks(List<Task> tasks);
}
