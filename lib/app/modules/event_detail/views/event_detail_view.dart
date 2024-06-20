import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/text_styles.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/event_detail_controller.dart';

class EventDetailView extends GetView<EventDetailController> {
  const EventDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.black, Colors.black87],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Stack(
              fit: StackFit.loose,
              alignment: Alignment.center,
              children: [
                CommonWidgets.imageView(
                  image: controller.getEventsResult.image ?? '',
                  height: 300.px,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  top: 230.px,
                  child: Column(
                    children: [
                      Text(
                        controller.getEventsResult.name ?? '',
                        style: MyTextStyle.titleStyle30bw,
                      ),
                      Text(
                        'FANG, SIMON TAYFEI & TOMMY LE',
                        style: MyTextStyle.titleStyle14w,
                      ),
                    ],
                  ),
                ),
                Positioned(
                    top: 50.px,
                    left: 20.px,
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: CommonWidgets.appIcons(
                        assetName: IconConstants.icBack,
                        height: 33.px,
                        width: 33.px,
                        fit: BoxFit.fill,
                      ),
                    )),
              ],
            ),
            Divider(
              thickness: 1.5.px,
              indent: 2.px,
              endIndent: 2.px,
              color: Colors.grey,
            ),
            Container(
              height: 80.px,
              margin: EdgeInsets.all(10.px),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonWidgets.appIcons(
                          assetName: IconConstants.icClock,
                          width: 25.px,
                          height: 25.px,
                          fit: BoxFit.fill),
                      SizedBox(
                        height: 8.px,
                      ),
                      Text(
                        controller.getEventsResult.fromTime ?? '',
                        style: MyTextStyle.titleStyle12w,
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonWidgets.appIcons(
                          assetName: IconConstants.icCard,
                          width: 25.px,
                          height: 25.px,
                          fit: BoxFit.fill),
                      SizedBox(
                        height: 8.px,
                      ),
                      Text(
                        '150 SEK',
                        style: MyTextStyle.titleStyle12w,
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonWidgets.appIcons(
                          assetName: IconConstants.icProfileCheck,
                          width: 25.px,
                          height: 25.px,
                          fit: BoxFit.fill),
                      SizedBox(
                        height: 8.px,
                      ),
                      Text(
                        '${double.parse(controller.getEventsResult.minAge ?? '18').toStringAsFixed(0)} years',
                        style: MyTextStyle.titleStyle12w,
                      )
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 1.px,
              indent: 2.px,
              endIndent: 2.px,
              color: Colors.grey,
            ),
            ListTile(
              leading: CommonWidgets.appIcons(
                  assetName: IconConstants.icStyle,
                  width: 25.px,
                  height: 25.px,
                  fit: BoxFit.fill),
              title: Row(
                children: [
                  Text(
                    StringConstants.style,
                    style: MyTextStyle.titleStyle12w,
                  ),
                  Expanded(
                    child: Text(
                      controller.getEventsResult.style ?? '',
                      style: MyTextStyle.titleStyle13w,
                    ),
                  )
                ],
              ),
            ),
            ListTile(
              leading: CommonWidgets.appIcons(
                  assetName: IconConstants.icStyle,
                  width: 25.px,
                  height: 25.px,
                  fit: BoxFit.fill),
              title: Row(
                children: [
                  Text(
                    StringConstants.age,
                    style: MyTextStyle.titleStyle12w,
                  ),
                  Expanded(
                    child: Text(
                      ': ${double.parse(controller.getEventsResult.minAge ?? '18').toStringAsFixed(0)}+',
                      style: MyTextStyle.titleStyle13w,
                    ),
                  )
                ],
              ),
            ),
            ListTile(
              leading: CommonWidgets.appIcons(
                  assetName: IconConstants.icCrown,
                  width: 25.px,
                  height: 15.px,
                  fit: BoxFit.fill),
              title: Row(
                children: [
                  Text(
                    StringConstants.points,
                    style: MyTextStyle.titleStyle12w,
                  ),
                  Expanded(
                    child: Text(
                      ': ${controller.getEventsResult.points}',
                      style: MyTextStyle.titleStyle13w,
                    ),
                  )
                ],
              ),
            ),
            ListTile(
              leading: CommonWidgets.appIcons(
                  assetName: IconConstants.icCrown,
                  width: 25.px,
                  height: 15.px,
                  fit: BoxFit.fill),
              title: Row(
                children: [
                  Text(
                    StringConstants.payWithBlueCrowns,
                    style: MyTextStyle.titleStyle12w,
                  ),
                  Expanded(
                    child: Text(
                      ': ${controller.getEventsResult.entranceCost}',
                      style: MyTextStyle.titleStyle13w,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.px,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.px, right: 15.px),
              child: Text(
                controller.getEventsResult.description ?? '',
                style: MyTextStyle.titleStyle14w,
              ),
            ),
            SizedBox(
              height: 10.px,
            ),
            CommonWidgets.commonElevatedButton(
                onPressed: () {
                  controller.clickOnTableRequest();
                },
                child: Text(
                  StringConstants.tableRequest,
                  style: MyTextStyle.titleStyle16bw,
                ),
                borderRadius: 30.px,
                buttonColor: primaryColor,
                buttonMargin: EdgeInsets.only(
                    left: 15.px, right: 15.px, bottom: 10.px, top: 10.px)),
            CommonWidgets.commonElevatedButton(
                onPressed: () {
                  controller.clickOnListRequest();
                },
                child: Text(
                  StringConstants.listRequest,
                  style: MyTextStyle.titleStyle16bw,
                ),
                borderRadius: 30.px,
                buttonColor: primaryColor,
                buttonMargin: EdgeInsets.only(
                    left: 15.px, right: 15.px, bottom: 10.px, top: 10.px)),
            CommonWidgets.commonElevatedButton(
                onPressed: () {
                  controller.clickOnPayWithBlueCrownRequest();
                },
                child: Text(
                  StringConstants.payWithBlueCrowns,
                  style: MyTextStyle.titleStyle16bw,
                ),
                borderRadius: 30.px,
                buttonColor: primaryColor,
                buttonMargin: EdgeInsets.only(
                    left: 15.px, right: 15.px, bottom: 10.px, top: 10.px)),
            SizedBox(
              height: 30.px,
            ),
          ],
        ),
      ),
    ));
  }
}
