import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/text_styles.dart';
import '../../../data/apis/api_models/get_club_request_model.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/provider_current_list_controller.dart';

class ProviderCurrentListView extends GetView<ProviderCurrentListController> {
  const ProviderCurrentListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: CommonWidgets.appBar(
          title: StringConstants.currentList,
          wantBackButton: true,
        ),
        bottomNavigationBar: CommonWidgets.commonElevatedButton(
            onPressed: () {
              showAlertBox(context);
            },
            child: Text(
              StringConstants.download,
              style: MyTextStyle.titleStyle14bw,
            ),
            borderRadius: 30.px,
            buttonColor: primaryColor,
            isLoading: controller.isLoading.value,
            buttonMargin:
                EdgeInsets.only(left: 10.px, right: 10.px, bottom: 10.px)),
        body: Obx(() {
          controller.count.value;
          return Padding(
              padding: EdgeInsets.all(5.px),
              child: CommonWidgets.customProgressBar(
                inAsyncCall: controller.inAsyncCall.value,
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.px)),
                                      border: Border.all(
                                          color: controller.tabIndex.value == 0
                                              ? primaryColor
                                              : primary3Color,
                                          width: 1.px)),
                                  child: Text(
                                    StringConstants.listRequests,
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30.px)),
                                      border: Border.all(
                                          color: controller.tabIndex.value == 1
                                              ? primaryColor
                                              : primary3Color,
                                          width: 1.px)),
                                  child: Text(
                                    StringConstants.tableRequests,
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
                            ? requestList()
                            : tableRequestList(),
                      ),
                    )
                  ],
                ),
              ));
        }));
  }

  /// Show Request List  ...
  Widget requestList() {
    return Obx(() => controller.showListProgressBar.value
        ? CommonWidgets.commonShimmer(
            itemCount: 7,
            shimmerWidget: Container(
              height: 90.px,
              width: double.infinity,
              margin: EdgeInsets.only(
                  left: 10.px, right: 10.px, top: 5.px, bottom: 5.px),
              padding: EdgeInsets.all(5.px),
              child: Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.px)),
                        ),
                      )),
                  Expanded(
                      flex: 7,
                      child: Padding(
                        padding: EdgeInsets.only(left: 5.px),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 15.px,
                              decoration: BoxDecoration(
                                color: Colors.black87,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3.px)),
                              ),
                            ),
                            Container(
                              height: 15.px,
                              width: 100.px,
                              decoration: BoxDecoration(
                                color: Colors.black87,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3.px)),
                              ),
                            ),
                            Container(
                              height: 15.px,
                              width: 130.px,
                              decoration: BoxDecoration(
                                color: Colors.black87,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3.px)),
                              ),
                            )
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 3,
                      child: Padding(
                        padding: EdgeInsets.all(5.px),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 15.px,
                              width: 40.px,
                              decoration: BoxDecoration(
                                color: Colors.black87,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3.px)),
                              ),
                            ),
                            Container(
                              height: 25.px,
                              decoration: BoxDecoration(
                                color: Colors.black87,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.px)),
                              ),
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ))
        : controller.listRequestResult!.eventReqData!.isNotEmpty
            ? ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: controller.listRequestResult!.eventReqData!.length,
                itemBuilder: (context, int index) {
                  EventReqData item =
                      controller.listRequestResult!.eventReqData![index];
                  return GestureDetector(
                    onTap: () {
                      controller.clickOnList(item.id ?? '', index);
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.px)),
                          ),
                          clipBehavior: Clip.hardEdge,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                  flex: 3,
                                  child: CommonWidgets.imageView(
                                      image:
                                          controller.listRequestResult!.image ??
                                              '',
                                      borderRadius:
                                          BorderRadius.circular(10.px))),
                              Expanded(
                                  flex: 7,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 5.px),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item.name ?? '',
                                          style: MyTextStyle.titleStyle16bw,
                                          maxLines: 1,
                                        ),
                                        SizedBox(
                                          height: 2.px,
                                        ),
                                        Text(
                                          controller.listRequestResult!.name ??
                                              '',
                                          style: MyTextStyle.titleStyle12w,
                                          maxLines: 1,
                                        ),
                                        SizedBox(
                                          height: 2.px,
                                        ),
                                        Text(
                                          '${controller.listRequestResult!.fromDate} to ${controller.listRequestResult!.toDate}',
                                          style: MyTextStyle.titleStyle14w,
                                          maxLines: 1,
                                        ),
                                      ],
                                    ),
                                  )),
                              Expanded(
                                  flex: 3,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${item.people} +',
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
                                          color: item.status == 'Accept'
                                              ? greenColor
                                              : item.status == 'Pending'
                                                  ? Colors.orangeAccent
                                                  : errorColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12.px)),
                                        ),
                                        child: Text(
                                          item.status ?? '',
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
              )
            : Padding(
                padding: EdgeInsets.all(10.px),
                child: CommonWidgets.dataNotFound(),
              ));
  }

  /// Show TableRequest List  ...
  Widget tableRequestList() {
    return Obx(() => controller.showTableProgressBar.value
        ? CommonWidgets.commonShimmer(
            itemCount: 7,
            shimmerWidget: Container(
              height: 90.px,
              width: double.infinity,
              margin: EdgeInsets.only(
                  left: 10.px, right: 10.px, top: 5.px, bottom: 5.px),
              padding: EdgeInsets.all(5.px),
              child: Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.px)),
                        ),
                      )),
                  Expanded(
                      flex: 7,
                      child: Padding(
                        padding: EdgeInsets.only(left: 5.px),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 15.px,
                              decoration: BoxDecoration(
                                color: Colors.black87,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3.px)),
                              ),
                            ),
                            Container(
                              height: 15.px,
                              width: 100.px,
                              decoration: BoxDecoration(
                                color: Colors.black87,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3.px)),
                              ),
                            ),
                            Container(
                              height: 15.px,
                              width: 130.px,
                              decoration: BoxDecoration(
                                color: Colors.black87,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3.px)),
                              ),
                            )
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 3,
                      child: Padding(
                        padding: EdgeInsets.all(5.px),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 15.px,
                              width: 40.px,
                              decoration: BoxDecoration(
                                color: Colors.black87,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3.px)),
                              ),
                            ),
                            Container(
                              height: 25.px,
                              decoration: BoxDecoration(
                                color: Colors.black87,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.px)),
                              ),
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ))
        : controller.tableRequestResult!.eventReqData!.isNotEmpty
            ? ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: controller.tableRequestResult!.eventReqData!.length,
                itemBuilder: (context, int index) {
                  EventReqData item =
                      controller.tableRequestResult!.eventReqData![index];
                  return GestureDetector(
                    onTap: () {
                      controller.clickOnList(item.id ?? '', index);
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.px)),
                          ),
                          clipBehavior: Clip.hardEdge,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                  flex: 3,
                                  child: CommonWidgets.imageView(
                                      image:
                                          controller.listRequestResult!.image ??
                                              '',
                                      borderRadius:
                                          BorderRadius.circular(10.px))),
                              Expanded(
                                  flex: 7,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 5.px),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item.name ?? '',
                                          style: MyTextStyle.titleStyle16bw,
                                          maxLines: 1,
                                        ),
                                        SizedBox(
                                          height: 2.px,
                                        ),
                                        Text(
                                          controller.tableRequestResult!.name ??
                                              '',
                                          style: MyTextStyle.titleStyle12w,
                                          maxLines: 1,
                                        ),
                                        SizedBox(
                                          height: 2.px,
                                        ),
                                        Text(
                                          '${controller.tableRequestResult!.fromDate} to ${controller.tableRequestResult!.toDate}',
                                          style: MyTextStyle.titleStyle14w,
                                          maxLines: 1,
                                        ),
                                      ],
                                    ),
                                  )),
                              Expanded(
                                  flex: 3,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${item.people} +',
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
                                          color: item.status == 'Accept'
                                              ? greenColor
                                              : item.status == 'Pending'
                                                  ? Colors.orangeAccent
                                                  : errorColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12.px)),
                                        ),
                                        child: Text(
                                          item.status ?? '',
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
              )
            : Padding(
                padding: EdgeInsets.all(10.px),
                child: CommonWidgets.dataNotFound(),
              ));
  }

  /// Open Alert Box for Select file type...
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
          height: 230.px,
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
                  'Choose File type',
                  style: MyTextStyle.titleStyle20bw,
                ),
                SizedBox(
                  height: 10.px,
                ),
                Padding(
                  padding: EdgeInsets.all(4.0.px),
                  child: Text(
                    'Select any file type in which you want to to download list',
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
                            if (controller.tabIndex.value == 0) {
                              if (controller.listRequestResult!.eventReqData!
                                  .isNotEmpty) {
                                controller.generatePdf(controller
                                    .listRequestResult!.eventReqData!);
                              } else {
                                CommonWidgets.showMyToastMessage(
                                    'List user are not available...');
                              }
                            } else {
                              if (controller.tableRequestResult!.eventReqData!
                                  .isNotEmpty) {
                                controller.generatePdf(controller
                                    .tableRequestResult!.eventReqData!);
                              } else {
                                CommonWidgets.showMyToastMessage(
                                    'Table request user are not available...');
                              }
                            }
                          },
                          child: Text(
                            'PDF',
                            style: MyTextStyle.titleStyle16bw,
                          ),
                          borderRadius: 30.px,
                          height: 40.px,
                          buttonColor: primaryColor,
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
                            if (controller.tabIndex.value == 0) {
                              if (controller.listRequestResult!.eventReqData!
                                  .isNotEmpty) {
                                controller.clickOnDownloadExcel();
                              } else {
                                CommonWidgets.showMyToastMessage(
                                    'List user are not available...');
                              }
                            } else {
                              if (controller.tableRequestResult!.eventReqData!
                                  .isNotEmpty) {
                                controller.clickOnDownloadExcel();
                              } else {
                                CommonWidgets.showMyToastMessage(
                                    'Table request user are not available...');
                              }
                            }
                          },
                          child: Text(
                            'Excel Sheet',
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
