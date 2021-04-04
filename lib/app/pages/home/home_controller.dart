import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:todo/app/shared/models/tarefa.dart';
import 'package:todo/app/shared/repositories/task/tarefa_interface.dart';

class HomeController {
  final TarefaInterface repository;
  ValueNotifier<bool> isLoading = ValueNotifier(false);
  final ValueNotifier<List<Tarefa>> tasks = ValueNotifier([]);

  HomeController(this.repository);

  toggleLoading() {
    isLoading.value = !isLoading.value;
    isLoading.notifyListeners();
  }

  addTask(Tarefa task) {
    repository.salvar(task);
    listAll();
  }

  changeTask(Tarefa task) {
    repository.change(task);
    listAll();
  }

  Future<void> listAll() async {
    toggleLoading();
    tasks.value = await repository.findAll();
    tasks.notifyListeners();
    toggleLoading();
  }

  deletar(String id) {
    repository.delete(id);
    listAll();
  }

  doneTask(String id) {
    repository.doneTask(id);
    listAll();
  }
}
