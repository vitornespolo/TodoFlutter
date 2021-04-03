import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/app/shared/models/task.dart';

class CardComponent extends StatelessWidget {
  final Task task;
  final Function deletarTarefa;
  final Function editarTarefa;
  final Function doneTarefa;

  const CardComponent(
      {Key? key,
      required this.task,
      required this.deletarTarefa,
      required this.editarTarefa,
      required this.doneTarefa})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Card(
          elevation: 5,
          child: Container(
            padding: EdgeInsets.only(
              left: 20,
              top: 20,
              right: 5,
              bottom: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 200,
                  child: Text(
                    task.titulo!,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 150,
                    child: task.done
                        ? Center(
                            child: Text(
                              'Done'.toUpperCase(),
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.black,
                              ),
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Center(
                                child: Container(
                                  child: Ink(
                                    decoration: ShapeDecoration(
                                      color: Colors.transparent,
                                      shape: CircleBorder(),
                                    ),
                                    child: IconButton(
                                      icon: Icon(Icons.edit),
                                      color: Colors.green,
                                      onPressed: () {
                                        editarTarefa(task);
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: Container(
                                  child: Ink(
                                    decoration: ShapeDecoration(
                                      color: Colors.transparent,
                                      shape: CircleBorder(),
                                    ),
                                    child: IconButton(
                                      icon: Icon(Icons.delete),
                                      color: Colors.green,
                                      onPressed: () {
                                        deletarTarefa(task.id);
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: Container(
                                  child: Ink(
                                    decoration: ShapeDecoration(
                                      color: Colors.transparent,
                                      shape: CircleBorder(),
                                    ),
                                    child: IconButton(
                                      icon: Icon(Icons.check),
                                      color: Colors.green,
                                      onPressed: () {
                                        doneTarefa(task.id);
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
