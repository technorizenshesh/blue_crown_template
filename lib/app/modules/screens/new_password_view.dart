import 'package:blue_crown_template/app/data/constants/image_constants.dart';
import 'package:blue_crown_template/app/data/constants/string_constants.dart';
import 'package:blue_crown_template/app/modules/controller/new_password_controller.dart';
import 'package:blue_crown_template/common/colors.dart';
import 'package:blue_crown_template/common/common_widgets.dart';
import 'package:blue_crown_template/common/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NewPasswordView extends StatefulWidget {
  const NewPasswordView({Key? key}) : super(key: key);
  @override
  State<NewPasswordView> createState() => _NewPasswordViewState();
}

class _NewPasswordViewState extends State<NewPasswordView> {
  NewPasswordController controller = Get.put(NewPasswordController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: CommonWidgets.commonElevatedButton(
            onPressed: () {
              //controller.openNewPage(1);
            },
            child: Text(
              StringConstants.save,
              style: MyTextStyle.titleStyle16bw,
            ),
            borderRadius: 30.px,
            buttonColor: primaryColor,
            buttonMargin: EdgeInsets.only(bottom: 10.px)),
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
          );
        }));
  }
}
