import 'package:hive/hive.dart';
import 'package:yaoumi/features/notes/data/models/note_model.dart';

class NoteModelAdapter extends TypeAdapter<NoteModel> {
  @override
  final int typeId = 0;

  @override
  NoteModel read(BinaryReader reader) {
    return NoteModel(
      id: reader.read(),
      note: reader.read(),
      title: reader.read(),
      createdTime: reader.read(),
      lastUpdatedTime: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, NoteModel obj) {
    writer
      ..write(obj.id)
      ..write(obj.note)
      ..write(obj.title)
      ..write(obj.createdTime)
      ..write(obj.lastUpdatedTime);
  }
}
