import 'package:dartz/dartz.dart';
import 'package:yaoumi/core/errors/exceptions.dart';
import 'package:yaoumi/core/errors/failure.dart';
import 'package:yaoumi/features/notes/data/models/note_model.dart';
import 'package:yaoumi/features/notes/data/sources/note_db.dart';
import 'package:yaoumi/features/notes/domain/entities/note_entity.dart';
import 'package:yaoumi/features/notes/domain/repositories/note_repository.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteDataSource _noteDataSource;

  NoteRepositoryImpl({required NoteDataSource noteDataSource})
      : _noteDataSource = noteDataSource;
  @override
  Future<Either<Failure, List<NoteEntity>>> getAllNotes() async {
    try {
      final List<NoteModel> _notes = await _noteDataSource.getAllNotes();
      final List<NoteEntity> notes =
          _notes.map((NoteModel note) => note.toEntity()).toList();
      return Right(notes);
    } on AppException catch (e) {
      return Left(e.toFailure());
    }
  }

  @override
  Future<Either<Failure, NoteEntity>> getNoteById(int id) async {
    try {
      final NoteModel note = await _noteDataSource.getNoteById(id);
      return Right(note.toEntity());
    } on AppException catch (e) {
      return Left(e.toFailure());
    }
  }

  @override
  Future<Either<Failure, NoteEntity>> addNote(NoteEntity note) async {
    try {
      final NoteModel newNote = await _noteDataSource.addNote(NoteModel(
          id: note.id,
          note: note.note,
          title: note.title,
          createdTime: note.createdTime,
          lastUpdatedTime: note.lastUpdatedTime));
      return Right(newNote.toEntity());
    } on AppException catch (e) {
      return Left(e.toFailure());
    }
  }

  @override
  Future<Either<Failure, NoteEntity>> updateNote(NoteEntity note) async {
    try {
      return Right(note);
    } on AppException catch (e) {
      return Left(e.toFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteNoteById(int id) async {
    try {
      return const Right(null);
    } on AppException catch (e) {
      return Left(e.toFailure());
    }
  }
}
