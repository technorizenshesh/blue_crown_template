import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/text_styles.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/event_wallet_history_controller.dart';

class EventWalletHistoryView extends GetView<EventWalletHistoryController> {
  const EventWalletHistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: CommonWidgets.appBar(
          title: StringConstants.eventWalletHistory,
          wantBackButton: true,
        ),
        body: Obx(() {
          controller.count.value;
          return Column(
            children: [
              SizedBox(height: 10.px),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        controller.changeTabIndex(0);
                      },
                      child: Container(
                        height: 60.px,
                        margin: EdgeInsets.all(5.px),
                        padding: EdgeInsets.all(5.px),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: controller.tabIndex.value == 0
                                ? primaryColor
                                : cartColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.px)),
                            border:
                                Border.all(color: primary3Color, width: 1.px)),
                        child: Text(
                          StringConstants.eventHistory,
                          style: MyTextStyle.titleStyle16bw,
                        ),
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        controller.changeTabIndex(1);
                      },
                      child: Container(
                        height: 60.px,
                        margin: EdgeInsets.all(5.px),
                        padding: EdgeInsets.all(5.px),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: controller.tabIndex.value == 1
                                ? primaryColor
                                : cartColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.px)),
                            border:
                                Border.all(color: primary3Color, width: 1.px)),
                        child: Text(
                          StringConstants.myWalletHistory,
                          style: MyTextStyle.titleStyle16bw,
                        ),
                      ),
                    ))
              ]),
              SizedBox(height: 10.px),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: controller.tabIndex.value == 0
                      ? eventHistory()
                      : Column(
                          children: [
                            Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.px)),
                              elevation: 10.px,
                              clipBehavior: Clip.hardEdge,
                              color: cartColor,
                              margin: EdgeInsets.only(
                                  top: 10.px,
                                  bottom: 10.px,
                                  left: 10.px,
                                  right: 10.px),
                              child: Container(
                                  height: 150.px,
                                  padding: EdgeInsets.all(5.px),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(20.px)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        StringConstants.yourPoints,
                                        style: MyTextStyle.titleStyle24bw,
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CommonWidgets.appIcons(
                                            assetName:
                                                IconConstants.icCrownWhite,
                                            width: 75.px,
                                            height: 40.px,
                                            fit: BoxFit.fill,
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(left: 10.px),
                                            child: Text(
                                              '130P',
                                              style: MyTextStyle.titleStyle30bw,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )),
                            ),
                            walletHistory(),
                          ],
                        ),
                ),
              )
            ],
          );
        }));
  }

  /// Show Event History ...
  Widget eventHistory() {
    return Obx(() => controller.showProgressBar.value
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
            itemCount: controller.eventHistoryList.length,
            itemBuilder: (context, int index) {
              //  GetClubsResult item = controller.getClubsModel!.result![index];
              return GestureDetector(
                onTap: () {
                  //controller.openEventDetail(index);
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.px)),
                  ),
                  color: cartColor,
                  clipBehavior: Clip.hardEdge,
                  elevation: 5.px,
                  margin: EdgeInsets.only(
                      left: 10.px, right: 10.px, top: 5.px, bottom: 5.px),
                  child: Container(
                      height: 90.px,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(10.px),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(10.px)),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                              flex: 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.eventHistoryList[index]
                                            ['name'] ??
                                        '',
                                    style: MyTextStyle.titleStyle16bw,
                                    maxLines: 1,
                                  ),
                                  SizedBox(
                                    height: 2.px,
                                  ),
                                  Text(
                                    controller.eventHistoryList[index]
                                            ['event'] ??
                                        '',
                                    style: MyTextStyle.titleStyle12w,
                                    maxLines: 1,
                                  ),
                                  SizedBox(
                                    height: 2.px,
                                  ),
                                  Text(
                                    controller.eventHistoryList[index]
                                            ['date'] ??
                                        '',
                                    style: MyTextStyle.titleStyle14w,
                                    maxLines: 1,
                                  ),
                                ],
                              )),
                          Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CommonWidgets.appIcons(
                                      assetName: IconConstants.icCrown,
                                      width: 30.px,
                                      height: 20.px,
                                      fit: BoxFit.fill),
                                  SizedBox(
                                    height: 2.px,
                                  ),
                                  Text(
                                    controller.eventHistoryList[index]
                                            ['amount'] ??
                                        '',
                                    style: MyTextStyle.titleStyle16bw,
                                  ),
                                ],
                              ))
                        ],
                      )),
                ),
              );
            },
          ));
  }

  /// Show Wallet History ...
  Widget walletHistory() {
    return Obx(() => controller.showProgressBar.value
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
            itemCount: controller.walletHistoryList.length,
            itemBuilder: (context, int index) {
              //  GetClubsResult item = controller.getClubsModel!.result![index];
              return GestureDetector(
                onTap: () {
                  //controller.openEventDetail(index);
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.px)),
                  ),
                  color: cartColor,
                  clipBehavior: Clip.hardEdge,
                  elevation: 5.px,
                  margin: EdgeInsets.only(
                      left: 10.px, right: 10.px, top: 3.px, bottom: 3.px),
                  child: Container(
                    height: 70.px,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(10.px)),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: ListTile(
                            leading: Stack(
                              alignment: Alignment.center,
                              children: [
                                CommonWidgets.appIcons(
                                    assetName: IconConstants.icCircle,
                                    width: 60.px,
                                    height: 60.px,
                                    fit: BoxFit.fill),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CommonWidgets.appIcons(
                                        assetName: IconConstants.icCrownWhite,
                                        width: 25.px,
                                        height: 15.px,
                                        fit: BoxFit.fill),
                                    Text(
                                      controller.walletHistoryList[index]
                                              ['amount'] ??
                                          '',
                                      style: MyTextStyle.titleStyle12w,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            title: Text(
                              controller.walletHistoryList[index]['event'] ??
                                  '',
                              style: MyTextStyle.titleStyle16bw,
                              maxLines: 1,
                            ),
                            subtitle: Text(
                              'Lorem ipsum dolor sit amet consectetur. ',
                              style: MyTextStyle.titleStyle12w,
                              maxLines: 1,
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: Text(
                              controller.walletHistoryList[index]['date'] ?? '',
                              style: MyTextStyle.titleStyle14w,
                              maxLines: 1,
                            ))
                      ],
                    ),
                  ),
                ),
              );
            },
          ));
  }
}
