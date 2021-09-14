import 'package:clean_architecture_test/injectible/injectible_init.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import 'note_page_view_model.dart';

class NotePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => getIt<NotePageViewModel>());
  }
}
