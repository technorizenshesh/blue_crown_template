import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../common/colors.dart';
import '../../../../common/date_picker.dart';

class ProviderPublishEventController extends GetxController {
  RxBool showNearEventsProgressBar = false.obs;
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController eventNameController = TextEditingController();
  TextEditingController styleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  FocusNode focusDescription = FocusNode();
  FocusNode focusTime = FocusNode();
  FocusNode focusDate = FocusNode();
  FocusNode focusEventName = FocusNode();
  FocusNode focusStyle = FocusNode();
  final count = 0.obs;
  final RxDouble maxAge = 80.0.obs;
  final RxDouble minAge = 18.0.obs;
  final RxDouble points = 50.0.obs;
  final RxDouble entraceCost = 70.0.obs;
  final isDescription = false.obs;
  final isTime = false.obs;
  final isDate = false.obs;
  final isEventName = false.obs;
  final isStyle = false.obs;

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

  changeAge(double value) {
    maxAge.value = value;
  }

  changePoints(double value) {
    points.value = value;
  }

  changeEntranceCost(double value) {
    entraceCost.value = value;
  }

  void startListener() {
    focusEventName.addListener(onFocusChange);
    focusTime.addListener(onFocusChange);
    focusDate.addListener(onFocusChange);
    focusStyle.addListener(onFocusChange);
    focusDescription.addListener(onFocusChange);
  }

  void onFocusChange() {
    isEventName.value = focusEventName.hasFocus;
    isTime.value = focusTime.hasFocus;
    isDate.value = focusDate.hasFocus;
    isStyle.value = focusStyle.hasFocus;
    isDescription.value = focusDescription.hasFocus;
  }

  clickOnDate() async {
    final DateTime? picked = await PickDate.pickDateView(color: primaryColor);
    dateController.text = DateFormat('yyyy-MM-dd').format(picked!);
  }
}
