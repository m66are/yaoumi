import 'package:dartz/dartz.dart';
import 'package:yaoumi/core/errors/failure.dart';
import 'package:yaoumi/core/utils/usecase.dart';
import 'package:yaoumi/features/notes/domain/entities/note_entity.dart';
import 'package:yaoumi/features/notes/domain/repositories/note_repository.dart';

class GetNotesUseCase implements UseCase<List<NoteEntity>, void> {
  final NoteRepository repository;

  GetNotesUseCase(this.repository);
  @override
  Future<Either<Failure, List<NoteEntity>>> call(Null) {
    return repository.getAllNotes();
  }
}
