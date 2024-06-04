import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/text_styles.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/new_password_controller.dart';

class NewPasswordView extends GetView<NewPasswordController> {
  const NewPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
          resizeToAvoidBottomInset: false,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: CommonWidgets.commonElevatedButton(
              onPressed: () {
                controller.callingNewPasswordInForm();
              },
              child: Text(
                StringConstants.save,
                style: MyTextStyle.titleStyle16bw,
              ),
              borderRadius: 30.px,
              buttonColor: primaryColor,
              isLoading: controller.isLoading.value,
              buttonMargin: EdgeInsets.only(bottom: 10.px)),
          body: Stack(
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
                  children: [
                    CommonWidgets.appBar(wantBackButton: true),
                    SizedBox(
                      height: 20.px,
                    ),
                    Center(
                      child: Text(StringConstants.createNewPassword,
                          style: MyTextStyle.titleStyleCustom(
                              24.0, FontWeight.w700, primary3Color)),
                    ),
                    Text(
                      StringConstants.yourNewPasswordMustBeDifferentFrom,
                      style: MyTextStyle.titleStyle16bw,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 50.px,
                    ),
                    CommonWidgets.commonTextFieldForLoginSignUP(
                      focusNode: controller.focusPassword,
                      controller: controller.passwordController,
                      isCard: controller.isPassword.value,
                      hintText: StringConstants.password,
                      hintStyle: MyTextStyle.titleStyle14w,
                      style: MyTextStyle.titleStyle14w,
                      keyboardType: TextInputType.visiblePassword,
                      suffixIcon: GestureDetector(
                        onTap: () => controller.clickOnPasswordEyeButton(),
                        child: Icon(
                          controller.passwordHide.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: primary3Color,
                          size: 20.px,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.px,
                    ),
                    CommonWidgets.commonTextFieldForLoginSignUP(
                      obscureText: controller.passwordHide.value,
                      focusNode: controller.focusCnfPassword,
                      controller: controller.cnfPasswordController,
                      isCard: controller.isCnfPassword.value,
                      hintText: StringConstants.conformPassword,
                      hintStyle: MyTextStyle.titleStyle14w,
                      style: MyTextStyle.titleStyle14w,
                      keyboardType: TextInputType.visiblePassword,
                      suffixIcon: GestureDetector(
                        onTap: () => controller.clickOnPasswordEyeButton(),
                        child: Icon(
                          controller.passwordHide.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: primary3Color,
                          size: 20.px,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25.px,
                    ),
                    SizedBox(
                      height: 25.px,
                    ),
                  ],
                ),
              ),
            ],
          ));
    });
  }
}
