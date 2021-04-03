import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:todo/app/shared/models/task.dart';
import 'package:todo/app/shared/repositories/task/task_repository.dart';

class HomeController {
  final TaskRepository repository;
  ValueNotifier<bool> isLoading = ValueNotifier(false);
  final ValueNotifier<List<Task>> tasks = ValueNotifier([]);

  HomeController(this.repository);

  toggleLoading() {
    isLoading.value = !isLoading.value;
    isLoading.notifyListeners();
  }

  addTask(Task task) {
    repository.salvar(task);
    listAll();
  }

  changeTask(Task task) {
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
