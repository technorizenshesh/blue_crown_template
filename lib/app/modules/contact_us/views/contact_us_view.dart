import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/text_styles.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/contact_us_controller.dart';

class ContactUsView extends GetView<ContactUsController> {
  const ContactUsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: backgroundColor,
        appBar: CommonWidgets.appBar(
            title: StringConstants.contact, wantBackButton: true),
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
          );
        }));
  }
}
