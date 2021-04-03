import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/app/shared/models/task.dart';
import 'package:todo/app/shared/repositories/task/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final FirebaseFirestore firebaseFirestore;
  TaskRepositoryImpl(this.firebaseFirestore);

  @override
  Future<void> change(Task task) async {
    await this
        .firebaseFirestore
        .collection('tarefas')
        .doc(task.id)
        .update(task.toMap());
  }

  @override
  Future<void> delete(String id) async {
    await this.firebaseFirestore.collection('tarefas').doc(id).delete();
  }

  @override
  Future<List<Task>> findAll() async {
    QuerySnapshot querySnapshot =
        await this.firebaseFirestore.collection('tarefas').orderBy('done').get();
    return querySnapshot.docs
        .map((QueryDocumentSnapshot doc) => Task.fromMap(doc.data()!, doc.id))
        .toList();
  }

  @override
  Future<void> salvar(Task task) async {
    await this.firebaseFirestore.collection('tarefas').add(task.toMap());
  }

  @override
  Future<void> doneTask(String id) async {
    await this
        .firebaseFirestore
        .collection('tarefas')
        .doc(id)
        .update({'done': true});
  }
}
