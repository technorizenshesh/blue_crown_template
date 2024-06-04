import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/text_styles.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/provider_add_list_controller.dart';

class ProviderAddListView extends GetView<ProviderAddListController> {
  const ProviderAddListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        appBar: CommonWidgets.appBar(
            wantBackButton: true, title: StringConstants.addToList),
        bottomNavigationBar: SizedBox(
          height: 140.px,
          child: Column(
            children: [
              CommonWidgets.commonElevatedButton(
                  onPressed: () {
                    //controller.openNewPage(1);
                  },
                  child: Text(
                    StringConstants.submit,
                    style: MyTextStyle.titleStyle16bw,
                  ),
                  borderRadius: 30.px,
                  buttonColor: primaryColor,
                  buttonMargin: EdgeInsets.only(
                      bottom: 10.px, left: 10.px, right: 10.px)),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: CommonWidgets.commonElevatedButton(
                        onPressed: () {
                          controller.tabIndex.value = 0;
                        },
                        child: Text(
                          StringConstants.listRequest,
                          style: MyTextStyle.titleStyle16bw,
                        ),
                        borderRadius: 30.px,
                        buttonColor: controller.tabIndex.value == 0
                            ? primaryColor
                            : cartColor,
                        buttonMargin: EdgeInsets.only(
                            bottom: 10.px, left: 10.px, right: 10.px)),
                  ),
                  Expanded(
                    flex: 1,
                    child: CommonWidgets.commonElevatedButton(
                        onPressed: () {
                          controller.tabIndex.value = 1;
                        },
                        child: Text(
                          StringConstants.tableRequest,
                          style: MyTextStyle.titleStyle16bw,
                        ),
                        borderRadius: 30.px,
                        buttonColor: controller.tabIndex.value == 1
                            ? primaryColor
                            : cartColor,
                        buttonMargin: EdgeInsets.only(
                            bottom: 10.px, left: 10.px, right: 10.px)),
                  ),
                ],
              )
            ],
          ),
        ),
        body: Padding(
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
                        constraints:
                            BoxConstraints(minWidth: 20.px, maxWidth: 50.px),
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
    });
  }
}
