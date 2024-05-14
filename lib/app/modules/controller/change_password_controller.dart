import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  TextEditingController passwordController = TextEditingController();
  TextEditingController cnfPasswordController = TextEditingController();
  FocusNode focusPassword = FocusNode();
  FocusNode focusCnfPassword = FocusNode();
  final isPassword = false.obs;
  final isCnfPassword = false.obs;
  final passwordHide = true.obs;

  void startListener() {
    focusPassword.addListener(onFocusChange);
    focusCnfPassword.addListener(onFocusChange);
  }

  void onFocusChange() {
    isPassword.value = focusPassword.hasFocus;
    isCnfPassword.value = focusCnfPassword.hasFocus;
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

  clickOnPasswordEyeButton() {
    passwordHide.value = !passwordHide.value;
    increment();
  }

  clickOnLoginButton() {
    Get.back();
  }

  clickOnSignUpButton() {}
}
