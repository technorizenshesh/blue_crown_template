import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/text_styles.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/provider_list_history_controller.dart';

class ProviderListHistoryView extends GetView<ProviderListHistoryController> {
  const ProviderListHistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: CommonWidgets.appBar(
          title: StringConstants.listRequest,
          wantBackButton: true,
        ),
        bottomNavigationBar: Container(
          height: 65.px,
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: CommonWidgets.commonElevatedButton(
                      onPressed: () {
                        controller.clickOnCurrentButton();
                      },
                      child: Text(
                        StringConstants.currentList,
                        style: MyTextStyle.titleStyle14bw,
                      ),
                      borderRadius: 30.px,
                      buttonColor: primaryColor,
                      buttonMargin: EdgeInsets.only(
                          left: 10.px, right: 10.px, bottom: 10.px))),
              Expanded(
                  flex: 1,
                  child: CommonWidgets.commonElevatedButton(
                      onPressed: () {
                        controller.clickOnAddToListButton();
                      },
                      child: Text(
                        StringConstants.addToList,
                        style: MyTextStyle.titleStyle14bw,
                      ),
                      borderRadius: 30.px,
                      buttonColor: primaryColor,
                      buttonMargin: EdgeInsets.only(
                          left: 10.px, right: 10.px, bottom: 10.px))),
            ],
          ),
        ),
        body: Obx(() {
          controller.count.value;
          return Padding(
            padding: EdgeInsets.all(5.px),
            child: Column(
              children: [
                SizedBox(height: 5.px),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                                  border: Border.all(
                                      color: controller.tabIndex.value == 0
                                          ? primaryColor
                                          : primary3Color,
                                      width: 1.px)),
                              child: Text(
                                StringConstants.listRequest,
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
                                  border: Border.all(
                                      color: controller.tabIndex.value == 1
                                          ? primaryColor
                                          : primary3Color,
                                      width: 1.px)),
                              child: Text(
                                StringConstants.tableRequest,
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
                        ? currentList()
                        : requestList(),
                  ),
                )
              ],
            ),
          );
        }));
  }

  /// Show Current List   ...
  Widget currentList() {
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
            itemCount: controller.currentList.length,
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
                              flex: 7,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.currentList[index]['name'] ?? '',
                                    style: MyTextStyle.titleStyle16bw,
                                    maxLines: 1,
                                  ),
                                  SizedBox(
                                    height: 2.px,
                                  ),
                                  Text(
                                    controller.currentList[index]['event'] ??
                                        '',
                                    style: MyTextStyle.titleStyle12w,
                                    maxLines: 1,
                                  ),
                                  SizedBox(
                                    height: 2.px,
                                  ),
                                  Text(
                                    controller.currentList[index]['date'] ?? '',
                                    style: MyTextStyle.titleStyle14w,
                                    maxLines: 1,
                                  ),
                                ],
                              )),
                          Expanded(
                              flex: 2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    controller.currentList[index]['people'] ??
                                        '',
                                    style: MyTextStyle.titleStyle16bw,
                                  ),
                                  SizedBox(
                                    height: 5.px,
                                  ),
                                  Container(
                                    height: 24.px,
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.only(
                                        left: 5.px,
                                        right: 5.px,
                                        top: 2.px,
                                        bottom: 2.px),
                                    decoration: BoxDecoration(
                                      color: controller.currentList[index]
                                                  ['status'] ==
                                              'Accepted'
                                          ? greenColor
                                          : Colors.orangeAccent,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12.px)),
                                    ),
                                    child: Text(
                                      controller.currentList[index]['status'] ??
                                          '',
                                      style: MyTextStyle.titleStyle12w,
                                    ),
                                  )
                                ],
                              ))
                        ],
                      )),
                ),
              );
            },
          ));
  }

  /// Show Request List  ...
  Widget requestList() {
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
                  left: 10.px, right: 10.px, top: 5.px, bottom: 5.px),
              clipBehavior: Clip.hardEdge,
            ))
        : ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            itemCount: controller.requestList.length,
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
                              flex: 7,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.requestList[index]['name'] ?? '',
                                    style: MyTextStyle.titleStyle16bw,
                                    maxLines: 1,
                                  ),
                                  SizedBox(
                                    height: 2.px,
                                  ),
                                  Text(
                                    controller.requestList[index]['event'] ??
                                        '',
                                    style: MyTextStyle.titleStyle12w,
                                    maxLines: 1,
                                  ),
                                  SizedBox(
                                    height: 2.px,
                                  ),
                                  Text(
                                    controller.requestList[index]['date'] ?? '',
                                    style: MyTextStyle.titleStyle14w,
                                    maxLines: 1,
                                  ),
                                ],
                              )),
                          Expanded(
                              flex: 2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    controller.requestList[index]['people'] ??
                                        '',
                                    style: MyTextStyle.titleStyle16bw,
                                  ),
                                  SizedBox(
                                    height: 5.px,
                                  ),
                                  Container(
                                    height: 24.px,
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.only(
                                        left: 5.px,
                                        right: 5.px,
                                        top: 2.px,
                                        bottom: 2.px),
                                    decoration: BoxDecoration(
                                      color: controller.requestList[index]
                                                  ['status'] ==
                                              'Accepted'
                                          ? greenColor
                                          : Colors.orangeAccent,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12.px)),
                                    ),
                                    child: Text(
                                      controller.requestList[index]['status'] ??
                                          '',
                                      style: MyTextStyle.titleStyle12w,
                                    ),
                                  )
                                ],
                              ))
                        ],
                      )),
                ),
              );
            },
          ));
  }
}
