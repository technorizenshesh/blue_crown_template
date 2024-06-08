import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/text_styles.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);
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
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CommonWidgets.appBar(wantBackButton: true),
                      SizedBox(
                        height: 10.px,
                      ),
                      Center(
                        child: Text(StringConstants.createNewAccount,
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
                        focusNode: controller.focusFullName,
                        controller: controller.fullNameController,
                        isCard: controller.isFullName.value,
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
                        focusNode: controller.focusPhone,
                        controller: controller.phoneController,
                        isCard: controller.isPhone.value,
                        hintText: StringConstants.mobile,
                        hintStyle: MyTextStyle.titleStyle14w,
                        style: MyTextStyle.titleStyle14w,
                        keyboardType:defaultTargetPlatform == TargetPlatform.iOS
                            ? TextInputType.numberWithOptions(decimal: true, signed: true)
                            : TextInputType.number,
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
                        height: 15.px,
                      ),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        focusNode: controller.focusDob,
                        controller: controller.dobController,
                        isCard: controller.isDob.value,
                        hintText: StringConstants.dateOfBirth,
                        hintStyle: MyTextStyle.titleStyle14w,
                        style: MyTextStyle.titleStyle14w,
                        keyboardType: TextInputType.datetime,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            controller.clickOnDate();
                          },
                          child: Icon(
                            Icons.calendar_month,
                            color: primary3Color,
                            size: 20.px,
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 15.px,
                      ),
                      GestureDetector(
                        onTap: () => controller.checkBox.value =
                            !controller.checkBox.value,
                        child: Row(
                          children: [
                            controller.checkBox.value
                                ? Icon(
                                    Icons.check_box_outlined,
                                    size: 25.px,
                                    color: greenColor,
                                  )
                                : Icon(
                                    Icons.check_box_outline_blank_outlined,
                                    size: 25.px,
                                    color: primary3Color,
                                  ),
                            SizedBox(
                              width: 10.px,
                            ),
                            Expanded(child: myRichText(context)),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 25.px,
                      ),
                      CommonWidgets.commonElevatedButton(
                          onPressed: () {
                            controller.callingSubmitRegistrationForm();
                          },
                          child: Text(
                            StringConstants.signUp,
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
                          controller.clickOnLoginButton();
                        },
                        child: RichText(
                          text: TextSpan(
                              text: StringConstants.alreadyRegistered,
                              style: MyTextStyle.titleStyle16bw,
                              children: [
                                TextSpan(
                                  text: StringConstants.loginHere,
                                  style: MyTextStyle.titleStyle16bb,
                                )
                              ]),
                        ),
                      ),
                      SizedBox(
                        height: 25.px,
                      ),

                      //SvgPicture.asset("assets/images/google_logo.svg")
                    ],
                  ),
                ),
              ),
            ],
          );
        }));
  }

  Widget myRichText(BuildContext context) {
    TextStyle defaultStyle = MyTextStyle.titleStyle16w;
    TextStyle linkStyle = MyTextStyle.titleStyle16bb;
    return RichText(
      text: TextSpan(
        style: defaultStyle,
        children: <TextSpan>[
          const TextSpan(text: StringConstants.iAgreeTo),
          TextSpan(
              text: StringConstants.termsOfService,
              style: linkStyle,
              recognizer: TapGestureRecognizer()..onTap = () {}),
          const TextSpan(text: StringConstants.and),
          TextSpan(
              text: StringConstants.privacyPolicy,
              style: linkStyle,
              recognizer: TapGestureRecognizer()..onTap = () {}),
        ],
      ),
    );
  }
}
