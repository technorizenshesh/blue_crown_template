import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:blue_crown_template/app/data/constants/icons_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/constants/string_constants.dart';

class ProviderDownloadQrCodeController extends GetxController {
  late FutureBuilder<ui.Image> qrFutureBuilde;
  Map<String, String?> parameters = Get.parameters;
  ScreenshotController screenshotController = ScreenshotController();
  final count = 0.obs;
  final isLoading = false.obs;
  @override
  void onInit() async {
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

  clickOnDownloadButton() {
    isLoading.value = true;
    screenshotController
        .capture(delay: const Duration(milliseconds: 10))
        .then((capturedImage) async {
      downloadQrCode(Get.context!, capturedImage!);
    }).catchError((onError) {
      print("Catch Error:---" + onError);
    });
  }

  Future<ui.Image> loadOverlayImage() async {
    final Completer<ui.Image> completer = Completer<ui.Image>();
    final ByteData byteData = await rootBundle.load(
      IconConstants.icScanner,
    );
    ui.decodeImageFromList(byteData.buffer.asUint8List(), completer.complete);
    return completer.future;
  }

  void showCapturedWidget(BuildContext context, Uint8List capturedImage) async {
    String formattedDate =
        DateFormat('yyyy-MM-dd_HH:mm:ss').format(DateTime.now());
    String fileName = 'qr_code_$formattedDate.png';
    print("File Name:-$fileName");
    final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(capturedImage),
        name: fileName,
        quality: 100);
    isLoading.value = false;
    print("Result:-" + result.toString());
  }

  void qrAndroid(BuildContext context, Uint8List capturedImage) async {
    Directory? downloadsDirectory = Directory('/storage/emulated/0/Download');
    if (downloadsDirectory != null) {
      String shortFileName = '';
      if (parameters[ApiKeyConstants.type] == StringConstants.hanger) {
        shortFileName =
            'BlueCrown_Hanger_QrCode_${parameters[ApiKeyConstants.qrCode]}';
      } else {
        shortFileName =
            'BlueCrown_Event_QrCode_${parameters[ApiKeyConstants.qrCode]}';
      }
      String filePath = "${downloadsDirectory.path}/$shortFileName.jpg";

      File(filePath)
        ..createSync(recursive: true)
        ..writeAsBytesSync(capturedImage);

      print("QrCode saved at: $filePath");
      CommonWidgets.showMyToastMessage('QrCode saved at: $filePath');
    } else {
      print("Failed to get downloads directory");
      CommonWidgets.showMyToastMessage('Failed to get downloads directory');
    }
    isLoading.value = false;
  }

  void downloadQrCode(BuildContext context, Uint8List capturedImage) async {
    Directory? downloadsDirectory;

    if (Platform.isAndroid) {
      qrAndroid(context, capturedImage);
    } else if (Platform.isIOS) {
      downloadsDirectory = await getApplicationDocumentsDirectory();
    }

    if (downloadsDirectory != null) {
      String shortFileName = '';
      if (parameters['type'] == 'hanger') {
        shortFileName = 'BlueCrown_Hanger_QrCode_${parameters['qrCode']}';
      } else {
        shortFileName = 'BlueCrown_Event_QrCode_${parameters['qrCode']}';
      }
      String filePath = "${downloadsDirectory.path}/$shortFileName.jpg";

      File(filePath)
        ..createSync(recursive: true)
        ..writeAsBytesSync(capturedImage);

      print("QrCode saved at: $filePath");
      CommonWidgets.showMyToastMessage('QrCode saved at: $filePath');
    } else {
      print("Failed to get downloads directory");
      // CommonWidgets.showMyToastMessage('Failed to get downloads directory');
    }
    isLoading.value = false;
  }
}
