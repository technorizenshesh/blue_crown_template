import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/text_styles.dart';
import '../../../data/apis/api_models/get_event_model.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/club_events_controller.dart';

class ClubEventsView extends GetView<ClubEventsController> {
  const ClubEventsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: CommonWidgets.appBar(
            title: StringConstants.chooseEvents, wantBackButton: true),
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.black, Colors.black87],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: showClubEvents(),
                ),
              )
            ],
          ),
        ));
  }

  /// Show Club Events...
  Widget showClubEvents() {
    return Obx(() => controller.showEventsProgressBar.value
        ? CommonWidgets.commonShimmer(
            itemCount: 7,
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
            itemCount: controller.eventList.length,
            itemBuilder: (context, int index) {
              GetEventsResult item = controller.eventList[index];
              return GestureDetector(
                onTap: () {
                  controller.openEventDetail(index);
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
                                      item.fromDate ?? '',
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
                                    '50 P',
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
