import 'dart:convert';

import 'package:blue_crown_template/app/data/apis/api_models/get_common_response_model.dart';
import 'package:blue_crown_template/app/data/apis/api_models/get_my_notification_model.dart';
import 'package:blue_crown_template/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_login_model.dart';
import '../../../data/constants/string_constants.dart';

class NotificationsController extends GetxController {
  final isLoading = true.obs;

  List<MyNotificationResult> notificationList = [];

  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    getLocalData();
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

  clickOnSettingIcon() {
    Get.toNamed(Routes.NOTIFICATION_SETTING);
  }

  getLocalData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> jsonData =
        jsonDecode(sharedPreferences.getString(StringConstants.userData)!);
    if (jsonData != null) {
      LogInModel userData = LogInModel.fromJson(jsonData);
      getMyNotificationList(userData.result!.id!);
    }
  }

  getMyNotificationList(String userId) async {
    try {
      Map<String, String> queryParameters = {ApiKeyConstants.userId: userId};
      MyNotificationModel? myNotificationModel =
          await ApiMethods.getNotificationByUserId(
              queryParameters: queryParameters);
      if (myNotificationModel!.status != "0" &&
          myNotificationModel.result != null) {
        notificationList = myNotificationModel.result!;
        print(" Get Booking Event Successfully complete...");
      } else {
        print("Get Booking Event Failed....");
        CommonWidgets.showMyToastMessage(myNotificationModel.message!);
      }
    } catch (e) {
      print("Error:-${e.toString()}");
    }
    isLoading.value = false;
  }

  deleteMyNotification(String id, int index) async {
    Map<String, String> queryParameters = {ApiKeyConstants.notificationId: id};
    CommonResponseModel? commonResponseModel =
        await ApiMethods.deleteNotificationCountApi(
            queryParameters: queryParameters);
    if (commonResponseModel!.status != "0") {
      notificationList.removeAt(index);
      increment();
      print(" Delete notification Successfully complete...");
    }
  }

  readNotification(String id, int index) async {
    Map<String, String> queryParameters = {ApiKeyConstants.notificationId: id};
    CommonResponseModel? commonResponseModel =
        await ApiMethods.checkNotificationMessageApi(
            queryParameters: queryParameters);
    if (commonResponseModel!.status != "0") {
      notificationList[index].status = 'SEEN';
      increment();
      print(" Delete notification Successfully complete...");
    }
  }
}
