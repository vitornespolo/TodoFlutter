import 'package:todo/app/core/models/tarefa.dart';

abstract class TarefaInterface {
  Future<void> salvar(Tarefa task);
  Future<void> change(Tarefa task);
  Future<List<Tarefa>> findAll();
  Future<void> delete(String id);
  Future<void> doneTask(String id);
}
