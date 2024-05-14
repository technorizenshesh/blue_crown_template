import 'package:blue_crown_template/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TableRequestController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController personController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  FocusNode focusName = FocusNode();
  FocusNode focusPerson = FocusNode();
  FocusNode focusEmail = FocusNode();
  FocusNode focusPhone = FocusNode();

  final isName = false.obs;
  final isPerson = false.obs;
  final isEmail = false.obs;
  final isPhone = false.obs;

  void startListener() {
    focusName.addListener(onFocusChange);
    focusPerson.addListener(onFocusChange);
    focusEmail.addListener(onFocusChange);
    focusPhone.addListener(onFocusChange);
  }

  void onFocusChange() {
    isName.value = focusName.hasFocus;
    isPerson.value = focusPerson.hasFocus;
    isEmail.value = focusEmail.hasFocus;
    isPhone.value = focusPhone.hasFocus;
  }

  final count = 0.obs;
  final personCount = 1.obs;
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

  clickOnPlusIcon() {
    personCount.value = ++personCount.value;
    increment();
    print("personCount:...${personCount.value}");
  }

  clickOnMinusIcon() {
    if (personCount.value > 1) {
      personCount.value = --personCount.value;
      print("personCount:...${personCount.value}");
      increment();
    }
  }

  clickOnSignUpButton() {
    Get.toNamed(Routes.SIGNUP);
  }

  clickOnLoginButton() {}
}
