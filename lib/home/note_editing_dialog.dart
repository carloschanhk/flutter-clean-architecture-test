import 'package:clean_architecture_test/injectible/injectible_init.dart';
import 'package:clean_architecture_test/local/note.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'home_page_view_model.dart';

class NoteEditingDialog extends StatelessWidget {
  const NoteEditingDialog({Key? key, this.note}) : super(key: key);

  final Note? note;

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final titleController = TextEditingController();
    final contentController = TextEditingController();
    if (note != null) {
      titleController.text = note!.title;
      contentController.text = note!.content;
    }
    final HomePageViewModel homePageViewModel = getIt<HomePageViewModel>();
    return AlertDialog(
      title: Text("Note"),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: "Title",
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter title";
                }
              },
            ).padding(bottom: 10),
            TextFormField(
              controller: contentController,
              decoration: InputDecoration(
                hintText: "Enter your notes here",
                border: OutlineInputBorder(
                  borderSide: BorderSide(),
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please add some content";
                }
              },
              maxLines: 4,
              minLines: 2,
            )
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              if (note == null) {
                try {
                  homePageViewModel.addNote(
                    Note(
                      title: titleController.text,
                      content: contentController.text,
                    ),
                  );
                } catch (e) {
                  print(e);
                }
              } else {
                note!.title = titleController.text;
                note!.content = contentController.text;
                homePageViewModel.editNote(note!);
              }
              Navigator.pop(context);
            }
          },
          child: Text("Confirm"),
        ),
      ],
    );
  }
}
