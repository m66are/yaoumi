import 'package:hive/hive.dart';
import 'package:yaoumi/core/errors/exceptions.dart';
import 'package:yaoumi/features/notes/data/models/note_model.dart';
import 'package:yaoumi/features/notes/data/sources/note_db.dart';

class LocalNoteDataSource implements NoteDataSource {
  static const String _boxName = 'notes';

  @override
  Future<NoteModel> addNote(NoteModel note) async {
    try {
      final Box<NoteModel> box = await Hive.openBox<NoteModel>(_boxName);
      await box.add(note);
      await box.close();
      return note;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> deleteNoteById(int id) async {
    try {
      final Box<NoteModel> box = await Hive.openBox<NoteModel>(_boxName);
      await box.delete(id);
      await box.close();
      return true;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<NoteModel>> getAllNotes() async {
    try {
      final Box<NoteModel> box = await Hive.openBox<NoteModel>(_boxName);
      final List<NoteModel> notes = box.values.toList();
      await box.close();
      return notes;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<NoteModel> getNoteById(int id) async {
    try {
      final Box<NoteModel> box = await Hive.openBox<NoteModel>(_boxName);
      final NoteModel? note = box.get(id);
      await box.close();

      if (note != null) {
        return note;
      } else {
        throw DataNotFoundException();
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<NoteModel> updateNote(NoteModel note) async {
    try {
      final Box<NoteModel> box = await Hive.openBox<NoteModel>(_boxName);
      await box.put(note.id, note);
      await box.close();
      return note;
    } catch (e) {
      rethrow;
    }
  }
}
