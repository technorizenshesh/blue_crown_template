import 'dart:convert';

import 'package:blue_crown_template/app/data/apis/api_constants/api_key_constants.dart';
import 'package:blue_crown_template/app/data/constants/icons_constant.dart';
import 'package:blue_crown_template/common/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/text_styles.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_event_model.dart';
import '../../../data/apis/api_models/get_login_model.dart';
import '../../../data/apis/api_models/get_purchase_event_model.dart';
import '../../../data/apis/api_models/get_wallet_model.dart';
import '../../../data/constants/string_constants.dart';

class UsePointsController extends GetxController {
  GetEventsResult getEventsResult = Get.arguments;
  final count = 0.obs;
  final isLoading = false.obs;
  RxString walletAmount = '0'.obs;
  GetClubWalletModel? getClubWalletModel;
  Map<String, String?> parameters = Get.parameters;
  late SharedPreferences sharedPreferences;
  late LogInModel userData;

  Map<String, dynamic> bodyParamsForAddPurchaseEventForm = {};
  AddPurchaseEventModel? addPurchaseEventModel;
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

  Future<void> callingAddPurchaseEventsForm() async {
    try {
      bodyParamsForAddPurchaseEventForm = {
        ApiKeyConstants.userId: userData.result!.id,
        ApiKeyConstants.eventId: getEventsResult.id,
        ApiKeyConstants.amount: getEventsResult.entranceCost,
      };
      isLoading.value = true;
      print(
          "bodyParamsForAddPurchaseEvent:::::$bodyParamsForAddPurchaseEventForm");
      addPurchaseEventModel = await ApiMethods.addPurchaseEventApi(
          bodyParams: bodyParamsForAddPurchaseEventForm);
      if (addPurchaseEventModel!.status != "0" ?? false) {
        isLoading.value = false;
        openSuccessBox();
        print("Purchase  events Successfully complete...");
        CommonWidgets.showMyToastMessage(addPurchaseEventModel!.message!);
      } else {
        isLoading.value = false;
        print("Purchase  events Failed....");
        CommonWidgets.showMyToastMessage(addPurchaseEventModel!.message!);
      }
    } catch (e) {
      isLoading.value = false;
      print("Error:-${e.toString()}");
    }
  }

  /// Show Send Request Box...
  void openSuccessBox() {
    showDialog(
      context: Get.context!,
      builder: (ctx) => AlertDialog(
        title: Center(
            child: Text(
          "Strömpis Entry",
          style: MyTextStyle.titleStyle24bb,
        )),
        insetPadding: EdgeInsets.symmetric(horizontal: 20.px),
        contentPadding: EdgeInsets.zero,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.px))),
        content: Container(
            height: 260.px,
            width: MediaQuery.of(Get.context!).size.width - 60.px,
            padding: EdgeInsets.all(10.px),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10.px,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      IconConstants.icCrown,
                      height: 40.px,
                      width: 50.px,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      width: 10.px,
                    ),
                    Text(
                      '${getEventsResult.entranceCost} P',
                      style: MyTextStyle.titleStyle20bb,
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.px,
                ),
                Image.asset(
                  IconConstants.icDone,
                  fit: BoxFit.cover,
                  width: 100.px,
                  height: 100.px,
                ),
              ],
            )),
        alignment: Alignment.center,
      ),
    );
  }
}
