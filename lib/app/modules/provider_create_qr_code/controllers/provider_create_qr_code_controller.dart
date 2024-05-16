import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProviderCreateQrCodeController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController qrNumberController = TextEditingController();
  FocusNode focusName = FocusNode();
  FocusNode focusQrNumber = FocusNode();
  final isName = false.obs;
  final isQrNumber = false.obs;

  void startListener() {
    focusName.addListener(onFocusChange);
    focusQrNumber.addListener(onFocusChange);
  }

  void onFocusChange() {
    isName.value = focusName.hasFocus;
    isQrNumber.value = focusQrNumber.hasFocus;
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
