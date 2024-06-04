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
            onPressed: () {},
            child: Text(
              StringConstants.download,
              style: MyTextStyle.titleStyle14bw,
            ),
            borderRadius: 30.px,
            buttonColor: primaryColor,
            buttonMargin:
                EdgeInsets.only(left: 10.px, right: 10.px, bottom: 10.px)),
        body: Obx(() {
          controller.count.value;
          return Padding(
            padding: EdgeInsets.all(5.px),
            child: Column(
              children: [
                SizedBox(height: 10.px),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: requestList(),
                  ),
                )
              ],
            ),
          );
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
        : controller.listRequestResult != null
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
                      // showAlertBox(context, item);
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
            : CommonWidgets.dataNotFound());
  }
}
