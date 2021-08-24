import 'package:clean_architecture_test/home/home_page_view_model.dart';
import 'package:clean_architecture_test/injectible/injectible_init.dart';
import 'package:clean_architecture_test/local/note.dart';
import 'package:flutter/material.dart';

import 'note_editing_dialog.dart';
import 'note_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homePageViewModel = getIt<HomePageViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
      ),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: StreamBuilder<List<Note>>(
            stream: homePageViewModel.getNoteStream(),
            builder: (context, AsyncSnapshot<List<Note>> noteStream) {
              if (noteStream.hasData) {
                if (noteStream.data!.length == 0) {
                  return Text("Please add note");
                }
                return ListView.builder(
                  itemCount: noteStream.data!.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return NoteTile(
                      note: noteStream.data![index],
                    );
                  },
                );
              }
              return Text("Something goes wrong");
            },
          )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => showDialog(
          context: context,
          builder: (context) => NoteEditingDialog(),
        ),
      ),
    );
  }
}
