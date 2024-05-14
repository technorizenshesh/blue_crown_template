import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../common/common_widgets.dart';

class ScannerController extends GetxController {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  final count = 0.obs;
  final resultCount = 0.obs;
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
          //checkQrCodeNumberApi(result!.code ?? '');
          CommonWidgets.showMyToastMessage('Scanned ...');
        }
      }
    });
  }
}
