import 'package:blue_crown_template/app/data/apis/api_constants/api_key_constants.dart';
import 'package:blue_crown_template/app/data/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode focusEmail = FocusNode();
  FocusNode focusPassword = FocusNode();
  final isEmail = false.obs;
  final isPassword = false.obs;
  final passwordHide = true.obs;

  void startListener() {
    focusEmail.addListener(onFocusChange);
    focusPassword.addListener(onFocusChange);
  }

  void onFocusChange() {
    isEmail.value = focusEmail.hasFocus;
    isPassword.value = focusPassword.hasFocus;
  }

  Map<String, String?> parameters = Get.parameters;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    print("hiii sir .....");
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

  clickOnSignUpButton() {
    Get.toNamed(Routes.SIGNUP);
  }

  clickOnForgotPasswordButton() {
    Get.toNamed(Routes.PASSWORD_RESET);
  }

  clickOnLoginButton() {
    if (parameters[ApiKeyConstants.type] == StringConstants.user) {
      Get.toNamed(Routes.NAVBAR);
    } else {
      Get.toNamed(Routes.PROVIDER_NAV_BAR);
    }
  }
}
