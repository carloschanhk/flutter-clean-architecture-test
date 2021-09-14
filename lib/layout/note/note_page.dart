import 'package:clean_architecture_test/local/note/note.dart';
import 'package:clean_architecture_test/router/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'note_page_view_model.dart';
import 'note_editing_dialog.dart';
import 'note_tile.dart';

class NotePage extends GetView<NotePageViewModel> {
  const NotePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Obx(
          () => ListView.builder(
            itemCount: controller.notes.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return NoteTile(
                note: controller.notes[index],
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Get.dialog(
          NoteEditingDialog(),
        ),
      ),
    );
  }
}
