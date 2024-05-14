import 'package:blue_crown_template/app/data/constants/icons_constant.dart';
import 'package:blue_crown_template/app/modules/controller/history_controller.dart';
import 'package:blue_crown_template/common/colors.dart';
import 'package:blue_crown_template/common/common_widgets.dart';
import 'package:blue_crown_template/common/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../data/constants/string_constants.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({Key? key}) : super(key: key);
  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  HistoryController controller = Get.put(HistoryController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: CommonWidgets.appBar(
            title: StringConstants.history,
            wantBackButton: true,
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 20.px),
                child: CommonWidgets.appIcons(
                    assetName: IconConstants.icCrownWhite,
                    width: 25.px,
                    height: 25.px,
                    fit: BoxFit.fill),
              ),
            ]),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: showJacketHistory(),
              ),
            )
          ],
        ));
  }

  /// Show Jacket History ...
  Widget showJacketHistory() {
    return Obx(() => controller.showEventsProgressBar.value
        ? CommonWidgets.commonShimmer(
            itemCount: 4,
            shimmerWidget: Container(
              height: 200.px,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(10.px)),
              ),
              margin: EdgeInsets.only(
                  left: 20.px, right: 20.px, top: 5.px, bottom: 2.px),
              clipBehavior: Clip.hardEdge,
            ))
        : ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            itemCount: controller.jacketHistory.length,
            itemBuilder: (context, int index) {
              //  GetClubsResult item = controller.getClubsModel!.result![index];
              return GestureDetector(
                onTap: () {
                  //controller.openEventDetail(index);
                },
                child: Container(
                  height: 95.px,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(10.px)),
                  ),
                  margin: EdgeInsets.only(
                      left: 10.px, right: 10.px, top: 3.px, bottom: 3.px),
                  clipBehavior: Clip.hardEdge,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              flex: 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    controller.jacketHistory[index]['name'] ??
                                        '',
                                    style: MyTextStyle.titleStyle16bw,
                                    maxLines: 1,
                                  ),
                                  SizedBox(
                                    height: 3.px,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.calendar_month,
                                        size: 20.px,
                                        color: primary3Color,
                                      ),
                                      Expanded(
                                        child: Text(
                                          controller.jacketHistory[index]
                                                  ['date'] ??
                                              '',
                                          style: MyTextStyle.titleStyle12w,
                                          maxLines: 2,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 3.px,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.access_time,
                                        size: 20.px,
                                        color: primary3Color,
                                      ),
                                      Expanded(
                                        child: Text(
                                          controller.jacketHistory[index]
                                                  ['time'] ??
                                              '',
                                          style: MyTextStyle.titleStyle12w,
                                          maxLines: 2,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 3.px,
                                  )
                                ],
                              )),
                          Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CommonWidgets.appIcons(
                                      assetName: IconConstants.icWardrobeBlue,
                                      width: 25.px,
                                      height: 25.px,
                                      fit: BoxFit.fill),
                                  Column(
                                    children: [
                                      CommonWidgets.appIcons(
                                          assetName: IconConstants.icCrown,
                                          width: 25.px,
                                          height: 14.px,
                                          fit: BoxFit.fill),
                                      Text(
                                        '50 P',
                                        style: MyTextStyle.titleStyle12bb,
                                      )
                                    ],
                                  )
                                ],
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 3.px,
                      ),
                      Divider(
                        indent: 0.px,
                        endIndent: 0.px,
                        color: primary3Color,
                        thickness: 1.px,
                      ),
                    ],
                  ),
                ),
              );
            },
          ));
  }
}
