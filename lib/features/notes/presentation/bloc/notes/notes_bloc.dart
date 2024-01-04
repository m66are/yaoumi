import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:yaoumi/core/errors/failure.dart';
import 'package:yaoumi/features/notes/domain/entities/note_entity.dart';
import 'package:yaoumi/features/notes/domain/usecases/add_note_usecase.dart';
import 'package:yaoumi/features/notes/domain/usecases/get_notes_usecase.dart';

part 'notes_event.dart';
part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  final GetNotesUseCase getNotesUseCase;
  final AddNoteUseCase addNoteUseCase;
  NotesBloc({required this.getNotesUseCase, required this.addNoteUseCase})
      : super(NotesInitial()) {
    on<NotesEvent>((NotesEvent event, Emitter<NotesState> emit) async {
      switch (event) {
        case GetAllNotes():
          await _getAllNotes(emit);

          break;
        case AddNote():
          final Either<Failure, NoteEntity> res =
              await addNoteUseCase.call(event.note);
          await res.fold((Failure l) {
            emit(NotesError(message: l.message));
          }, (NoteEntity r) async {
            await _getAllNotes(emit);
          });
          break;
        default:
          throw UnimplementedError();
      }
    });
  }

  Future<void> _getAllNotes(Emitter<NotesState> emit) async {
    emit(NotesLoading());
    await Future.delayed(Duration(seconds: 2));
    final Either<Failure, List<NoteEntity>> res =
        await getNotesUseCase.call(null);
    res.fold((Failure l) {
      emit(NotesError(message: l.message));
    }, (List<NoteEntity> r) {
      emit(NotesLoaded(notes: r));
    });
  }
}
