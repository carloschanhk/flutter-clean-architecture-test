import 'package:clean_architecture_test/layout/counter/count_page_binding.dart';
import 'package:clean_architecture_test/layout/counter/counter_page.dart';
import 'package:clean_architecture_test/layout/home/home_page.dart';
import 'package:get/get.dart';

import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
    ),
    GetPage(
      name: Routes.COUNTER,
      page: () => CounterPage(),
      binding: CounterPageBinding(),
    )
  ];
}
