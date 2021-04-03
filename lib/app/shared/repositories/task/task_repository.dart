import 'package:todo/app/shared/models/task.dart';

abstract class TaskRepository {
  Future<void> salvar(Task task);
  Future<void> change(Task task);
  Future<List<Task>> findAll();
  Future<void> delete(String id);
  Future<void> doneTask(String id);
}
