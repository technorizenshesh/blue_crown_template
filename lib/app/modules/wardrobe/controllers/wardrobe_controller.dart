import 'dart:convert';

import 'package:blue_crown_template/common/common_widgets.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_current_jacket_model.dart';
import '../../../data/apis/api_models/get_login_model.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';

class WardrobeController extends GetxController {
  final count = 0.obs;
  late SharedPreferences sharedPreferences;
  late LogInModel userData;
  RxBool inAsyncCall = false.obs;
  RxBool presentData = false.obs;

  List<GetCurrentJacketResult> currentJacketList = [];
  @override
  Future<void> onInit() async {
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
      getCurrentJacket(userData.result!.id ?? '');
    }
  }

  clickOnHistoryCard() {
    Map<String, String> data = {
      ApiKeyConstants.userId: userData.result!.id ?? '',
      ApiKeyConstants.token: userData.result!.token ?? '',
    };
    Get.toNamed(Routes.HISTORY, parameters: data);
  }

  clickOnHandInJacket() {
    Map<String, String> data = {
      ApiKeyConstants.userId: userData.result!.id ?? '',
      ApiKeyConstants.token: userData.result!.token ?? '',
    };
    Get.toNamed(Routes.WARDROBE_SCANNER, parameters: data);
  }

  getCurrentJacket(String userId) async {
    try {
      Map<String, String> queryParameter = {
        ApiKeyConstants.userId: userId,
      };
      GetCurrentJacketModel? getCurrentJacketModel =
          await ApiMethods.getCurrentJacketApi(queryParameters: queryParameter);
      if (getCurrentJacketModel!.status != "0" ?? false) {
        presentData.value = true;
        currentJacketList = getCurrentJacketModel.result!;
        print(" Get CurrentJacket Successfully complete...");
      } else {
        print("Get CurrentJacket Failed....");
        presentData.value = false;
        CommonWidgets.showMyToastMessage(getCurrentJacketModel.message!);
      }
    } catch (e) {
      print('Error :-${e.toString()}');
      presentData.value = false;
      CommonWidgets.showMyToastMessage(e.toString());
    }
  }
}
