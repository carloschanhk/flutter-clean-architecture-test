import 'package:clean_architecture_test/layout/sms_verification/sms_verification_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class SMSVerificationPage extends GetView<SMSVerificationViewModel> {
  const SMSVerificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("SMS Verification"),
        ),
        body: Form(
          key: controller.formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 20,
            ),
            child: Column(
              children: [
                PinCodeTextField(
                  autoFocus: true,
                  appContext: context,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(10),
                    activeFillColor: Colors.grey.shade200,
                    inactiveFillColor: Colors.grey.shade200,
                    selectedFillColor: Colors.grey.shade200,
                  ),
                  enableActiveFill: true,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  controller: controller.smsCodeController,
                  keyboardType: TextInputType.number,
                  length: 6,
                  onCompleted: (input) {
                    // Auto submission once the SMS code is completed
                    controller.submitSMSCode();
                  },
                  onChanged: (input) {
                    controller.onSMSCodeChanged(input);
                  },
                  // Validator might not be neccessary here
                  // with inputFormatter and disabled button
                  validator: (input) {
                    if (input!.length != 6 || !GetUtils.isNumericOnly(input)) {
                      return "Invalid code";
                    }
                  },
                  autovalidateMode: AutovalidateMode.disabled,
                ),
                Obx(
                  // Only enable button when the smscode is filled
                  () => TextButton(
                    onPressed: (controller.isButtonEnabled.value)
                        ? controller.submitSMSCode
                        : controller.submitSMSCode,
                    child: Text("Send"),
                  ),
                ),
                // Mimic the action of autofill from SMS OTP
                TextButton(
                  onPressed: () {
                    controller.autoFillFromSMS("329221");
                  },
                  child: Text("Mimic SMS"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
