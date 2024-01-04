import 'dart:convert';

import 'package:yaoumi/features/notes/domain/entities/note_entity.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class NoteModel {
  final int id;
  final String note;
  final String title;
  final DateTime createdTime;
  final DateTime lastUpdatedTime;
  NoteModel({
    required this.id,
    required this.note,
    required this.title,
    required this.createdTime,
    required this.lastUpdatedTime,
  });

  NoteEntity toEntity() {
    return NoteEntity(
        id: id,
        title: title,
        note: note,
        createdTime: createdTime,
        lastUpdatedTime: lastUpdatedTime);
  }

  // Create a NoteModel from NoteEntity
  factory NoteModel.fromEntity(NoteEntity entity) {
    return NoteModel(
      id: entity.id,
      title: entity.title,
      note: entity.note,
      createdTime: entity.createdTime,
      lastUpdatedTime: entity.lastUpdatedTime,
    );
  }

  // ------ JSON ---- //

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'note': note,
      'title': title,
      'createdTime': createdTime.toUtc().toString(),
      'lastUpdatedTime': lastUpdatedTime.toUtc().toString(),
    };
  }

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      id: map['id'] as int,
      note: map['note'] as String,
      title: map['title'] as String,
      createdTime: DateTime.parse(map['createdTime'] as String),
      lastUpdatedTime: DateTime.parse(map['lastUpdatedTime'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory NoteModel.fromJson(String source) =>
      NoteModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
