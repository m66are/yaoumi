import 'package:dartz/dartz.dart';
import 'package:yaoumi/core/errors/failure.dart';
import 'package:yaoumi/core/utils/usecase.dart';
import 'package:yaoumi/features/notes/domain/entities/note_entity.dart';
import 'package:yaoumi/features/notes/domain/repositories/note_repository.dart';

class AddNoteUseCase implements UseCase<NoteEntity, NoteEntity> {
  final NoteRepository repository;

  AddNoteUseCase(this.repository);
  @override
  Future<Either<Failure, NoteEntity>> call(NoteEntity params) {
    return repository.addNote(params);
  }
}
