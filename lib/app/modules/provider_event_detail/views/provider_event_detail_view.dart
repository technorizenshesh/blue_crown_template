import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/text_styles.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/provider_event_detail_controller.dart';

class ProviderEventDetailView extends GetView<ProviderEventDetailController> {
  const ProviderEventDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CommonWidgets.appBar(
          title: StringConstants.eventDetails, wantBackButton: true),
      body: Obx(() {
        controller.inAsyncCall.value;
        return CommonWidgets.customProgressBar(
            inAsyncCall: controller.inAsyncCall.value,
            child: Container(
              padding: EdgeInsets.all(10.px),
              decoration: const BoxDecoration(color: backgroundColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    controller.getEventsResult.status ?? '',
                    style: MyTextStyle.titleStyle18bw,
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.px)),
                    color: cartColor,
                    clipBehavior: Clip.hardEdge,
                    elevation: 5.px,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonWidgets.imageView(
                            image: controller.getEventsResult.image ?? '',
                            width: double.infinity,
                            height: 150.px,
                            fit: BoxFit.fill),
                        Padding(
                          padding: EdgeInsets.all(10.px),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 5.px,
                              ),
                              Text(
                                controller.getEventsResult.name ?? '',
                                style: MyTextStyle.titleStyle16bw,
                              ),
                              SizedBox(
                                height: 5.px,
                              ),
                              Text(
                                controller.getEventsResult.description ?? '',
                                style: MyTextStyle.titleStyle12w,
                                textAlign: TextAlign.justify,
                                maxLines: 7,
                              ),
                              SizedBox(
                                height: 10.px,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: GestureDetector(
                                        onTap: () {
                                          controller.clickOnListRequest();
                                        },
                                        child: Container(
                                          height: 50.px,
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 10.px,
                                              vertical: 5.px),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25.px),
                                              color: backgroundColor,
                                              border: Border.all(
                                                  width: 1.5.px,
                                                  color: primaryColor)),
                                          child: Text(
                                            StringConstants.listRequest,
                                            style: MyTextStyle.titleStyle14bw,
                                          ),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: GestureDetector(
                                        onTap: () {
                                          controller.clickOnListChange();
                                        },
                                        child: Container(
                                          height: 50.px,
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 10.px,
                                              vertical: 5.px),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25.px),
                                              color: backgroundColor,
                                              border: Border.all(
                                                  width: 1.5.px,
                                                  color: primaryColor)),
                                          child: Text(
                                            StringConstants.change,
                                            style: MyTextStyle.titleStyle14bw,
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 10.px,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: GestureDetector(
                                        onTap: () {
                                          controller.clickOnPushNotification();
                                        },
                                        child: Container(
                                          height: 50.px,
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 10.px,
                                              vertical: 5.px),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25.px),
                                              color: backgroundColor,
                                              border: Border.all(
                                                  width: 1.5.px,
                                                  color: primaryColor)),
                                          child: Text(
                                            StringConstants.pushNotification,
                                            style: MyTextStyle.titleStyle14bw,
                                          ),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: GestureDetector(
                                        onTap: () {
                                          showAlertBox(context);
                                        },
                                        child: Container(
                                          height: 50.px,
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 10.px,
                                              vertical: 5.px),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25.px),
                                              color: backgroundColor,
                                              border: Border.all(
                                                  width: 1.5.px,
                                                  color: primaryColor)),
                                          child: Text(
                                            controller.getEventsResult.status ==
                                                    'Active'
                                                ? StringConstants.deactivate
                                                : StringConstants.activate,
                                            style: MyTextStyle.titleStyle14bw,
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 10.px,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: GestureDetector(
                                        onTap: () {
                                          controller.clickOnDownloadQrCode();
                                        },
                                        child: Container(
                                          height: 50.px,
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 10.px,
                                              vertical: 5.px),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25.px),
                                              color: backgroundColor,
                                              border: Border.all(
                                                  width: 1.5.px,
                                                  color: primaryColor)),
                                          child: Text(
                                            StringConstants.downloadQrCode,
                                            style: MyTextStyle.titleStyle14bw,
                                          ),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: GestureDetector(
                                        onTap: () {
                                          controller.clickOnPurchasedUser();
                                        },
                                        child: Container(
                                          height: 50.px,
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 10.px,
                                              vertical: 5.px),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25.px),
                                              color: backgroundColor,
                                              border: Border.all(
                                                  width: 1.5.px,
                                                  color: primaryColor)),
                                          child: Text(
                                            StringConstants.purchasedUser,
                                            style: MyTextStyle.titleStyle14bw,
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ));
      }),
    );
  }

  /// Show Alert Box...
  void showAlertBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 20.px),
        contentPadding: EdgeInsets.zero,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.px))),
        content: SizedBox(
          height: 200.px,
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
                  height: 10.px,
                ),
                Text(
                  StringConstants.areYouSure,
                  style: MyTextStyle.titleStyle20bw,
                ),
                SizedBox(
                  height: 10.px,
                ),
                Padding(
                  padding: EdgeInsets.all(4.0.px),
                  child: Text(
                    'Do you want to ${controller.getEventsResult.status == 'Active' ? 'Deactivate' : 'Activate'} this event ?',
                    style: MyTextStyle.titleStyle16w,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 30.px,
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
                          buttonColor: errorColor,
                          buttonMargin: EdgeInsets.only(
                              top: 10.px,
                              left: 10.px,
                              right: 5.px,
                              bottom: 10.px)),
                    ),
                    Expanded(
                      flex: 1,
                      child: CommonWidgets.commonElevatedButton(
                          onPressed: () {
                            Get.back();
                            controller.changeEventStatus();
                          },
                          child: Text(
                            StringConstants.yes,
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
