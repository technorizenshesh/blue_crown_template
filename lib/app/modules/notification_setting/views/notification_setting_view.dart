import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/text_styles.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/notification_setting_controller.dart';

class NotificationSettingView extends GetView<NotificationSettingController> {
  const NotificationSettingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: CommonWidgets.appBar(
            title: StringConstants.notifications, wantBackButton: true),
        body: Obx(() {
          controller.count.value;
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.px,
                ),
                showNotificationStatus(),
              ]);
        }));
  }

  /// Show Club Photos ...
  Widget showNotificationStatus() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 5.px, vertical: 0.px),
      scrollDirection: Axis.vertical,
      itemCount: controller.notificationsSettings.length,
      itemBuilder: (context, int index) {
        return Container(
          height: 60.px,
          padding: EdgeInsets.all(5.px),
          margin: EdgeInsets.all(5.px),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                controller.notificationsSettings[index],
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
                value: controller.notificationsStatus[index],
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
