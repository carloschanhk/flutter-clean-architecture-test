import 'package:bloc/bloc.dart';
import 'package:clean_architecture_test/data/note_repository.dart';
import 'package:clean_architecture_test/injectible/injectible_init.dart';
import 'package:clean_architecture_test/local/note.dart';
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
