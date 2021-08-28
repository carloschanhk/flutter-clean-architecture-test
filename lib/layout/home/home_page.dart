import 'package:auto_route/auto_route.dart';
import 'package:clean_architecture_test/injectible/injectible_init.dart';
import 'package:clean_architecture_test/layout/counter/counter_page.dart';
import 'package:clean_architecture_test/local/note/note.dart';
import 'package:clean_architecture_test/router/app_router.gr.dart';
import 'package:clean_architecture_test/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_page_view_model.dart';
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
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.COUNTER);
            },
            icon: Icon(
              Icons.keyboard_arrow_right,
              size: 30,
            ),
            padding: EdgeInsets.symmetric(horizontal: 40),
          ),
        ],
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
