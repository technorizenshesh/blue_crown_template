import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/text_styles.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/provider_download_qr_code_controller.dart';

class ProviderDownloadQrCodeView
    extends GetView<ProviderDownloadQrCodeController> {
  const ProviderDownloadQrCodeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: backgroundColor,
        appBar: CommonWidgets.appBar(
            title: StringConstants.download, wantBackButton: true),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.px, vertical: 10.px),
          child: CommonWidgets.commonElevatedButton(
              onPressed: () {
                //controller.openNewPage(1);
              },
              child: Text(
                StringConstants.download,
                style: MyTextStyle.titleStyle16bw,
              ),
              borderRadius: 30.px,
              buttonColor: primaryColor),
        ),
        body: Obx(() {
          controller.count.value;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10.px,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 254.px,
                    width: 254.px,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(2.px),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.px),
                        border: Border.all(color: primary3Color, width: 2.px)),
                    child: CommonWidgets.appIcons(
                        assetName: IconConstants.icQrCode,
                        width: 250.px,
                        height: 250.px,
                        fit: BoxFit.fill),
                  ),
                ),
                SizedBox(
                  height: 50.px,
                ),
              ],
            ),
          );
        }));
  }
}
