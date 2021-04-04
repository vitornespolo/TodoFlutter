import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Tarefa {
  String? id;
  String? titulo;
  String? descricao;
  bool done;

  Tarefa({
    this.id,
    this.titulo,
    this.descricao,
    this.done = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'titulo': titulo,
      'descricao': descricao,
      'done': done,
    };
  }

  factory Tarefa.fromMap(Map<String, dynamic> map, String documentId) {
    return Tarefa(
      id: documentId,
      titulo: map['titulo'],
      descricao: map['descricao'],
      done: map['done'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Tarefa.fromJson(String source, String documentId) =>
      Tarefa.fromMap(json.decode(source), documentId);
}
