import 'dart:convert';
import 'dart:math';

import 'package:blue_crown_template/common/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/colors.dart';
import '../../../../common/date_picker.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_login_model.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';

class SignupController extends GetxController {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode focusFullName = FocusNode();
  FocusNode focusEmail = FocusNode();
  FocusNode focusPhone = FocusNode();
  FocusNode focusPassword = FocusNode();
  FocusNode focusDob = FocusNode();
  final isFullName = true.obs;
  final isEmail = false.obs;
  final isPhone = false.obs;
  final isPassword = false.obs;
  final passwordHide = true.obs;
  final isDob = false.obs;
  final checkBox = false.obs;
  final isLoading = false.obs;

  late SharedPreferences sharedPreferences;

  void startListener() {
    focusFullName.addListener(onFocusChange);
    focusEmail.addListener(onFocusChange);
    focusPhone.addListener(onFocusChange);
    focusPassword.addListener(onFocusChange);
    focusDob.addListener(onFocusChange);
  }

  void onFocusChange() {
    isFullName.value = focusFullName.hasFocus;
    isEmail.value = focusEmail.hasFocus;
    isPhone.value = focusPhone.hasFocus;
    isPassword.value = focusPassword.hasFocus;
    isDob.value = focusDob.hasFocus;
  }

  Map<String, dynamic> bodyParamsForSubmitRegistrationForm = {};
  LogInModel? getSingUpModel;
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

  clickOnDate() async {
    final DateTime? picked = await PickDate.pickDateView(color: primaryColor);
    dobController.text = DateFormat('yyyy-MM-dd').format(picked!);
  }

  String generateRandomString(int len) {
    var r = Random();
    return String.fromCharCodes(
        List.generate(len, (index) => r.nextInt(33) + 89));
  }

  Future<void> callingSubmitRegistrationForm() async {
    if (fullNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        dobController.text.isNotEmpty) {
      try {
        bodyParamsForSubmitRegistrationForm = {
          ApiKeyConstants.fullName: fullNameController.text.toString(),
          ApiKeyConstants.email: emailController.text.toString(),
          ApiKeyConstants.password: passwordController.text.toString(),
          ApiKeyConstants.dob: dobController.text.toString(),
          ApiKeyConstants.mobile: phoneController.text.toString(),
          ApiKeyConstants.lat: "22.7196",
          ApiKeyConstants.lon: "75.8577",
          ApiKeyConstants.registerId: generateRandomString(25),
        };
        isLoading.value = true;
        print(
            "bodyParamsForGetEducationLevel:::::$bodyParamsForSubmitRegistrationForm");
        getSingUpModel = await ApiMethods.submitRegistrationForm(
            bodyParams: bodyParamsForSubmitRegistrationForm);
        if (getSingUpModel!.status != "0" ?? false) {
          print("Registration Successfully complete...");
          saveDataSharedPreference(getSingUpModel);
        } else {
          print("Registration Failed....");
          CommonWidgets.showMyToastMessage(getSingUpModel!.message!);
        }
      } catch (e) {
        print("Error:- $e");
      }
      isLoading.value = false;
    } else {
      CommonWidgets.showMyToastMessage("Please fill all the fields");
    }
  }

  saveDataSharedPreference(LogInModel? userdata) async {
    sharedPreferences = await SharedPreferences.getInstance();
    CommonWidgets.showMyToastMessage("Successfully SignUp Complete");
    print("SignUp Successfully complete...");
    String userDataString = jsonEncode(userdata);
    sharedPreferences.setString(StringConstants.userData, userDataString);
    isLoading.value = false;
    Get.offNamed(Routes.NAVBAR);
  }
}
