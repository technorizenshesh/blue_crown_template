import 'package:blue_crown_template/common/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_common_response_model.dart';
import '../../../routes/app_pages.dart';

class NewPasswordController extends GetxController {
  TextEditingController cnfPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode focusCnfPassword = FocusNode();
  FocusNode focusPassword = FocusNode();
  Map<String, String?> parameterData = Get.parameters;
  Map<String, dynamic> bodyParamsForNewPasswordForm = {};
  CommonResponseModel? commonResponseModel;

  final isPassword = false.obs;
  final isCnfPassword = false.obs;
  final passwordHide = true.obs;
  final isLoading = false.obs;

  void startListener() {
    focusPassword.addListener(onFocusChange);
    focusCnfPassword.addListener(onFocusChange);
  }

  void onFocusChange() {
    isPassword.value = focusPassword.hasFocus;
    isCnfPassword.value = focusCnfPassword.hasFocus;
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

  clickOnPasswordEyeButton() {
    passwordHide.value = !passwordHide.value;
    increment();
  }

  Future<void> callingNewPasswordInForm() async {
    bodyParamsForNewPasswordForm = {
      ApiKeyConstants.userId: parameterData['userId'],
      ApiKeyConstants.token: parameterData['token'],
      ApiKeyConstants.password: cnfPasswordController.text.toString()
    };
    isLoading.value = true;
    print("bodyParamsForNewPassword:::::$bodyParamsForNewPasswordForm");
    commonResponseModel = await ApiMethods.newPasswordApi(
        bodyParams: bodyParamsForNewPasswordForm);
    if (commonResponseModel!.status != "0" ?? false) {
      print("New Password Successfully complete....");
      CommonWidgets.showMyToastMessage(commonResponseModel!.message!);
      isLoading.value = false;
      Get.offNamedUntil(Routes.LOGIN, (route) => false);
    } else {
      print("New Password Failed....");
      CommonWidgets.showMyToastMessage(commonResponseModel!.message!);
      isLoading.value = false;
    }
  }
}
