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
      body: Padding(
        padding: EdgeInsets.all(10.px),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              controller.parameters['type'] ?? '',
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
                  CommonWidgets.appIcons(
                      assetName: controller.parameters['image'] ?? '',
                      width: double.infinity,
                      height: 150.px,
                      borderRadius: 0.px,
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
                          controller.parameters['event'] ?? '',
                          style: MyTextStyle.titleStyle16bw,
                        ),
                        SizedBox(
                          height: 5.px,
                        ),
                        Text(
                          StringConstants.test,
                          style: MyTextStyle.titleStyle12w,
                          textAlign: TextAlign.justify,
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
                                        horizontal: 10.px, vertical: 5.px),
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
                                child: Container(
                                  height: 50.px,
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 10.px, vertical: 5.px),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(25.px),
                                      color: backgroundColor,
                                      border: Border.all(
                                          width: 1.5.px, color: primaryColor)),
                                  child: Text(
                                    StringConstants.change,
                                    style: MyTextStyle.titleStyle14bw,
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
                                child: Container(
                                  height: 50.px,
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 10.px, vertical: 5.px),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(25.px),
                                      color: backgroundColor,
                                      border: Border.all(
                                          width: 1.5.px, color: primaryColor)),
                                  child: Text(
                                    StringConstants.pushNotification,
                                    style: MyTextStyle.titleStyle14bw,
                                  ),
                                )),
                            Expanded(
                                flex: 1,
                                child: Container(
                                  height: 50.px,
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 10.px, vertical: 5.px),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(25.px),
                                      color: backgroundColor,
                                      border: Border.all(
                                          width: 1.5.px, color: primaryColor)),
                                  child: Text(
                                    controller.parameters['type'] ==
                                            'Active Event'
                                        ? StringConstants.deactivate
                                        : StringConstants.activate,
                                    style: MyTextStyle.titleStyle14bw,
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
      ),
    );
  }
}
