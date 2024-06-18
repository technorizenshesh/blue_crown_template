import 'package:blue_crown_template/app/data/constants/icons_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/text_styles.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/scanner_controller.dart';

class ScannerView extends GetView<ScannerController> {
  const ScannerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        backgroundColor: Colors.black87,
        appBar: CommonWidgets.appBar(
            title: StringConstants.scanQrCode, wantBackButton: true),
        bottomNavigationBar: Padding(
            padding: EdgeInsets.only(bottom: 10.px),
            child: Obx(() => controller.isLoading.value
                ? Container(
                    width: double.infinity,
                    height: 50,
                    margin: EdgeInsets.all(10.px),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25.px)),
                        color: primaryColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                            height: 30,
                            width: 30,
                            child: CircularProgressIndicator(
                              color: primary3Color,
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Loading...",
                          style: MyTextStyle.titleStyle16bw,
                        ),
                      ],
                    ),
                  )
                : SizedBox(
                    height: 20.px,
                  ))),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 220.px,
                width: 220.px,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2.px)),
                clipBehavior: Clip.hardEdge,
                child: QRView(
                  key: controller.qrKey,
                  onQRViewCreated: controller.onQRViewCreated,
                ),
              ),
            ),
            SizedBox(
              height: 70.px,
            ),
            Obx(() => controller.showCongratulation.value
                ? Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.px))),
                    color: primaryColor,
                    margin: EdgeInsets.all(20.px),
                    elevation: 0.px,
                    child: SizedBox(
                      height: 120.px,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                IconConstants.icBlueCrown,
                                height: 50.px,
                                width: 55.px,
                                fit: BoxFit.fill,
                              ),
                              Text(
                                controller.scanEventQrModel!.result!.points!,
                                style: MyTextStyle.titleStyle20bw,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.px,
                          ),
                          Text(
                            'Congratulations! You have received',
                            style: MyTextStyle.titleStyle16bw,
                          ),
                        ],
                      ),
                    ))
                : SizedBox(
                    height: 20.px,
                  ))
          ],
        ),
      );
    });
  }
}
