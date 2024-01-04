part of 'notes_bloc.dart';

@immutable
sealed class NotesState {}

final class NotesInitial extends NotesState {}

class NotesLoading extends NotesState {}

class NotesAdded extends NotesState {
  final NoteEntity note;

  NotesAdded({required this.note});
}

class NotesLoaded extends NotesState {
  final List<NoteEntity> notes;

  NotesLoaded({required this.notes});
}

class NotesError extends NotesState {
  final String message;

  NotesError({required this.message});
}
