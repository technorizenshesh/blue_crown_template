import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProviderPushNotificationController extends GetxController {
  TextEditingController messageController = TextEditingController();
  FocusNode focusMessage = FocusNode();

  final isMessage = false.obs;
  final sendEveryOne = false.obs;

  void startListener() {
    focusMessage.addListener(onFocusChange);
  }

  List<String> usersList = [
    'Hanna Saris',
    'Kianna Franci',
    'John Sohn',
    'Hanna Saris',
    'Makenna Rosser',
    'Paityn Westervelt'
  ];
  List<bool> selectedUsersStatus = [false, false, false, false, false, false];

  void onFocusChange() {
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

  changeNotificationStatus(int index, bool value) {
    selectedUsersStatus[index] = value;
    increment();
  }
}
