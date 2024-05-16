import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/text_styles.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/provider_create_qr_code_controller.dart';

class ProviderCreateQrCodeView extends GetView<ProviderCreateQrCodeController> {
  const ProviderCreateQrCodeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: backgroundColor,
        appBar: CommonWidgets.appBar(
            title: StringConstants.createQrCode, wantBackButton: true),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.px, vertical: 10.px),
          child: CommonWidgets.commonElevatedButton(
              onPressed: () {
                //controller.openNewPage(1);
              },
              child: Text(
                StringConstants.submit,
                style: MyTextStyle.titleStyle16bw,
              ),
              borderRadius: 30.px,
              buttonColor: primaryColor),
        ),
        body: Obx(() {
          controller.count.value;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10.px,
                  ),
                  Container(
                    height: 184.px,
                    width: 184.px,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(2.px),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.px),
                        border: Border.all(color: primary3Color, width: 2.px)),
                    child: CommonWidgets.appIcons(
                        assetName: IconConstants.icQrCode,
                        width: 180.px,
                        height: 180.px,
                        fit: BoxFit.fill),
                  ),
                  SizedBox(
                    height: 50.px,
                  ),
                  CommonWidgets.commonTextFieldForLoginSignUP(
                    focusNode: controller.focusName,
                    controller: controller.nameController,
                    isCard: controller.isName.value,
                    hintText: StringConstants.name,
                    hintStyle: MyTextStyle.titleStyle14w,
                    style: MyTextStyle.titleStyle14w,
                    keyboardType: TextInputType.name,
                  ),
                  SizedBox(
                    height: 15.px,
                  ),
                  CommonWidgets.commonTextFieldForLoginSignUP(
                    focusNode: controller.focusQrNumber,
                    controller: controller.qrNumberController,
                    isCard: controller.isQrNumber.value,
                    hintText: StringConstants.qrNumber,
                    hintStyle: MyTextStyle.titleStyle14w,
                    style: MyTextStyle.titleStyle14w,
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            ),
          );
        }));
  }
}
