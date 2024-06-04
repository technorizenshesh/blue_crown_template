import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_login_model.dart';
import '../../../data/apis/api_models/get_wallet_model.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';

class BluecrownPointController extends GetxController {
  final count = 0.obs;
  RxString walletAmount = '0'.obs;
  GetClubWalletModel? getClubWalletModel;
  Map<String, String?> parameters = Get.parameters;
  late SharedPreferences sharedPreferences;
  late LogInModel userData;
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
  clickOnUseButton() {
    Get.toNamed(Routes.CLUB_EVENTS);
  }

  clickOnHowDoIGetPoints() {
    Get.toNamed(Routes.HOW_GET_POINT);
  }

  getLocalData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> jsonData =
        jsonDecode(sharedPreferences.getString(StringConstants.userData)!);
    if (jsonData != null) {
      userData = LogInModel.fromJson(jsonData);
      getWalletAccordingClubIdUserId();
    }
  }

  Future<void> getWalletAccordingClubIdUserId() async {
    try {
      Map<String, dynamic> queryParameters = {
        ApiKeyConstants.userId: userData.result!.id ?? ''
      };
      getClubWalletModel = await ApiMethods.getWalletAmountAccordingClubIdApi(
          queryParameters: queryParameters);
      if (getClubWalletModel!.status != "0" ?? false) {
        walletAmount.value = getClubWalletModel!.result!.wallet ?? '0';
        print("Get Club Wallet Amount Successfully complete...");
      } else {
        print("Get Club Wallet Amount Failed....");
        CommonWidgets.showMyToastMessage('Wallet amount not found');
      }
    } catch (e) {
      print("Error:-${e.toString()}");
      CommonWidgets.showMyToastMessage('Wallet amount not found');
    }
    increment();
  }
}
