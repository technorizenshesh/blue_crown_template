import 'package:blue_crown_template/common/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_add_hanger_model.dart';

class ProviderCreateQrCodeController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController qrNumberController = TextEditingController();
  FocusNode focusName = FocusNode();
  FocusNode focusQrNumber = FocusNode();
  final isName = false.obs;
  final isQrNumber = false.obs;
  final isLoading = false.obs;

  void startListener() {
    focusName.addListener(onFocusChange);
    focusQrNumber.addListener(onFocusChange);
  }

  void onFocusChange() {
    isName.value = focusName.hasFocus;
    isQrNumber.value = focusQrNumber.hasFocus;
  }

  Map<String, String?> parameters = Get.parameters;
  Map<String, String> bodyParamsForAddWardrobeQrForm = {};

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

  Future<void> addHangerForm() async {
    if (nameController.text.isNotEmpty && qrNumberController.text.isNotEmpty) {
      try {
        bodyParamsForAddWardrobeQrForm = {
          ApiKeyConstants.clubId: parameters[ApiKeyConstants.userId] ?? '',
          ApiKeyConstants.token: parameters[ApiKeyConstants.token] ?? '',
          ApiKeyConstants.name: nameController.text.toString(),
          ApiKeyConstants.qrCode: qrNumberController.text.toString()
        };
        isLoading.value = true;
        print("bodyParamsForAddHangerForm:::::$bodyParamsForAddWardrobeQrForm");
        AddHangerModel? addHangerModel = await ApiMethods.addHangerListApi(
            bodyParams: bodyParamsForAddWardrobeQrForm);
        if (addHangerModel!.status != "0" ?? false) {
          print("Add Hanger Successfully complete...");
          CommonWidgets.showMyToastMessage(addHangerModel.message!);
          Get.back(result: true);
        } else {
          print("Add Hanger Failed....");
          CommonWidgets.showMyToastMessage(addHangerModel.message!);
        }
      } catch (e) {
        print('Error:-${e.toString()}');
        CommonWidgets.showMyToastMessage(e.toString());
      }
      isLoading.value = false;
      increment();
    } else {
      CommonWidgets.showMyToastMessage('Please enter all fields...');
    }
  }
}
