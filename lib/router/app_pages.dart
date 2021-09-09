import 'package:clean_architecture_test/layout/counter/counter_page_binding.dart';
import 'package:clean_architecture_test/layout/counter/counter_page.dart';
import 'package:clean_architecture_test/layout/home/home_page.dart';
import 'package:clean_architecture_test/layout/home/home_page_binding.dart';
import 'package:clean_architecture_test/layout/sms_verification/sms_verification_binding.dart';
import 'package:clean_architecture_test/layout/sms_verification/sms_verification_page.dart';
import 'package:get/get.dart';

import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomePageBinding(),
    ),
    GetPage(
      name: Routes.COUNTER,
      page: () => CounterPage(),
      binding: CounterPageBinding(),
    ),
    GetPage(
      name: Routes.SMS,
      page: () => SMSVerificationPage(),
      binding: SMSVerificationBinding(),
    )
  ];
}
