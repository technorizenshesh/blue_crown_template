import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProviderConsumerRegisterController extends GetxController {
  TextEditingController searchController = TextEditingController();
  FocusNode focusSearch = FocusNode();
  final isSearch = false.obs;
  void startListener() {
    focusSearch.addListener(onFocusChange);
  }

  void onFocusChange() {
    isSearch.value = focusSearch.hasFocus;
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
