import 'package:flutter/material.dart';
import 'package:todo/app/shared/components/testo_generico_field.dart';
import 'package:todo/app/shared/models/tarefa.dart';

class RegisterPage extends StatefulWidget {
  late Tarefa? task;
  late int listSize;
  RegisterPage({required this.listSize, this.task});
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late Tarefa _task;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _task = (widget.task != null ? widget.task : Tarefa())!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _task.id != null ? Text('editar tarefa') : Text('nova tarefa'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextoGenericoFormField(
                  initialValue: widget.task != null ? widget.task!.titulo : '',
                  labelText: 'Tiulo',
                  errorMsg: 'Required',
                  onSaved: (value) => _task.titulo = value,
                  formKey: _formKey,
                ),
                SizedBox(
                  height: 10,
                ),
                TextoGenericoFormField(
                  initialValue:
                      widget.task != null ? widget.task!.descricao : '',
                  labelText: 'Descrição',
                  errorMsg: 'Required',
                  maxLines: 6,
                  onSaved: (value) => _task.descricao = value,
                  formKey: _formKey,
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: _save,
                  child: Text('Salvar'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _save() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.of(context).pop<Tarefa>(_task);
    }
  }
}
