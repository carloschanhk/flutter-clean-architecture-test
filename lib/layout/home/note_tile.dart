import 'package:clean_architecture_test/injectible/injectible_init.dart';
import 'package:clean_architecture_test/local/note/note.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import 'home_page_view_model.dart';
import 'note_editing_dialog.dart';

class NoteTile extends StatelessWidget {
  const NoteTile({Key? key, required this.note}) : super(key: key);

  final Note note;

  @override
  Widget build(BuildContext context) {
    final HomePageViewModel homePageViewModel = getIt<HomePageViewModel>();
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            note.title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ).padding(vertical: 10),
          Text(note.content).padding(vertical: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () => showDialog(
                  context: context,
                  builder: (_) => NoteEditingDialog(
                    note: note,
                  ),
                ),
                child: Text("Edit"),
              ),
              TextButton(
                onPressed: () => homePageViewModel.deleteNote(note),
                child: Text("Delete"),
              ),
            ],
          )
        ],
      ).padding(horizontal: 20),
    ).padding(bottom: 10);
  }
}
