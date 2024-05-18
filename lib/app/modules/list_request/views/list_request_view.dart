import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/text_styles.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/list_request_controller.dart';

class ListRequestView extends GetView<ListRequestController> {
  const ListRequestView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        appBar: CommonWidgets.appBar(
            wantBackButton: true, title: StringConstants.listRequest),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: CommonWidgets.commonElevatedButton(
            onPressed: () {
              //controller.openNewPage(1);
            },
            child: Text(
              StringConstants.sendRequest,
              style: MyTextStyle.titleStyle16bw,
            ),
            borderRadius: 30.px,
            buttonColor: primaryColor,
            buttonMargin:
                EdgeInsets.only(bottom: 10.px, left: 10.px, right: 10.px)),
        body: Obx(() {
          controller.count.value;
          return InkWell(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30.px,
                  ),
                  CommonWidgets.commonTextFieldForLoginSignUP(
                    focusNode: controller.focusName,
                    controller: controller.nameController,
                    isCard: controller.isName.value,
                    hintText: StringConstants.fullName,
                    hintStyle: MyTextStyle.titleStyle14w,
                    style: MyTextStyle.titleStyle14w,
                  ),
                  SizedBox(
                    height: 15.px,
                  ),
                  CommonWidgets.commonTextFieldForLoginSignUP(
                      focusNode: controller.focusPerson,
                      controller: controller.personController,
                      isCard: controller.isPerson.value,
                      readOnly: true,
                      hintText: StringConstants.howManyPersons,
                      hintStyle: MyTextStyle.titleStyle14w,
                      style: MyTextStyle.titleStyle14w,
                      suffixIcon: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller.clickOnPlusIcon();
                            },
                            child: CommonWidgets.appIcons(
                                assetName: IconConstants.icPlus,
                                width: 25.px,
                                height: 25.px,
                                fit: BoxFit.fill),
                          ),
                          Container(
                            constraints: BoxConstraints(
                                minWidth: 20.px, maxWidth: 50.px),
                            padding: EdgeInsets.only(left: 5.px),
                            child: Text(
                              controller.personCount.value.toString(),
                              style: MyTextStyle.titleStyle14bw,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.clickOnMinusIcon();
                            },
                            child: CommonWidgets.appIcons(
                                assetName: IconConstants.icMinus,
                                width: 25.px,
                                height: 25.px,
                                fit: BoxFit.fill),
                          )
                        ],
                      )),
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
                  ),
                  SizedBox(
                    height: 15.px,
                  ),
                  CommonWidgets.commonTextFieldForLoginSignUP(
                    focusNode: controller.focusPhone,
                    controller: controller.phoneController,
                    isCard: controller.isPhone.value,
                    hintText: StringConstants.phoneNumber,
                    keyboardType: TextInputType.number,
                    hintStyle: MyTextStyle.titleStyle14w,
                    style: MyTextStyle.titleStyle14w,
                  ),
                  SizedBox(
                    height: 25.px,
                  ),
                ],
              ),
            ),
          );
        }));
  }
}
