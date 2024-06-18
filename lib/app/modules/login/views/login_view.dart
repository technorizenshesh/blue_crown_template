import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/text_styles.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
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
                      height: 10.px,
                    ),
                    Center(
                      child: Text(StringConstants.login,
                          style: MyTextStyle.titleStyleCustom(
                              34.0, FontWeight.w700, primary3Color)),
                    ),
                    Text(
                      StringConstants.loginToContinue,
                      style: MyTextStyle.titleStyle20bw,
                    ),
                    SizedBox(
                      height: 50.px,
                    ),
                    CommonWidgets.commonTextFieldForLoginSignUP(
                      focusNode: controller.focusEmail,
                      controller: controller.emailController,
                      isCard: controller.isEmail.value,
                      hintText: StringConstants.emailAddressMobileNumber,
                      hintStyle: MyTextStyle.titleStyle14w,
                      style: MyTextStyle.titleStyle14w,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: 15.px,
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
                      height: 25.px,
                    ),
                    InkWell(
                      onTap: () {
                        controller.clickOnForgotPasswordButton();
                      },
                      child: Column(
                        children: [
                          Text(
                            StringConstants.forgotYourPassword,
                            style: MyTextStyle.titleStyle12bw,
                          ),
                          Divider(
                            color: primary3Color,
                            height: 1.px,
                            thickness: 1.px,
                            endIndent: 100.px,
                            indent: 100.px,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25.px,
                    ),
                    CommonWidgets.commonElevatedButton(
                        onPressed: () {
                          showGDPR();
                        },
                        child: Text(
                          StringConstants.login,
                          style: MyTextStyle.titleStyle16bw,
                        ),
                        borderRadius: 30.px,
                        buttonColor: primaryColor,
                        isLoading: controller.isLoading.value),
                    SizedBox(
                      height: 15.px,
                    ),
                    InkWell(
                      onTap: () {
                        controller.clickOnSignUpButton();
                      },
                      child: RichText(
                        text: TextSpan(
                            text: StringConstants.dotHaveAnAccount,
                            style: MyTextStyle.titleStyle16bw,
                            children: [
                              TextSpan(
                                text: StringConstants.signUp,
                                style: MyTextStyle.titleStyle16bb,
                              )
                            ]),
                      ),
                    ),
                    SizedBox(
                      height: 25.px,
                    ),
                    Text(
                      StringConstants.or,
                      style: MyTextStyle.titleStyle16bw,
                    ),
                    SizedBox(
                      height: 25.px,
                    ),
                    CommonWidgets.appIcons(
                        assetName: IconConstants.icGoogle,
                        height: 56.px,
                        width: 56.px)
                    //SvgPicture.asset("assets/images/google_logo.svg")
                  ],
                ),
              ),
            ],
          );
        }));
  }

  showGDPR() {
    showDialog(
        context: Get.context!,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.black54,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            insetPadding: const EdgeInsets.symmetric(horizontal: 25),
            scrollable: true,
            title: Text(
              'Accept GDPR Rules',
              style: MyTextStyle.titleStyle18bw,
              textAlign: TextAlign.center,
            ), //this right here
            content: SizedBox(
              height: 500,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '1 Transparency and Consent:',
                      style: MyTextStyle.titleStyle13bw,
                    ),
                    Text(
                      StringConstants.terms1,
                      style: MyTextStyle.titleStyle12w,
                    ),
                    Text(
                      '2 Lawful Basis and Purpose:',
                      style: MyTextStyle.titleStyle13bw,
                    ),
                    Text(
                      StringConstants.terms2,
                      style: MyTextStyle.titleStyle12w,
                    ),
                    Text(
                      '3 Security and Retention:',
                      style: MyTextStyle.titleStyle13bw,
                    ),
                    Text(
                      StringConstants.terms3,
                      style: MyTextStyle.titleStyle12w,
                    ),
                    Text(
                      '4 User Rights and Privacy by Design:',
                      style: MyTextStyle.titleStyle13bw,
                    ),
                    Text(
                      StringConstants.terms4,
                      style: MyTextStyle.titleStyle12w,
                    ),
                    Text(
                      '5 Data Processing Agreements and International Transfers:',
                      style: MyTextStyle.titleStyle13bw,
                    ),
                    Text(
                      StringConstants.terms5,
                      style: MyTextStyle.titleStyle12w,
                    ),
                    Text(
                      '6 Push Notification:',
                      style: MyTextStyle.titleStyle13bw,
                    ),
                    Text(
                      StringConstants.terms7,
                      style: MyTextStyle.titleStyle12w,
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        CommonWidgets.showMyToastMessage(StringConstants
                            .pleaseAgreeGDPRRuleBecauseThisIsMandatory);
                      },
                      child: Container(
                        height: 40,
                        margin:
                            const EdgeInsets.only(left: 10, right: 15, top: 5),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.redAccent),
                        child: Text(
                          StringConstants.disagree,
                          style: MyTextStyle.titleStyle16bw,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        controller.clickOnLoginButton();
                      },
                      child: Container(
                        height: 40,
                        margin:
                            const EdgeInsets.only(left: 15, right: 10, top: 5),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: primaryColor),
                        child: Text(
                          "AGREE",
                          style: MyTextStyle.titleStyle16bw,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          );
        });
  }
}
