import 'package:blue_crown_template/app/data/constants/string_constants.dart';
import 'package:blue_crown_template/app/modules/controller/my_profile_controller.dart';
import 'package:blue_crown_template/common/colors.dart';
import 'package:blue_crown_template/common/common_widgets.dart';
import 'package:blue_crown_template/common/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../data/constants/image_constants.dart';

class MyProfileView extends StatefulWidget {
  const MyProfileView({Key? key}) : super(key: key);
  @override
  State<MyProfileView> createState() => _MyProfileViewState();
}

class _MyProfileViewState extends State<MyProfileView> {
  MyProfileController controller = Get.put(MyProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: CommonWidgets.appBar(
            title: StringConstants.myProfile, wantBackButton: true),
        resizeToAvoidBottomInset: false,
        body: Obx(() {
          controller.count.value;
          return Padding(
            padding: EdgeInsets.all(10.px),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.px,
                ),
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CommonWidgets.appIcons(
                        assetName: ImageConstants.imageUser,
                        height: 130.px,
                        width: 130.px,
                        fit: BoxFit.fill),
                    GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.photo,
                        size: 25.px,
                        color: primaryColor,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.px,
                ),
                CommonWidgets.commonTextFieldForLoginSignUP(
                    focusNode: controller.focusFullName,
                    controller: controller.fullNameController,
                    isCard: controller.isFullName.value,
                    keyboardType: TextInputType.name,
                    style: MyTextStyle.titleStyle16w,
                    suffixIcon: Text(
                      StringConstants.fullName,
                      style: MyTextStyle.titleStyle12w,
                    )),
                SizedBox(
                  height: 15.px,
                ),
                CommonWidgets.commonTextFieldForLoginSignUP(
                    focusNode: controller.focusEmail,
                    controller: controller.emailController,
                    isCard: controller.isEmail.value,
                    style: MyTextStyle.titleStyle16w,
                    keyboardType: TextInputType.emailAddress,
                    suffixIcon: Text(
                      StringConstants.email,
                      style: MyTextStyle.titleStyle12w,
                    )),
                SizedBox(
                  height: 15.px,
                ),
                CommonWidgets.commonTextFieldForLoginSignUP(
                  focusNode: controller.focusPhone,
                  controller: controller.phoneController,
                  isCard: controller.isPhone.value,
                  style: MyTextStyle.titleStyle14w,
                  keyboardType: TextInputType.visiblePassword,
                  suffixIcon: Text(
                    StringConstants.phoneNumber,
                    style: MyTextStyle.titleStyle12w,
                  ),
                  prefixIcon: Text(
                    '+91',
                    style: MyTextStyle.titleStyle16bw,
                  ),
                ),
                SizedBox(
                  height: 15.px,
                ),
                CommonWidgets.commonTextFieldForLoginSignUP(
                  focusNode: controller.focusDob,
                  controller: controller.dobController,
                  isCard: controller.isDob.value,
                  style: MyTextStyle.titleStyle14w,
                  suffixIcon: Text(
                    StringConstants.dateOfBirth,
                    style: MyTextStyle.titleStyle12w,
                  ),
                  prefixIcon: GestureDetector(
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
                  height: 50.px,
                ),
                CommonWidgets.commonElevatedButton(
                    onPressed: () {
                      // showGDPR();
                    },
                    child: Text(
                      StringConstants.update,
                      style: MyTextStyle.titleStyle16bw,
                    ),
                    borderRadius: 30.px,
                    buttonColor: primaryColor),
              ],
            ),
          );
        }));
  }
}
