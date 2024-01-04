// domain/repositories/note_repository.dart

import 'package:dartz/dartz.dart';
import 'package:yaoumi/core/errors/failure.dart';
import 'package:yaoumi/features/notes/domain/entities/note_entity.dart';

abstract class NoteRepository {
  Future<Either<Failure, List<NoteEntity>>> getAllNotes();
  Future<Either<Failure, NoteEntity>> getNoteById(int id);
  Future<Either<Failure, NoteEntity>> addNote(NoteEntity note);
  Future<Either<Failure, NoteEntity>> updateNote(NoteEntity note);
  Future<Either<Failure, void>> deleteNoteById(int id);
}
