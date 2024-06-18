import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_event_model.dart';
import '../../../data/apis/api_models/get_login_model.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';
import '../../home/views/home_view.dart';
import '../../scanner/views/scanner_view.dart';
import '../../wardrobe/views/wardrobe_view.dart';

class ProviderNavBarController extends GetxController {
  final count = 0.obs;
  final tabIndex = 1.obs;
  late SharedPreferences sharedPreferences;
  late LogInModel userData;
  final isLoading = true.obs;

  final clubName = ''.obs;
  final clubAdminName = ''.obs;
  final showActiveEventsProgressBar = true.obs;
  final showInactiveEventsProgressBar = true.obs;
  Map<String, dynamic> queryParamsForGetEvent = {};
  List<GetEventsResult> activeEventList = [];
  List<GetEventsResult> inactiveEventList = [];

  List<Widget> pages = [
    const WardrobeView(),
    const HomeView(),
    const ScannerView()
  ];
  @override
  void onInit() {
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

  changeIndex(int index) {
    Map<String, String> data = {
      ApiKeyConstants.userId: userData.result!.id ?? '',
      ApiKeyConstants.token: userData.result!.token ?? ''
    };
    increment();
    switch (index) {
      case 0:
        Get.toNamed(Routes.PROVIDER_WARDROBE, parameters: data);
        break;
      case 1:
        Get.toNamed(Routes.PROVIDER_PUBLISH_EVENT, parameters: data);
        break;
      case 2:
        Get.toNamed(Routes.PROVIDER_CONSUMER_REGISTER, parameters: data);
        break;
    }
  }

  openActiveEventDetail(int index, String type) async {
    Map<String, String> data = {
      ApiKeyConstants.userId: userData.result!.id ?? '',
      ApiKeyConstants.type: type,
    };
    dynamic result = await Get.toNamed(Routes.PROVIDER_EVENT_DETAIL,
        parameters: data, arguments: activeEventList[index]);

    if (result) {
      changeActiveProgressbarStatus(true);
      changeInactiveProgressbarStatus(true);
      await getActiveEventsList(userData.result!.id ?? '');
      await getInactiveEventsList(userData.result!.id ?? '');
      increment();
    }
  }

  openInactiveEventDetail(int index, String type) async {
    Map<String, String> data = {
      ApiKeyConstants.userId: userData.result!.id ?? '',
      ApiKeyConstants.type: type,
    };
    dynamic result = await Get.toNamed(Routes.PROVIDER_EVENT_DETAIL,
        parameters: data, arguments: inactiveEventList[index]);
    if (result) {
      changeInactiveProgressbarStatus(true);
      changeActiveProgressbarStatus(true);
      await getActiveEventsList(userData.result!.id ?? '');
      await getInactiveEventsList(userData.result!.id ?? '');
      increment();
    }
  }

  changeActiveProgressbarStatus(bool value) {
    showActiveEventsProgressBar.value = value;
  }

  changeInactiveProgressbarStatus(bool value) {
    showInactiveEventsProgressBar.value = value;
  }

  getLocalData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> jsonData =
        jsonDecode(sharedPreferences.getString(StringConstants.userData)!);
    if (jsonData != null) {
      userData = LogInModel.fromJson(jsonData);
      clubName.value = userData.result!.fullName ?? '';
      clubAdminName.value = userData.result!.fullName ?? '';
      isLoading.value = false;
      increment();
      getActiveEventsList(userData.result!.id ?? '');
      getInactiveEventsList(userData.result!.id ?? '');
    }
  }

  Future<void> getActiveEventsList(String userId) async {
    try {
      queryParamsForGetEvent = {
        ApiKeyConstants.userId: userId,
        ApiKeyConstants.status: 'Active'
      };
      GetEventsModel? model =
          await ApiMethods.getEventApi(queryParameters: queryParamsForGetEvent);
      if (model!.status != "0" ?? false) {
        activeEventList = model.result!;
        print("Get My published events Successfully complete...");
      } else {
        print("Get My published events Failed....");
        CommonWidgets.showMyToastMessage(model.message!);
      }
      changeActiveProgressbarStatus(false);
    } catch (e) {
      print('Error:-${e.toString()}');
      changeActiveProgressbarStatus(false);
    }
  }

  Future<void> getInactiveEventsList(String userId) async {
    try {
      queryParamsForGetEvent = {
        ApiKeyConstants.userId: userId,
        ApiKeyConstants.status: 'Deactive'
      };
      GetEventsModel? model =
          await ApiMethods.getEventApi(queryParameters: queryParamsForGetEvent);
      if (model!.status != "0" ?? false) {
        inactiveEventList = model.result!;
        print("Get My published events Successfully complete...");
      } else {
        print("Get My published events Failed....");
        CommonWidgets.showMyToastMessage(model.message!);
      }
      changeInactiveProgressbarStatus(false);
    } catch (e) {
      print('Error:-${e.toString()}');
      changeInactiveProgressbarStatus(false);
    }
  }
}
