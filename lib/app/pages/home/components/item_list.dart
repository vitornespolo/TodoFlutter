import 'package:flutter/material.dart';
import 'package:todo/app/shared/models/tarefa.dart';

class ItemListaWidget extends StatefulWidget {
  final Tarefa task;

  const ItemListaWidget({Key? key, required this.task}) : super(key: key);

  @override
  _ItemListaWidgetState createState() => _ItemListaWidgetState();
}

class _ItemListaWidgetState extends State<ItemListaWidget> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(widget.task.titulo!),
      subtitle: Text(widget.task.descricao!),
      value: widget.task.done,
      onChanged: (bool? value) {
        setState(() {
          widget.task.done = value!;
        });
      },
    );
  }
}
