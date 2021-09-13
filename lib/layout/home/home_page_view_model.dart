import 'package:clean_architecture_test/data/note/note_repository.dart';
import 'package:clean_architecture_test/local/note/note.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomePageViewModel extends GetxController {
  NoteRepository noteRepository;
  HomePageViewModel(
    this.noteRepository,
  );
  RxList<Note> notes = <Note>[].obs;

  @override
  void onInit() {
    initNotes();
    super.onInit();
  }

  initNotes() {
    noteRepository.getNoteStream().listen((updatedNotes) {
      notes.value = updatedNotes;
    });
  }

  void addNote(Note note) {
    noteRepository.addNote(note);
  }

  void deleteNote(Note note) {
    note.delete();
  }

  void editNote(Note note) {
    note.save();
  }
}
