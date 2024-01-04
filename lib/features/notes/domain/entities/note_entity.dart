// ignore_for_file: public_member_api_docs, sort_constructors_first
class NoteEntity {
  final int id;
  final String note;
  final String title;
  final DateTime createdTime;
  final DateTime lastUpdatedTime;
  const NoteEntity({
    required this.id,
    required this.note,
    required this.title,
    required this.createdTime,
    required this.lastUpdatedTime,
  });

  @override
  bool operator ==(covariant NoteEntity other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.note == note &&
        other.title == title &&
        other.createdTime == createdTime &&
        other.lastUpdatedTime == lastUpdatedTime;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        note.hashCode ^
        title.hashCode ^
        createdTime.hashCode ^
        lastUpdatedTime.hashCode;
  }

  @override
  String toString() {
    return 'NoteEntity(id: $id, note: $note, title: $title, createdTime: $createdTime, lastUpdatedTime: $lastUpdatedTime)';
  }
}
