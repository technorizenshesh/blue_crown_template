import 'package:blue_crown_template/app/data/apis/api_constants/api_key_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class PasswordResetController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  FocusNode focusEmail = FocusNode();
  FocusNode focusPhone = FocusNode();
  final isEmail = false.obs;
  final isPhone = false.obs;
  final type = 'Email'.obs;

  void startListener() {
    focusEmail.addListener(onFocusChange);
    focusPhone.addListener(onFocusChange);
  }

  void onFocusChange() {
    isEmail.value = focusEmail.hasFocus;
    isPhone.value = focusPhone.hasFocus;
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    startListener();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  clickOnNexButton() {
    if (emailController.text.isNotEmpty) {
      Map<String, String> data = {
        ApiKeyConstants.email: emailController.text.toString(),
        ApiKeyConstants.type: 'Email'
      };
      Get.toNamed(Routes.OTP, parameters: data);
    } else {
      Map<String, String> data = {
        ApiKeyConstants.email: phoneController.text.toString(),
        ApiKeyConstants.type: 'Mobile'
      };
      Get.toNamed(Routes.OTP, parameters: data);
    }
  }
}
