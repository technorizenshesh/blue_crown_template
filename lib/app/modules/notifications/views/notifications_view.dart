import 'package:blue_crown_template/app/data/constants/icons_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
            padding: EdgeInsets.all(10.px),
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
              height: 90.px,
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
                      controller.readNotification(
                          controller.notificationList[index].id ?? '', index);
                    },
                    child: Container(
                        height: 90.px,
                        margin: EdgeInsets.all(3.px),
                        padding: EdgeInsets.only(
                            top: 5.px, bottom: 5.px, left: 5.px),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.px)),
                          color: item.status == 'UNSEEN'
                              ? primaryColor.withOpacity(0.18)
                              : backgroundColor,
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: Row(
                          children: [
                            Container(
                              width: 55.px,
                              height: 55.px,
                              margin: EdgeInsets.only(right: 5.px),
                              child: CommonWidgets.appIcons(
                                assetName: IconConstants.icBl,
                                width: 55.px,
                                height: 55.px,
                              ),
                            ),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  item.title ?? '',
                                  style: MyTextStyle.titleStyle14bb,
                                ),
                                Text(
                                  item.body ?? '',
                                  style: MyTextStyle.titleStyle14w,
                                  maxLines: 2,
                                ),
                                Text(
                                  timeAgo(item.datetime.toString()),
                                  style: MyTextStyle.titleStyle12w,
                                ),
                              ],
                            )),
                            GestureDetector(
                              onTap: () {
                                showDeleteAlertBox(
                                    context, item.id ?? '', index);
                              },
                              child: SizedBox(
                                width: 55.px,
                                height: 55.px,
                                child: Icon(
                                  Icons.more_horiz,
                                  size: 25.px,
                                  color: primary3Color,
                                ),
                              ),
                            ),
                          ],
                        )),
                  );
                },
              ),
              if (controller.notificationList.isEmpty)
                CommonWidgets.dataNotFound()
            ],
          ));
  }

  String timeAgo(String dateTimeString) {
    DateTime messageTime = DateTime.parse(dateTimeString);
    DateTime currentTime = DateTime.now();

    Duration difference = currentTime.difference(messageTime);

    if (difference.inDays > 7) {
      // More than 24 hours
      return DateFormat('yyyy-MM-dd').format(messageTime);
    } else if (difference.inDays >= 1) {
      // More than 24 hours
      return '${difference.inDays} days ago';
    } else if (difference.inHours >= 1 && difference.inHours < 24) {
      // More than 60 minutes but less than 24 hours
      return '${difference.inHours} hours ago';
    } else if (difference.inMinutes >= 1) {
      // Less than 60 minutes
      return '${difference.inMinutes} minutes ago';
    } else {
      return 'Just now';
    }
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

  /// Show Alert Box...
  void showDeleteAlertBox(BuildContext context, String id, int index) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 20.px),
        contentPadding: EdgeInsets.zero,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.px))),
        content: SizedBox(
          height: 150.px,
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
                  StringConstants.deleteNotification,
                  style: MyTextStyle.titleStyle20bw,
                ),
                Text(
                  StringConstants.doYouWantToDeleteNotification,
                  style: MyTextStyle.titleStyle16bw,
                ),
                SizedBox(
                  height: 10.px,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: CommonWidgets.commonElevatedButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text(
                            StringConstants.no,
                            style: MyTextStyle.titleStyle16bw,
                          ),
                          borderRadius: 30.px,
                          height: 40.px,
                          buttonColor: primaryColor,
                          buttonMargin: EdgeInsets.only(
                              top: 10.px,
                              left: 5.px,
                              right: 10.px,
                              bottom: 10.px)),
                    ),
                    Expanded(
                      flex: 1,
                      child: CommonWidgets.commonElevatedButton(
                          onPressed: () {
                            Get.back();
                            controller.deleteMyNotification(id, index);
                          },
                          child: Text(
                            StringConstants.yes,
                            style: MyTextStyle.titleStyle16bw,
                          ),
                          borderRadius: 30.px,
                          height: 40.px,
                          buttonColor: errorColor,
                          buttonMargin: EdgeInsets.only(
                              top: 10.px,
                              left: 10.px,
                              right: 5.px,
                              bottom: 10.px)),
                    ),
                  ],
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
