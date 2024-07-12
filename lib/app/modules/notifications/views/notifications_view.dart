import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/text_styles.dart';
import '../../../data/apis/api_models/get_my_notification_model.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/notifications_controller.dart';

class NotificationsView extends GetView<NotificationsController> {
  const NotificationsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        resizeToAvoidBottomInset: false,
        appBar: CommonWidgets.appBar(
            title: StringConstants.notifications,
            actions: [
              Padding(
                padding: EdgeInsets.all(10.px),
                child: GestureDetector(
                  onTap: () {
                    controller.clickOnSettingIcon();
                  },
                  child: Icon(
                    Icons.settings,
                    color: primary3Color,
                    size: 25.px,
                  ),
                ),
              )
            ]),
        body: Obx(() {
          controller.count.value;
          return Padding(
            padding: EdgeInsets.all(15.px),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: showNotificationList(),
                  ),
                )
              ],
            ),
          );
        }));
  }

  /// Show user List ...
  Widget showNotificationList() {
    return Obx(() => controller.isLoading.value
        ? CommonWidgets.commonShimmer(
            itemCount: 8,
            shimmerWidget: Container(
              height: 80.px,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(10.px)),
              ),
              margin: EdgeInsets.only(
                  left: 5.px, right: 5.px, top: 5.px, bottom: 2.px),
              clipBehavior: Clip.hardEdge,
            ))
        : Column(
            children: [
              ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: controller.notificationList.length,
                itemBuilder: (context, int index) {
                  MyNotificationResult item =
                      controller.notificationList[index];
                  return GestureDetector(
                    onTap: () {
                      showAlertBox(context, controller.notificationList[index]);
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.px)),
                      ),
                      color: backgroundColor,
                      clipBehavior: Clip.hardEdge,
                      elevation: 2.px,
                      margin: EdgeInsets.only(
                        left: 5.px,
                        right: 5.px,
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 2.px, vertical: 1.px),
                        title: Text(
                          item.body ?? '',
                          style: MyTextStyle.titleStyle14w,
                          maxLines: 2,
                        ),
                        subtitle: Text(
                          item.title ?? '',
                          style: MyTextStyle.titleStyle12bb,
                        ),
                        trailing: Text(
                          item.datetime.toString().substring(0, 10),
                          style: MyTextStyle.titleStyle12bw,
                        ),
                      ),
                    ),
                  );
                },
              ),
              if (controller.notificationList.isEmpty)
                CommonWidgets.dataNotFound()
            ],
          ));
  }

  /// Show Alert Box...
  void showAlertBox(BuildContext context, MyNotificationResult item) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 20.px),
        contentPadding: EdgeInsets.zero,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.px))),
        content: SizedBox(
          height: 300.px,
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.px))),
            elevation: 5.px,
            color: cartColor,
            margin: EdgeInsets.all(1.px),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 5.px,
                ),
                Text(
                  StringConstants.notifications,
                  style: MyTextStyle.titleStyle20bw,
                ),
                ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10.px, vertical: 0.px),
                  title: Text('Title', style: MyTextStyle.titleStyle16bw),
                  subtitle:
                      Text(item.title ?? '', style: MyTextStyle.titleStyle14w),
                ),
                ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10.px, vertical: 0.px),
                  title: Text('Date', style: MyTextStyle.titleStyle16bw),
                  subtitle: Text(item.datetime ?? '',
                      style: MyTextStyle.titleStyle14w),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.px, vertical: 0.px),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Message', style: MyTextStyle.titleStyle16bw),
                        Text(item.body ?? '', style: MyTextStyle.titleStyle14w),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        alignment: Alignment.center,
      ),
    );
  }
}
