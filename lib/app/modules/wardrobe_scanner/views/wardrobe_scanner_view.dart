import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/wardrobe_scanner_controller.dart';

class WardrobeScannerView extends GetView<WardrobeScannerController> {
  const WardrobeScannerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: CommonWidgets.appBar(
        title: StringConstants.scanWardrobeQrCode,
        wantBackButton: true,
      ),
      body: Align(
        alignment: Alignment.center,
        child: Container(
          height: 220.px,
          width: 220.px,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 2.px)),
          clipBehavior: Clip.hardEdge,
          child: QRView(
            key: controller.qrKey,
            onQRViewCreated: controller.onQRViewCreated,
          ),
        ),
      ),
    );
  }
}
