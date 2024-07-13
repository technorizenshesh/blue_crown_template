import 'package:blue_crown_template/app/data/apis/api_constants/api_key_constants.dart';
import 'package:blue_crown_template/common/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_common_response_model.dart';

class ContactUsController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  FocusNode focusName = FocusNode();
  FocusNode focusEmail = FocusNode();
  FocusNode focusMessage = FocusNode();
  final isName = false.obs;
  final isEmail = false.obs;
  final isMessage = false.obs;
  final btnLoading = false.obs;

  void startListener() {
    focusName.addListener(onFocusChange);
    focusEmail.addListener(onFocusChange);
    focusMessage.addListener(onFocusChange);
  }

  void onFocusChange() {
    isName.value = focusName.hasFocus;
    isEmail.value = focusEmail.hasFocus;
    isMessage.value = focusMessage.hasFocus;
  }

  Map<String, String?> parameters = Get.parameters;

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

  Future<void> sendEnquiryForm() async {
    if (nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        messageController.text.isNotEmpty) {
      Map<String, String> queryParameters = {
        ApiKeyConstants.userId: parameters[ApiKeyConstants.userId] ?? '',
        ApiKeyConstants.name: nameController.text.toString(),
        ApiKeyConstants.email: emailController.text.toString(),
        ApiKeyConstants.message: messageController.text.toString()
      };
      btnLoading.value = true;
      CommonResponseModel? commonResponseModel =
          await ApiMethods.contactUs(queryParameters: queryParameters);
      if (commonResponseModel!.status != "0") {
        CommonWidgets.showMyToastMessage(commonResponseModel.message ?? '');
        Get.back();
        print("Inquiry  Successfully complete...");
      }
      btnLoading.value = false;
    } else {
      CommonWidgets.showMyToastMessage('Please enter all fields...');
    }
  }
}
