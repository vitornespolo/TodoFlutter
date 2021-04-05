import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/app/core/models/tarefa.dart';
import 'package:todo/app/core/repositories/task/tarefa_interface.dart';

class TarefaImpl implements TarefaInterface {
  final FirebaseFirestore firebaseFirestore;
  TarefaImpl(this.firebaseFirestore);

  @override
  Future<void> change(Tarefa task) async {
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
  Future<List<Tarefa>> findAll() async {
    QuerySnapshot querySnapshot =
        await this.firebaseFirestore.collection('tarefas').orderBy('done').get();
    return querySnapshot.docs
        .map((QueryDocumentSnapshot doc) => Tarefa.fromMap(doc.data()!, doc.id))
        .toList();
  }

  @override
  Future<void> salvar(Tarefa task) async {
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
