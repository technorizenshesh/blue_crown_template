import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_pickImage.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_hand_jacket_model.dart';
import '../../../data/constants/string_constants.dart';

class WardrobeScannerController extends GetxController {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  final count = 0.obs;
  final resultCount = 0.obs;
  Map<String, dynamic> bodyParamsForHangJacketForm = {};
  Map<String, String?> parameters = Get.parameters;
  HangJacketModel? hangJacketModel;
  RxBool inAsyncCall = false.obs;
  @override
  Future<void> onInit() async {
    super.onInit();
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
  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      result = scanData;
      resultCount.value++;
      if (result != null) {
        if (resultCount.value == 1) {
          print('Qr Code:- ${result!.code}');
          CommonWidgets.showMyToastMessage('Scanned ...');
          showAlertDialog(result!.code ?? '');
        }
      }
    });
  }

  void showAlertDialog(String qrCode) {
    showDialog(
      context: Get.context!,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return MyAlertDialog(
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text(
                StringConstants.no,
                style: Theme.of(Get.context!).textTheme.titleSmall?.copyWith(
                    fontSize: 10.px,
                    color: Theme.of(Get.context!).primaryColor),
              ),
              onPressed: () {
                Get.back();
              },
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text(
                StringConstants.yes,
                style: Theme.of(Get.context!).textTheme.titleSmall?.copyWith(
                    fontSize: 10.px,
                    color: Theme.of(Get.context!).primaryColor),
              ),
              onPressed: () {
                Get.back();
                callingHangJacket(qrCode);
              },
            ),
          ],
          title: selectAlertTextView(),
          content: contentTextView(),
        );
      },
    );
  }

  Widget selectAlertTextView() => Text(
        StringConstants.areYouSure,
        style: Theme.of(Get.context!)
            .textTheme
            .displayMedium
            ?.copyWith(fontSize: 18.px),
      );

  Widget contentTextView() => Text(
        StringConstants.areYouWantToHandInJacket,
        style: Theme.of(Get.context!)
            .textTheme
            .titleSmall
            ?.copyWith(fontSize: 14.px),
      );

  Future<void> callingHangJacket(String qrCode) async {
    try {
      bodyParamsForHangJacketForm = {
        ApiKeyConstants.userId: parameters[ApiKeyConstants.userId],
        ApiKeyConstants.qrCode: qrCode,
        ApiKeyConstants.token: parameters[ApiKeyConstants.token],
      };
      inAsyncCall.value = true;
      print("bodyParamsForHangJacketForm:::::$bodyParamsForHangJacketForm");
      hangJacketModel = await ApiMethods.hangJacketApi(
          bodyParams: bodyParamsForHangJacketForm);
      if (hangJacketModel!.status != "0" ?? false) {
        print("Hang Jacket Successfully complete...");
        CommonWidgets.showMyToastMessage(hangJacketModel!.message!);
        Get.back();
      } else {
        print("Hang Jacket Failed....");
        CommonWidgets.showMyToastMessage(hangJacketModel!.message!);
      }
    } catch (e) {
      print("Error:- ${e.toString()}");
      CommonWidgets.showMyToastMessage('${e.toString()}');
    }
    inAsyncCall.value = false;
  }
}
