import 'dart:convert';

import 'package:blue_crown_template/app/data/apis/api_constants/api_key_constants.dart';
import 'package:blue_crown_template/app/data/constants/string_constants.dart';
import 'package:blue_crown_template/common/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_login_model.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode focusEmail = FocusNode();
  FocusNode focusPassword = FocusNode();
  final isEmail = false.obs;
  final isPassword = false.obs;
  final passwordHide = true.obs;
  final isLoading = false.obs;

  void startListener() {
    focusEmail.addListener(onFocusChange);
    focusPassword.addListener(onFocusChange);
  }

  void onFocusChange() {
    isEmail.value = focusEmail.hasFocus;
    isPassword.value = focusPassword.hasFocus;
  }

  Map<String, String?> parameters = Get.parameters;

  Map<String, dynamic> bodyParamsForSubmitLoginForm = {};
  LogInModel? logInModel;
  late SharedPreferences sharedPreferences;

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

  clickOnSignUpButton() {
    Get.toNamed(Routes.SIGNUP);
  }

  clickOnForgotPasswordButton() {
    Get.toNamed(Routes.PASSWORD_RESET);
  }

  openNavBarView() {
    if (parameters[ApiKeyConstants.type] == StringConstants.user) {
      Get.toNamed(Routes.NAVBAR);
    } else {
      Get.toNamed(Routes.PROVIDER_NAV_BAR);
    }
  }

  Future<void> clickOnLoginButton() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      try {
        bodyParamsForSubmitLoginForm = {
          ApiKeyConstants.email: emailController.text.toString(),
          ApiKeyConstants.password: passwordController.text.toString(),
          ApiKeyConstants.registerId: '89ukjkjahakjlfal',
        };
        print("bodyParamsForGetLogin:::::$bodyParamsForSubmitLoginForm");
        isLoading.value = true;

        logInModel =
            await ApiMethods.logInApi(bodyParams: bodyParamsForSubmitLoginForm);
        if (logInModel!.status != "0" ?? false) {
          print("LOGIN Type:- ${logInModel!.result!.type}");
          saveDataSharedPreference(logInModel);
        } else {
          print("LogIn Failed....");
          CommonWidgets.showMyToastMessage(logInModel!.message!);
        }
      } catch (e) {
        print('Error:-' + e.toString());
        CommonWidgets.showMyToastMessage(
            'Server issue please try again after some time ');
      }
      isLoading.value = false;
    } else {
      CommonWidgets.showMyToastMessage("Please enter email and password");
    }
  }

  saveDataSharedPreference(LogInModel? userdata) async {
    sharedPreferences = await SharedPreferences.getInstance();
    CommonWidgets.showMyToastMessage("Successfully Login Complete");
    print("LogIn Successfully complete...");
    String userDataString = jsonEncode(userdata);
    sharedPreferences.setString(StringConstants.userData, userDataString);
    isLoading.value = false;
    openNavBarView();
  }
}
