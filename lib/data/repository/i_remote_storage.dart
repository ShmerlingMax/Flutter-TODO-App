import 'package:todo/domain/models/task_model.dart';

abstract class IRemoteStorage {
  Future<void> init();
  int getRevision();
  Future<List<Task>?> getTasks();
  Future<Task?> getTask(index);
  void addTask(Task task);
  Future<void> deleteTask(String id);
  Future<void> updateTask(Task task);
  Future<void> updateTasks(List<Task> tasks);
}
