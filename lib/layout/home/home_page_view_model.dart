import 'package:clean_architecture_test/data/note/note_repository.dart';
import 'package:clean_architecture_test/local/note/note.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomePageViewModel {
  NoteRepository noteRepository;
  HomePageViewModel(
    this.noteRepository,
  );

  void addNote(Note note) {
    noteRepository.addNote(note);
  }

  void deleteNote(Note note) {
    note.delete();
  }

  void editNote(Note note) {
    note.save();
  }

  // Act like a LiveData
  Stream<List<Note>> getNoteStream() {
    return noteRepository.getNoteStream();
  }
}
