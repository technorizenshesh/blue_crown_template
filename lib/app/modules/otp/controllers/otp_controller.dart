import 'package:blue_crown_template/app/routes/app_pages.dart';
import 'package:blue_crown_template/common/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_otp_model.dart';

class OtpController extends GetxController {
  TextEditingController fieldOne = TextEditingController();
  TextEditingController fieldTwo = TextEditingController();
  TextEditingController fieldThree = TextEditingController();
  TextEditingController fieldFour = TextEditingController();
  String otpValue = '';
  RxBool isLoading = false.obs;
  final count = 0.obs;
  Map<String, dynamic> bodyParamsForCheckOtpForm = {};
  CheckOtpModel? checkOtpModel;
  Map<String, String?> parameterData = Get.parameters;

  @override
  void onInit() {
    super.onInit();
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
  openNewPassword() {
    Map<String, String> data = {
      'userId': checkOtpModel!.result!.id!,
      'token': checkOtpModel!.result!.token!
    };
    Get.toNamed(Routes.CREATE_NEW_PASSWORD, parameters: data);
  }

  Future<void> callingCheckOtpInForm() async {
    bodyParamsForCheckOtpForm = {
      ApiKeyConstants.email: parameterData[ApiKeyConstants.email],
      ApiKeyConstants.otp: otpValue,
    };
    isLoading.value = true;
    print("bodyParamsForBo:::::$bodyParamsForCheckOtpForm");
    checkOtpModel =
        await ApiMethods.checkOtpApi(bodyParams: bodyParamsForCheckOtpForm);
    if (checkOtpModel!.status != "0" ?? false) {
      print("Forgot Password Successfully complete....");
      CommonWidgets.showMyToastMessage(checkOtpModel!.message!);
      isLoading.value = false;
      openNewPassword();
    } else {
      print("Forgot Password Failed....");
      CommonWidgets.showMyToastMessage(checkOtpModel!.message!);
      isLoading.value = false;
    }
  }
}
