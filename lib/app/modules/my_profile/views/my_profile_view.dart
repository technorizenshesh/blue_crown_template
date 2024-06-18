import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/text_styles.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/my_profile_controller.dart';

class MyProfileView extends GetView<MyProfileController> {
  const MyProfileView({Key? key}) : super(key: key);
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
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.px,
                  ),
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Obx(
                        () => controller.selectImage.value != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(65.px),
                                child: Image.file(
                                  height: 130.px,
                                  width: 130.px,
                                  fit: BoxFit.fill,
                                  File(
                                    controller.selectImage.value!.path
                                        .toString(),
                                  ),
                                ),
                              )
                            : CommonWidgets.imageView(
                                image: controller.profileImage.value,
                                height: 130.px,
                                width: 130.px,
                                fit: BoxFit.fill,
                                borderRadius: BorderRadius.circular(65.px)),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.showAlertDialog();
                        },
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
                      readOnly: true,
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
                    height: 40.px,
                  ),
                  CommonWidgets.commonElevatedButton(
                      onPressed: () {
                        controller.callingUpdateProfile();
                      },
                      child: Text(
                        StringConstants.update,
                        style: MyTextStyle.titleStyle16bw,
                      ),
                      borderRadius: 30.px,
                      buttonColor: primaryColor,
                      isLoading: controller.isLoading.value),
                  SizedBox(
                    height: 20.px,
                  ),
                  CommonWidgets.commonElevatedButton(
                      onPressed: () {
                        controller.clickOnChangeButton();
                      },
                      child: Text(
                        StringConstants.changePassword,
                        style: MyTextStyle.titleStyle16bw,
                      ),
                      borderRadius: 30.px,
                      buttonColor: Colors.grey.withOpacity(0.5)),
                ],
              ),
            ),
          );
        }));
  }
}
