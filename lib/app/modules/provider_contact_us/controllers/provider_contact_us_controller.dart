import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProviderContactUsController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  FocusNode focusName = FocusNode();
  FocusNode focusEmail = FocusNode();
  FocusNode focusMessage = FocusNode();
  final isName = false.obs;
  final isEmail = false.obs;
  final isMessage = false.obs;

  void startListener() {
    focusName.addListener(onFocusChange);
    focusEmail.addListener(onFocusChange);
    focusMessage.addListener(onFocusChange);
  }

  void onFocusChange() {
    isName.value = focusName.hasFocus;
    isEmail.value = focusEmail.hasFocus;
    isMessage.value = focusMessage.hasFocus;
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
}
