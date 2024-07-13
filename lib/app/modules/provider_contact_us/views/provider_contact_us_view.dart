import 'package:blue_crown_template/app/data/constants/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/text_styles.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/provider_contact_us_controller.dart';

class ProviderContactUsView extends GetView<ProviderContactUsController> {
  const ProviderContactUsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
          backgroundColor: backgroundColor,
          appBar: CommonWidgets.appBar(
              title: StringConstants.contactToSupport, wantBackButton: true),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.px, vertical: 10.px),
            child: CommonWidgets.commonElevatedButton(
                onPressed: () {
                  controller.sendEnquiryForm();
                },
                child: Text(
                  StringConstants.submit,
                  style: MyTextStyle.titleStyle16bw,
                ),
                isLoading: controller.btnLoading.value,
                borderRadius: 30.px,
                buttonColor: primaryColor),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.px,
                  ),
                  CommonWidgets.appIcons(
                      assetName: ImageConstants.imageContactUs,
                      height: 180.px,
                      width: double.infinity,
                      fit: BoxFit.fill),
                  SizedBox(
                    height: 10.px,
                  ),
                  CommonWidgets.commonTextFieldForLoginSignUP(
                    focusNode: controller.focusName,
                    controller: controller.nameController,
                    isCard: controller.isName.value,
                    hintText: StringConstants.fullName,
                    hintStyle: MyTextStyle.titleStyle14w,
                    style: MyTextStyle.titleStyle14w,
                    keyboardType: TextInputType.name,
                  ),
                  SizedBox(
                    height: 15.px,
                  ),
                  CommonWidgets.commonTextFieldForLoginSignUP(
                    focusNode: controller.focusEmail,
                    controller: controller.emailController,
                    isCard: controller.isEmail.value,
                    hintText: StringConstants.email,
                    hintStyle: MyTextStyle.titleStyle14w,
                    style: MyTextStyle.titleStyle14w,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 15.px,
                  ),
                  CommonWidgets.commonTextFieldForLoginSignUP(
                    focusNode: controller.focusMessage,
                    controller: controller.messageController,
                    isCard: controller.isMessage.value,
                    hintText: StringConstants.message,
                    hintStyle: MyTextStyle.titleStyle14w,
                    style: MyTextStyle.titleStyle14w,
                    maxLines: 5,
                    keyboardType: TextInputType.text,
                  ),
                ],
              ),
            ),
          ));
    });
  }
}
