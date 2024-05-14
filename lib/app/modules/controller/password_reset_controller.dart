import 'package:blue_crown_template/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PasswordResetController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  FocusNode focusEmail = FocusNode();
  FocusNode focusPhone = FocusNode();
  final isEmail = false.obs;
  final isPhone = false.obs;

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

  clickOnSignUpButton() {
    Get.toNamed(Routes.SIGNUP);
  }

  clickOnNexButton() {
    Get.toNamed(Routes.CREATE_NEW_PASSWORD);
  }
}
