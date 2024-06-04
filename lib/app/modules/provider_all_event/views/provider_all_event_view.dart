import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/text_styles.dart';
import '../../../data/apis/api_models/get_event_model.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/provider_all_event_controller.dart';

class ProviderAllEventView extends GetView<ProviderAllEventController> {
  const ProviderAllEventView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.count.value;
    return Obx(() {
      controller.count.value;
      return Scaffold(
        backgroundColor: backgroundColor,
        appBar: CommonWidgets.appBar(
          title: StringConstants.clubEvents,
          wantBackButton: true,
        ),
        body: Column(
          children: [
            SizedBox(height: 5.px),
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
                          border: Border.all(
                              color: controller.tabIndex.value == 0
                                  ? primaryColor
                                  : primary3Color,
                              width: 1.px)),
                      child: Text(
                        StringConstants.activeEvent,
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
                        StringConstants.inactiveEvent,
                        style: MyTextStyle.titleStyle16bw,
                      ),
                    ),
                  ))
            ]),
            SizedBox(height: 10.px),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    controller.tabIndex.value == 0
                        ? showClubEvents()
                        : showInactiveEvents(),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    });
  }

  /// Show Active Club Events...
  Widget showClubEvents() {
    return Obx(() => controller.showActiveEventsProgressBar.value
        ? CommonWidgets.commonShimmer(
            itemCount: 4,
            shimmerWidget: Container(
              height: 120.px,
              width: double.infinity,
              margin: EdgeInsets.only(
                  left: 20.px, right: 20.px, top: 5.px, bottom: 5.px),
              child: Row(
                children: [
                  Expanded(
                      flex: 4,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.px)),
                        ),
                      )),
                  Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 15.px,
                            margin: EdgeInsets.symmetric(
                                horizontal: 3.px, vertical: 0.px),
                            decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2.px)),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                height: 15.px,
                                width: 15.px,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 3.px, vertical: 0.px),
                                decoration: BoxDecoration(
                                  color: Colors.black87,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2.px)),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 15.px,
                                  width: 120.px,
                                  decoration: BoxDecoration(
                                    color: Colors.black87,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(2.px)),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 15.px,
                                width: 15.px,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 3.px, vertical: 0.px),
                                decoration: BoxDecoration(
                                  color: Colors.black87,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2.px)),
                                ),
                              ),
                              Container(
                                height: 15.px,
                                width: 110.px,
                                decoration: BoxDecoration(
                                  color: Colors.black87,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2.px)),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 15.px,
                                width: 15.px,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 3.px, vertical: 0.px),
                                decoration: BoxDecoration(
                                  color: Colors.black87,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2.px)),
                                ),
                              ),
                              Container(
                                height: 15.px,
                                width: 80.px,
                                decoration: BoxDecoration(
                                  color: Colors.black87,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2.px)),
                                ),
                              )
                            ],
                          ),
                        ],
                      )),
                  Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 15.px,
                            width: 15.px,
                            margin: EdgeInsets.symmetric(
                                horizontal: 3.px, vertical: 5.px),
                            decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2.px)),
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                height: 20.px,
                                width: 25.px,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 3.px, vertical: 0.px),
                                decoration: BoxDecoration(
                                  color: Colors.black87,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2.px)),
                                ),
                              ),
                              Container(
                                height: 10.px,
                                width: 25.px,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 3.px, vertical: 5.px),
                                decoration: BoxDecoration(
                                  color: Colors.black87,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2.px)),
                                ),
                              ),
                            ],
                          )
                        ],
                      ))
                ],
              ),
            ))
        : ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            itemCount: controller.activeEventList.length,
            itemBuilder: (context, int index) {
              GetEventsResult item = controller.activeEventList[index];
              return GestureDetector(
                onTap: () {
                  controller.openActiveEventDetail(index, 'Active Event');
                },
                child: Container(
                  height: 120.px,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(10.px)),
                  ),
                  margin: EdgeInsets.only(
                      left: 10.px, right: 10.px, top: 3.px, bottom: 3.px),
                  clipBehavior: Clip.hardEdge,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          flex: 4,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.px, vertical: 0.px),
                            child: CommonWidgets.imageView(
                              image: item.image ?? '',
                              fit: BoxFit.fill,
                              height: 100.px,
                              width: 150.px,
                            ),
                          )),
                      Expanded(
                          flex: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                item.name ?? '',
                                style: MyTextStyle.titleStyle16w,
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
                                      '${item.fromDate} to ${item.toDate}',
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
                                      item.fromTime ?? '',
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
                                    Icons.location_on_outlined,
                                    size: 20.px,
                                    color: primary3Color,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'location',
                                      style: MyTextStyle.titleStyle12w,
                                      maxLines: 2,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )),
                      Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CommonWidgets.appIcons(
                                  assetName: IconConstants.icStar,
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
                                    '${item.points} P',
                                    style: MyTextStyle.titleStyle12bb,
                                  )
                                ],
                              )
                            ],
                          ))
                    ],
                  ),
                ),
              );
            },
          ));
  }

  /// Show Inactive Events...
  Widget showInactiveEvents() {
    return Obx(() => controller.showInactiveEventsProgressBar.value
        ? CommonWidgets.commonShimmer(
            itemCount: 4,
            shimmerWidget: Container(
              height: 120.px,
              width: double.infinity,
              margin: EdgeInsets.only(
                  left: 20.px, right: 20.px, top: 5.px, bottom: 5.px),
              child: Row(
                children: [
                  Expanded(
                      flex: 4,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black87,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.px)),
                        ),
                      )),
                  Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 15.px,
                            margin: EdgeInsets.symmetric(
                                horizontal: 3.px, vertical: 0.px),
                            decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2.px)),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                height: 15.px,
                                width: 15.px,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 3.px, vertical: 0.px),
                                decoration: BoxDecoration(
                                  color: Colors.black87,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2.px)),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 15.px,
                                  width: 120.px,
                                  decoration: BoxDecoration(
                                    color: Colors.black87,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(2.px)),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 15.px,
                                width: 15.px,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 3.px, vertical: 0.px),
                                decoration: BoxDecoration(
                                  color: Colors.black87,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2.px)),
                                ),
                              ),
                              Container(
                                height: 15.px,
                                width: 110.px,
                                decoration: BoxDecoration(
                                  color: Colors.black87,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2.px)),
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 15.px,
                                width: 15.px,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 3.px, vertical: 0.px),
                                decoration: BoxDecoration(
                                  color: Colors.black87,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2.px)),
                                ),
                              ),
                              Container(
                                height: 15.px,
                                width: 80.px,
                                decoration: BoxDecoration(
                                  color: Colors.black87,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2.px)),
                                ),
                              )
                            ],
                          ),
                        ],
                      )),
                  Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 15.px,
                            width: 15.px,
                            margin: EdgeInsets.symmetric(
                                horizontal: 3.px, vertical: 5.px),
                            decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(2.px)),
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                height: 20.px,
                                width: 25.px,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 3.px, vertical: 0.px),
                                decoration: BoxDecoration(
                                  color: Colors.black87,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2.px)),
                                ),
                              ),
                              Container(
                                height: 10.px,
                                width: 25.px,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 3.px, vertical: 5.px),
                                decoration: BoxDecoration(
                                  color: Colors.black87,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2.px)),
                                ),
                              ),
                            ],
                          )
                        ],
                      ))
                ],
              ),
            ))
        : ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            itemCount: controller.inactiveEventList.length,
            itemBuilder: (context, int index) {
              GetEventsResult item = controller.inactiveEventList[index];
              return GestureDetector(
                onTap: () {
                  controller.openInactiveEventDetail(index, 'Inactive Event');
                },
                child: Container(
                  height: 120.px,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(10.px)),
                  ),
                  margin: EdgeInsets.only(
                      left: 10.px, right: 10.px, top: 3.px, bottom: 3.px),
                  clipBehavior: Clip.hardEdge,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          flex: 4,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.px, vertical: 0.px),
                            child: CommonWidgets.imageView(
                              image: item.image ?? '',
                              fit: BoxFit.fill,
                              height: 100.px,
                              width: 150.px,
                            ),
                          )),
                      Expanded(
                          flex: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                item.name ?? '',
                                style: MyTextStyle.titleStyle16w,
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
                                      '${item.fromDate} to ${item.toDate}',
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
                                      item.fromTime ?? '',
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
                                    Icons.location_on_outlined,
                                    size: 20.px,
                                    color: primary3Color,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'location',
                                      style: MyTextStyle.titleStyle12w,
                                      maxLines: 2,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )),
                      Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CommonWidgets.appIcons(
                                  assetName: IconConstants.icStar,
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
                                    '${item.points} P',
                                    style: MyTextStyle.titleStyle12bb,
                                  )
                                ],
                              )
                            ],
                          ))
                    ],
                  ),
                ),
              );
            },
          ));
  }
}
