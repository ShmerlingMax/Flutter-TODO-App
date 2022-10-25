import 'package:todo/domain/models/task_model.dart';

abstract class IApi {
  Future<void> init();
  int getRevision();
  void setRevision(int revision);
  Future<List<Task>?> getTasks();
  Future<List<Task>?> updateTasks(List<Task> tasks);
  Future<Task?> getTask(String id);
  Future<Task?> addTask(Task task);
  Future<Task?> updateTask(Task task);
  Future<Task?> deleteTask(String id);
}
