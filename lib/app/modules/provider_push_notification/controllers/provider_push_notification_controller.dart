import 'package:blue_crown_template/app/data/apis/api_models/get_common_response_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_all_user_model.dart';

class ProviderPushNotificationController extends GetxController {
  TextEditingController messageController = TextEditingController();
  FocusNode focusMessage = FocusNode();

  final isMessage = false.obs;
  final inAsyncCall = true.obs;
  final sendEveryOne = false.obs;
  final isBtnLoading = false.obs;
  Map<String, String?> parameters = Get.parameters;

  void startListener() {
    focusMessage.addListener(onFocusChange);
  }

  List<AllUsersResult> userList = [];

  void onFocusChange() {
    isMessage.value = focusMessage.hasFocus;
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    startListener();
    showAllUserList();
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
    userList[index].selected = value;
    increment();
  }

  Future<void> showAllUserList() async {
    try {
      AllUsersModel? allUsersModel = await ApiMethods.getAllUsersApi();
      if (allUsersModel!.status != "0" && allUsersModel.result!.isNotEmpty) {
        userList = allUsersModel.result!;
      } else {
        print("get all user Failed....");
        CommonWidgets.showMyToastMessage(allUsersModel.message!);
      }
    } catch (e) {
      print('Error:-' + e.toString());
      CommonWidgets.showMyToastMessage('get all user are not present ...');
    }
    inAsyncCall.value = false;
    increment();
  }

  Future<void> sendPushNotification() async {
    if (messageController.text.isNotEmpty) {
      try {
        Map<String, dynamic> bodyParamsForPushNotificationForm = {
          ApiKeyConstants.userId: parameters[ApiKeyConstants.userId],
        };
        isBtnLoading.value = true;
        print(
            "bodyParamsForPushNotificationParams:::::$bodyParamsForPushNotificationForm");
        CommonResponseModel? commonResponseModel =
            await ApiMethods.pushNotification(
                bodyParams: bodyParamsForPushNotificationForm);
        if (commonResponseModel!.status != "0" ?? false) {
          print("PushNotification Successfully complete...");
          Get.back(result: true);
          // CommonWidgets.showMyToastMessage(addEventModel!.message!);
        } else {
          print("PushNotification Failed....");
          CommonWidgets.showMyToastMessage(commonResponseModel.message!);
        }
      } catch (e) {
        isBtnLoading.value = false;
        print('Error :-${e.toString()}');
        CommonWidgets.showMyToastMessage('Some things is wrong ...');
      }
    } else {
      CommonWidgets.showMyToastMessage('Please enter message...');
    }
    isBtnLoading.value = false;
  }
}
