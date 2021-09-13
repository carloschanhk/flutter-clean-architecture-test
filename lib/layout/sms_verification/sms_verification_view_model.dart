import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@injectable
class SMSVerificationViewModel extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController smsCodeController = TextEditingController();
  RxBool isButtonEnabled = false.obs;

  void onSMSCodeChanged(String input) {
    isButtonEnabled.value = input.length == 6;
  }

  void submitSMSCode() {
    if (formKey.currentState!.validate()) {
      Get.showSnackbar(GetBar(
        message: "Request Sent",
        duration: Duration(seconds: 3),
      ));
    }
  }

  void autoFillFromSMS(String codeFromSMS) {
    if (codeFromSMS.length == 6 && GetUtils.isNumericOnly(codeFromSMS)) {
      smsCodeController.text = codeFromSMS;
    }
  }
}
