import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  String? id;
  String? titulo;
  String? descricao;
  bool done;

  Task({
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

  factory Task.fromMap(Map<String, dynamic> map, String documentId) {
    return Task(
      id: documentId,
      titulo: map['titulo'],
      descricao: map['descricao'],
      done: map['done'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source, String documentId) =>
      Task.fromMap(json.decode(source), documentId);
}
