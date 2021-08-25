import 'package:clean_architecture_test/local/note/note.dart';
import 'package:clean_architecture_test/local/note/note_datasource.dart';
import 'package:injectable/injectable.dart';

@injectable
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
