import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/toggle/gf_toggle.dart';
import 'package:getwidget/types/gf_toggle_type.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/text_styles.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_login_model.dart';
import '../../../data/apis/api_models/get_scan_event_qr_model.dart';
import '../../../data/constants/string_constants.dart';

class ScannerController extends GetxController {
  RxBool showCongratulation = false.obs;
  RxBool isLoading = false.obs;
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  final count = 0.obs;
  final resultCount = 0.obs;
  late SharedPreferences sharedPreferences;
  late LogInModel userData;
  Map<String, dynamic> bodyParamsForScanEventQrForm = {};
  ScanEventQrModel? scanEventQrModel;
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
    }
  }

  changeCongratulation(bool value) {
    showCongratulation.value = value;
  }

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      result = scanData;
      resultCount.value++;
      if (result != null) {
        if (resultCount.value == 1) {
          print('Qr Code:- ${result!.code}');
          CommonWidgets.showMyToastMessage('Scanned ...');
          changeCongratulation(false);
          openAlertBox(Get.context!);
        }
      }
    });
  }

  /// Show QR Alert Box...
  void openAlertBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Center(
            child: Text(
          "Scan event qr-code and earn points ${result!.code}",
          style: MyTextStyle.titleStyle20bb,
          textAlign: TextAlign.center,
        )),
        insetPadding: EdgeInsets.symmetric(horizontal: 20.px),
        contentPadding: EdgeInsets.zero,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.px))),
        content: Container(
          height: 160.px,
          width: MediaQuery.of(context).size.width - 60.px,
          padding: EdgeInsets.all(10.px),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GFToggle(
                  onChanged: (val) async {
                    if (val!) {
                      Get.back();
                      isLoading.value = true;
                      await callingScanEventQrForEarnPointsForm(result!.code!);
                      result = null;
                      resultCount.value = 0;
                      increment();
                      //openCodeAlertBox(context,"50");
                    }
                  },
                  value: false,
                  disabledTrackColor: Colors.grey,
                  enabledTrackColor: primary3Color,
                  enabledThumbColor: primaryColor,
                  disabledThumbColor: primary3Color,
                  type: GFToggleType.ios,
                ),
                SizedBox(
                  height: 5.px,
                ),
                Text(
                  'Earn Points',
                  style: MyTextStyle.titleStyle16bb,
                )
              ],
            ),
          ),
        ),
        alignment: Alignment.center,
        actions: <Widget>[
          Center(
            child: TextButton(
                onPressed: () {
                  Get.back();
                  resultCount.value = 0;
                },
                child: Text(
                  'Swipe to earn event points!',
                  style: MyTextStyle.titleStyle16blb,
                )),
          ),
        ],
      ),
    );
  }

  Future<void> callingScanEventQrForEarnPointsForm(String qrCode) async {
    try {
      bodyParamsForScanEventQrForm = {
        ApiKeyConstants.userId: userData.result!.id ?? '',
        ApiKeyConstants.qrCode: qrCode,
        ApiKeyConstants.token: userData.result!.token ?? '',
      };
      isLoading.value = true;
      print("bodyParamsForScanEventQrForm:::::$bodyParamsForScanEventQrForm");
      scanEventQrModel = await ApiMethods.scanEventQrCodeApi(
          bodyParams: bodyParamsForScanEventQrForm);
      if (scanEventQrModel!.status != "0" ?? false) {
        print("Scan Event Qr Successfully complete....");
        // CommonWidgets.showMyToastMessage(scanEventQrModel!.message!);
        changeCongratulation(true);
      } else {
        print("Scan Event Qr Failed....");
      }
    } catch (e) {
      print("Error:-${e.toString()}");
      CommonWidgets.showMyToastMessage('Invalid Qr Code .....');
    }
    isLoading.value = false;
  }
}
