import 'package:clean_architecture_test/injectible/injectible_init.dart';
import 'package:clean_architecture_test/layout/home/home_page_view_model.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class HomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => getIt<HomePageViewModel>());
  }
}
