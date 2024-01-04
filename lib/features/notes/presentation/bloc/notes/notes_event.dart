part of 'notes_bloc.dart';

@immutable
sealed class NotesEvent {}

class GetAllNotes extends NotesEvent {}

class AddNote extends NotesEvent {
  final NoteEntity note;

  AddNote({required this.note});
}

class DeleteNote extends NotesEvent {}
