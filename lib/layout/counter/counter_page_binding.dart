import 'package:clean_architecture_test/injectible/injectible_init.dart';
import 'package:clean_architecture_test/layout/counter/counter_page_view_model.dart';
import 'package:get/get.dart';

class CounterPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CounterPageViewModel>(() => getIt<CounterPageViewModel>());
  }
}
