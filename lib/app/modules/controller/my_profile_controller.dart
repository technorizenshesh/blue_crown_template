import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../common/colors.dart';
import '../../../common/date_picker.dart';

class MyProfileController extends GetxController {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  FocusNode focusFullName = FocusNode();
  FocusNode focusEmail = FocusNode();
  FocusNode focusPhone = FocusNode();
  FocusNode focusDob = FocusNode();
  final isFullName = true.obs;
  final isEmail = false.obs;
  final isPhone = false.obs;
  final isDob = false.obs;
  final checkBox = false.obs;

  void startListener() {
    focusFullName.addListener(onFocusChange);
    focusEmail.addListener(onFocusChange);
    focusPhone.addListener(onFocusChange);
    focusDob.addListener(onFocusChange);
  }

  void onFocusChange() {
    isFullName.value = focusFullName.hasFocus;
    isEmail.value = focusEmail.hasFocus;
    isPhone.value = focusPhone.hasFocus;
    isDob.value = focusDob.hasFocus;
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

  clickOnLoginButton() {
    Get.back();
  }

  clickOnSignUpButton() {}

  clickOnDate() async {
    final DateTime? picked = await PickDate.pickDateView(color: primaryColor);
    dobController.text = DateFormat('yyyy-MM-dd').format(picked!);
  }
}
