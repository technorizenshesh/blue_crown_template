import 'dart:ui' as ui;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:screenshot/screenshot.dart';

import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/text_styles.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/provider_download_qr_code_controller.dart';

class ProviderDownloadQrCodeView
    extends GetView<ProviderDownloadQrCodeController> {
  const ProviderDownloadQrCodeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final FutureBuilder<ui.Image> qrFutureBuilder = FutureBuilder<ui.Image>(
      future: controller.loadOverlayImage(),
      builder: (BuildContext ctx, AsyncSnapshot<ui.Image> snapshot) {
        const double size = 230.0;
        if (!snapshot.hasData) {
          return const SizedBox(width: size, height: size);
        }
        return CustomPaint(
          size: const Size.square(size),
          painter: QrPainter(
            data: controller.parameters[ApiKeyConstants.qrCode] ?? '0',
            version: QrVersions.auto,
            eyeStyle: const QrEyeStyle(
              eyeShape: QrEyeShape.square,
              color: Color(0xff1f1f1f),
            ),
            dataModuleStyle: const QrDataModuleStyle(
              dataModuleShape: QrDataModuleShape.circle,
              color: Color(0xff1f1f1f),
            ),
            // size: 320.0,
            embeddedImage: snapshot.data,
            embeddedImageStyle: const QrEmbeddedImageStyle(
              size: Size.square(60),
            ),
          ),
        );
      },
    );
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CommonWidgets.appBar(
          title: StringConstants.download, wantBackButton: true),
      bottomNavigationBar: Obx(() {
        controller.isLoading.value;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.px, vertical: 10.px),
          child: CommonWidgets.commonElevatedButton(
              onPressed: () {
                controller.clickOnDownloadButton();
              },
              child: Text(
                StringConstants.download,
                style: MyTextStyle.titleStyle16bw,
              ),
              borderRadius: 30.px,
              isLoading: controller.isLoading.value,
              buttonColor: primaryColor),
        );
      }),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Screenshot(
                controller: controller.screenshotController,
                child: Container(
                  width: 250.px,
                  height: 250.px,
                  padding: EdgeInsets.all(10.px),
                  margin: EdgeInsets.all(20.px),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.px)),
                      border: Border.all(color: text2Color, width: 2.px),
                      color: Colors.white),
                  child: qrFutureBuilder,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
