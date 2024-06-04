import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/text_styles.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({Key? key}) : super(key: key);
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
                FocusManager.instance.primaryFocus?.unfocus();
                controller.otpValue =
                    '${controller.fieldOne.text}${controller.fieldTwo.text}${controller.fieldThree.text}${controller.fieldFour.text}';
                controller.callingCheckOtpInForm();
              },
              child: Text(
                StringConstants.continues,
                style: MyTextStyle.titleStyle16bw,
              ),
              borderRadius: 30.px,
              buttonMargin: EdgeInsets.only(bottom: 10.px),
              buttonColor: primaryColor,
              isLoading: controller.isLoading.value),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CommonWidgets.appBar(wantBackButton: true),
                    SizedBox(
                      height: 100.px,
                    ),
                    Text(
                      StringConstants.checkYourMail,
                      style: MyTextStyle.titleStyle20bw,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 3.px,
                    ),
                    Text(
                      StringConstants.pleasePutThe4DigitsSendToYou,
                      style: MyTextStyle.titleStyle14w,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20.px,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 60),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            OtpInput(controller.fieldOne, true), // auto focus
                            OtpInput(controller.fieldTwo, false),
                            OtpInput(controller.fieldThree, false),
                            OtpInput(controller.fieldFour, false)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ));
    });
  }
}

// Create an input widget that takes only one digit
class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  const OtpInput(this.controller, this.autoFocus, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 50,
      decoration: const BoxDecoration(
        color: editTextButton,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: TextField(
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        cursorColor: Theme.of(context).primaryColor,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          counterText: '',
          hintStyle: TextStyle(color: Colors.black, fontSize: 20.0),
        ),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}
