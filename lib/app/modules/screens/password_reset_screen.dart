import 'package:blue_crown_template/app/data/constants/icons_constant.dart';
import 'package:blue_crown_template/app/data/constants/image_constants.dart';
import 'package:blue_crown_template/app/modules/controller/password_reset_controller.dart';
import 'package:blue_crown_template/common/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../common/colors.dart';
import '../../../common/text_styles.dart';
import '../../data/constants/string_constants.dart';

class PasswordResetView extends StatefulWidget {
  const PasswordResetView({Key? key}) : super(key: key);
  @override
  State<PasswordResetView> createState() => _PasswordResetViewState();
}

class _PasswordResetViewState extends State<PasswordResetView> {
  PasswordResetController controller = Get.put(PasswordResetController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: CommonWidgets.commonElevatedButton(
            onPressed: () {
              controller.clickOnNexButton();
            },
            child: Text(
              StringConstants.next,
              style: MyTextStyle.titleStyle16bw,
            ),
            borderRadius: 30.px,
            buttonMargin: EdgeInsets.only(bottom: 10.px),
            buttonColor: primaryColor),
        body: Obx(() {
          controller.count.value;
          return Stack(
            fit: StackFit.expand,
            children: [
              CommonWidgets.appIcons(
                assetName: ImageConstants.imageLogin,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              CommonWidgets.appIcons(
                assetName: ImageConstants.imageBlack,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CommonWidgets.appBar(wantBackButton: true),
                    SizedBox(
                      height: 20.px,
                    ),
                    Center(
                      child: Text(StringConstants.passwordReset,
                          style: MyTextStyle.titleStyleCustom(
                              24.0, FontWeight.w700, primary3Color)),
                    ),
                    SizedBox(
                      height: 5.px,
                    ),
                    Text(
                      StringConstants.pleasePutYourEmailMobileNumber,
                      style: MyTextStyle.titleStyle14bw,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20.px,
                    ),
                    Container(
                      height: 100.px,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20.px),
                          border: Border.all(
                              color: controller.isPhone.value
                                  ? primaryColor
                                  : primary3Color,
                              width: 2)),
                      child: ListTile(
                          leading: CommonWidgets.appIcons(
                            assetName: IconConstants.icChat,
                            height: 55.px,
                            width: 55.px,
                            fit: BoxFit.fill,
                          ),
                          title: Text(
                            StringConstants.sms,
                            style: MyTextStyle.titleStyle16bw,
                          ),
                          subtitle: CommonWidgets.commonTextField(
                              focusNode: controller.focusPhone,
                              controller: controller.phoneController,
                              hintText: StringConstants.hintNumber,
                              hintStyle: MyTextStyle.titleStyle16w,
                              style: MyTextStyle.titleStyle16w,
                              keyboardType: TextInputType.phone,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 0.px, vertical: 3.px))),
                    ),
                    SizedBox(
                      height: 15.px,
                    ),
                    Container(
                      height: 100.px,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20.px),
                          border: Border.all(
                              color: controller.isEmail.value
                                  ? primaryColor
                                  : primary3Color,
                              width: 2)),
                      width: double.infinity,
                      child: ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 0.px, horizontal: 10.px),
                          leading: CommonWidgets.appIcons(
                            assetName: IconConstants.icEmail,
                            height: 55.px,
                            width: 55.px,
                            fit: BoxFit.fill,
                          ),
                          title: Text(
                            StringConstants.email,
                            style: MyTextStyle.titleStyle16bw,
                          ),
                          subtitle: CommonWidgets.commonTextField(
                              focusNode: controller.focusEmail,
                              controller: controller.emailController,
                              hintText: StringConstants.hintEmail,
                              hintStyle: MyTextStyle.titleStyle16w,
                              style: MyTextStyle.titleStyle16w,
                              keyboardType: TextInputType.emailAddress,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 0.px, vertical: 3.px))),
                    ),
                  ],
                ),
              ),
            ],
          );
        }));
  }
}
