import 'package:yaoumi/features/notes/data/models/note_model.dart';

abstract class NoteDataSource {
  Future<List<NoteModel>> getAllNotes();
  Future<NoteModel> getNoteById(int id);
  Future<NoteModel> addNote(NoteModel note);
  Future<NoteModel> updateNote(NoteModel note);
  Future<bool> deleteNoteById(int id);
}
