import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:blue_crown_template/app/data/constants/icons_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

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
      showCapturedWidget(Get.context!, capturedImage!);
    }).catchError((onError) {
      print("Catch Error:-" + onError);
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
    //File('my_image.jpg').writeAsBytes(capturedImage);
    /*  print("File Name:-$fileName");
    final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(capturedImage),
        name: fileName,
        quality: 100);*/
    var directory = await getExternalStorageDirectory();
    String filePath = '${directory!.path}/$formattedDate.png';
    File file = File(filePath);
    await file.writeAsBytes(capturedImage);

    print('Image saved to $filePath');
    isLoading.value = false;
    //print("Result:-" + result.toString());
  }
}
