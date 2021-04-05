import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo/app/pages/home/home_controller.dart';
import 'package:todo/app/pages/cadastro/cadastro_page.dart';
import 'package:todo/app/core/components/card.dart';
import 'package:todo/app/core/models/tarefa.dart';
import 'package:todo/app/core/repositories/task/tarefa_impl.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Tarefa> tasks = [];

  final HomeController controller = HomeController(
    TarefaImpl(FirebaseFirestore.instance),
  );

  @override
  void initState() {
    super.initState();
    controller.listAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO'),
      ),
      body: RefreshIndicator(
        child: FutureBuilder(
          builder: (_, __) {
            return ValueListenableBuilder(
              builder: (_, __, ___) {
                if (controller.isLoading.value) {
                  return Container(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [CircularProgressIndicator()],
                    ),
                  );
                }
                return ValueListenableBuilder(
                  builder: (_, __, ___) {
                    return ListView.builder(
                      itemCount: controller.tasks.value.length,
                      itemBuilder: (context, index) => CardComponent(
                        tarefa: controller.tasks.value[index],
                        editarTarefa: editTask,
                        deletarTarefa: showAlert,
                        doneTarefa: doneTask,
                      ),
                    );
                  },
                  valueListenable: controller.tasks,
                );
              },
              valueListenable: controller.isLoading,
            );
          },
        ),
        onRefresh: () {
          return controller.listAll();
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          Tarefa? task = await Navigator.of(context).push<Tarefa>(
            MaterialPageRoute(builder: (context) {
              return CadastroPage(listSize: tasks.length);
            }),
          );
          controller.addTask(task!);
        },
      ),
    );
  }

  editTask(Tarefa task) async {
    Tarefa? taskUpdated = await Navigator.of(context).push<Tarefa>(
      MaterialPageRoute(builder: (context) {
        return CadastroPage(listSize: tasks.length, task: task);
      }),
    );
    controller.changeTask(taskUpdated!);
  }

  doneTask(String id) {
    controller.doneTask(id);
  }

  showAlert(String id) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            'Você quer apagar esta tarefa?',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              controller.deletar(id);
              Navigator.pop(context);
            },
            child: Text('Ok'),
          ),
        ],
      ),
    );
  }
}
