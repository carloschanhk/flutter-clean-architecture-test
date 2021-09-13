import 'package:clean_architecture_test/injectible/injectible_init.dart';
import 'package:clean_architecture_test/layout/sms_verification/sms_verification_view_model.dart';
import 'package:get/get.dart';

class SMSVerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => getIt<SMSVerificationViewModel>());
  }
}
