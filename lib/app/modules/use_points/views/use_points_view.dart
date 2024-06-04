import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/text_styles.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/use_points_controller.dart';

class UsePointsView extends GetView<UsePointsController> {
  const UsePointsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        backgroundColor: Colors.black,
        appBar: CommonWidgets.appBar(
            title: StringConstants.usePoints, wantBackButton: true),
        body: Padding(
          padding: EdgeInsets.all(20.px),
          child: Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.px)),
                elevation: 10.px,
                clipBehavior: Clip.hardEdge,
                color: primaryColor,
                margin: EdgeInsets.only(top: 20.px, bottom: 40.px),
                child: Container(
                    height: 150.px,
                    padding: EdgeInsets.all(5.px),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.px)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          StringConstants.yourPoints,
                          style: MyTextStyle.titleStyle24bw,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CommonWidgets.appIcons(
                              assetName: IconConstants.icCrownWhite,
                              width: 75.px,
                              height: 40.px,
                              fit: BoxFit.fill,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.px),
                              child: Text(
                                '${controller.walletAmount.value} P',
                                style: MyTextStyle.titleStyle30bw,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  controller.getEventsResult.name ?? '',
                  style: MyTextStyle.titleStyle16bw,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.px),
                  color: Colors.grey.withOpacity(0.6),
                ),
                clipBehavior: Clip.hardEdge,
                margin: EdgeInsets.only(top: 10.px, bottom: 10.px),
                child: Container(
                    padding: EdgeInsets.all(10.px),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.px)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CommonWidgets.appIcons(
                          assetName: IconConstants.icCrown,
                          width: 35.px,
                          height: 20.px,
                          fit: BoxFit.fill,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 5.px),
                          child: Text(
                            ' ${controller.getEventsResult.entranceCost} P',
                            style: MyTextStyle.titleStyle16bw,
                          ),
                        )
                      ],
                    )),
              ),
              SizedBox(
                height: 20.px,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Are you sure you want use ${controller.getEventsResult.entranceCost} points for entrance for this event',
                  style: MyTextStyle.titleStyle16bw,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 20.px,
              ),
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: CommonWidgets.commonElevatedButton(
                          onPressed: () {
                            controller.callingAddPurchaseEventsForm();
                          },
                          child: Text(
                            StringConstants.yes,
                            style: MyTextStyle.titleStyle16bw,
                          ),
                          borderRadius: 30.px,
                          buttonColor: primaryColor,
                          isLoading: controller.isLoading.value,
                          buttonMargin: EdgeInsets.only(right: 10.px))),
                  Expanded(
                      flex: 1,
                      child: CommonWidgets.commonElevatedButton(
                          onPressed: () {},
                          child: Text(
                            StringConstants.no,
                            style: MyTextStyle.titleStyle16bw,
                          ),
                          borderRadius: 30.px,
                          buttonColor: Colors.grey.withOpacity(0.6),
                          buttonMargin: EdgeInsets.only(left: 10.px))),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
