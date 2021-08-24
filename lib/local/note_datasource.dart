import 'package:clean_architecture_test/local/note.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@singleton
class NoteDatasource {
  final noteBox = Hive.box<Note>("notes");

  void addNote(Note note) {
    noteBox.add(note);
  }

  List<Note> retrieveNotes() {
    return noteBox.values.toList();
  }

  Stream<List<Note>> getNoteStream() {
    return noteBox.watch().map((event) {
      return retrieveNotes();
    }).startWith(retrieveNotes()); //Give initial value to stream
  }
}
