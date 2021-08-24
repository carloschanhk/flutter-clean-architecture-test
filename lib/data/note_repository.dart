import 'package:clean_architecture_test/local/note.dart';
import 'package:clean_architecture_test/local/note_datasource.dart';
import 'package:injectable/injectable.dart';

@singleton
class NoteRepository {
  NoteDatasource noteDatasource;
  NoteRepository(this.noteDatasource);

  void addNote(Note note) {
    noteDatasource.addNote(note);
  }

  Stream<List<Note>> getNoteStream() {
    return noteDatasource.getNoteStream();
  }
}
