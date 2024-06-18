import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_all_user_model.dart';

class ProviderPushNotificationController extends GetxController {
  TextEditingController messageController = TextEditingController();
  FocusNode focusMessage = FocusNode();

  final isMessage = false.obs;
  final inAsyncCall = true.obs;
  final sendEveryOne = false.obs;

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
}
