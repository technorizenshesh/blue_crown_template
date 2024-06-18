import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/text_styles.dart';
import '../../../data/apis/api_models/get_all_user_model.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/provider_push_notification_controller.dart';

class ProviderPushNotificationView
    extends GetView<ProviderPushNotificationController> {
  const ProviderPushNotificationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        appBar: CommonWidgets.appBar(
            wantBackButton: true, title: StringConstants.pushNotification),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: CommonWidgets.commonElevatedButton(
            onPressed: () {
              //controller.openNewPage(1);
            },
            child: Text(
              StringConstants.sendMessage,
              style: MyTextStyle.titleStyle16bw,
            ),
            borderRadius: 30.px,
            buttonColor: primaryColor,
            buttonMargin:
                EdgeInsets.only(bottom: 10.px, left: 10.px, right: 10.px)),
        body: Obx(() {
          controller.count.value;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.px,
                ),
                CommonWidgets.commonTextFieldForLoginSignUP(
                    focusNode: controller.focusMessage,
                    controller: controller.messageController,
                    isCard: controller.isMessage.value,
                    hintText: StringConstants.message,
                    hintStyle: MyTextStyle.titleStyle14w,
                    style: MyTextStyle.titleStyle14w,
                    maxLines: 7),
                SizedBox(
                  height: 5.px,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.px),
                  ),
                  color: cartColor,
                  elevation: 5.px,
                  clipBehavior: Clip.hardEdge,
                  child: Container(
                    height: 60.px,
                    margin: EdgeInsets.all(5.px),
                    padding: EdgeInsets.all(10.px),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          StringConstants.everyOne,
                          style: MyTextStyle.titleStyle14w,
                        ),
                        FlutterSwitch(
                          height: 25.px,
                          width: 50.px,
                          padding: 4.0.px,
                          toggleSize: 20.0.px,
                          borderRadius: 13.0.px,
                          activeColor: primaryColor,
                          activeToggleColor: primary3Color,
                          value: controller.sendEveryOne.value,
                          onToggle: (value) {
                            controller.sendEveryOne.value = value;
                            controller.increment();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.px,
                ),
                if (!controller.sendEveryOne.value)
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: showRegisteredUserList(),
                    ),
                  )
              ],
            ),
          );
        }));
  }

  /// Show Registered User List ...
  Widget showRegisteredUserList() {
    return controller.inAsyncCall.value
        ? CommonWidgets.commonShimmer(
            itemCount: 5,
            shimmerWidget: Container(
              height: 60.px,
              padding: EdgeInsets.all(5.px),
              margin: EdgeInsets.all(5.px),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black87, width: 1.px),
                  borderRadius: BorderRadius.circular(10.px)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 15.px,
                    width: 150.px,
                    decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(2.px)),
                  ),
                  Container(
                    height: 25.px,
                    width: 50.px,
                    decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.circular(12.px)),
                  )
                ],
              ),
            ))
        : ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 5.px, vertical: 0.px),
            scrollDirection: Axis.vertical,
            itemCount: controller.userList.length,
            itemBuilder: (context, int index) {
              AllUsersResult user = controller.userList[index];
              return Container(
                height: 60.px,
                padding: EdgeInsets.all(5.px),
                margin: EdgeInsets.all(5.px),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      user.fullName ?? '',
                      style: MyTextStyle.titleStyle14w,
                    ),
                    FlutterSwitch(
                      height: 25.px,
                      width: 50.px,
                      padding: 4.0.px,
                      toggleSize: 20.0.px,
                      borderRadius: 13.0.px,
                      activeColor: primaryColor,
                      activeToggleColor: primary3Color,
                      value: user.selected,
                      onToggle: (value) {
                        controller.changeNotificationStatus(index, value);
                      },
                    ),
                  ],
                ),
              );
            },
          );
  }
}
