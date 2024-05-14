import 'package:blue_crown_template/app/data/constants/string_constants.dart';
import 'package:blue_crown_template/app/modules/controller/change_password_controller.dart';
import 'package:blue_crown_template/common/colors.dart';
import 'package:blue_crown_template/common/common_widgets.dart';
import 'package:blue_crown_template/common/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({Key? key}) : super(key: key);
  @override
  State<ChangePasswordView> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePasswordView> {
  ChangePasswordController controller = Get.put(ChangePasswordController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: backgroundColor,
        appBar: CommonWidgets.appBar(
            title: StringConstants.changePassword, wantBackButton: true),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.px, vertical: 10.px),
          child: CommonWidgets.commonElevatedButton(
              onPressed: () {
                //controller.openNewPage(1);
              },
              child: Text(
                StringConstants.update,
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
                  Text(StringConstants.createNewPassword,
                      style: MyTextStyle.titleStyleCustom(
                          24.0, FontWeight.w700, primary3Color)),
                  Text(
                    StringConstants.yourNewPasswordMustBeDifferentFrom,
                    style: MyTextStyle.titleStyle14w,
                  ),
                  SizedBox(
                    height: 50.px,
                  ),
                  CommonWidgets.commonTextFieldForLoginSignUP(
                    obscureText: controller.passwordHide.value,
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
                    hintText: StringConstants.cnfPassword,
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
                ],
              ),
            ),
          );
        }));
  }
}
