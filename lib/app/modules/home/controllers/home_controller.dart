import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_event_model.dart';
import '../../../data/apis/api_models/get_login_model.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  late SharedPreferences sharedPreferences;
  late LogInModel userData;
  final showEventsProgressBar = true.obs;
  Map<String, dynamic> queryParamsForGetEvent = {};
  List<GetEventsResult> eventList = [];
  final count = 0.obs;
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

  getLocalData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> jsonData =
        jsonDecode(sharedPreferences.getString(StringConstants.userData)!);
    if (jsonData != null) {
      userData = LogInModel.fromJson(jsonData);
      getEventsList(userData.result!.id!);
    }
  }

  openEventDetail(int index) {
    Get.toNamed(Routes.EVENT_DETAIL, arguments: eventList[index]);
  }

  clickOnCrownIcon() {
    Get.toNamed(Routes.BLUECROWN_POINT);
  }

  changeProgressbarStatus(bool value) {
    showEventsProgressBar.value = value;
  }

  Future<void> getEventsList(String userId) async {
    try {
      queryParamsForGetEvent = {
        ApiKeyConstants.userId: userId,
        ApiKeyConstants.status: 'Active'
      };
      GetEventsModel? model =
          await ApiMethods.getEventApi(queryParameters: queryParamsForGetEvent);
      if (model!.status != "0" ?? false) {
        eventList = model.result!;
        print("Get My published events Successfully complete...");
      } else {
        print("Get My published events Failed....");
        CommonWidgets.showMyToastMessage(model.message!);
      }
      changeProgressbarStatus(false);
    } catch (e) {
      print('Error:-${e.toString()}');
      changeProgressbarStatus(false);
    }
  }
}
