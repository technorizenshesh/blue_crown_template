import 'package:blue_crown_template/app/data/constants/icons_constant.dart';
import 'package:blue_crown_template/app/modules/controller/club_events_controller.dart';
import 'package:blue_crown_template/common/colors.dart';
import 'package:blue_crown_template/common/common_widgets.dart';
import 'package:blue_crown_template/common/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../data/constants/string_constants.dart';

class ClubEventView extends StatefulWidget {
  const ClubEventView({Key? key}) : super(key: key);
  @override
  State<ClubEventView> createState() => _ClubEventViewState();
}

class _ClubEventViewState extends State<ClubEventView> {
  ClubEventsController controller = Get.put(ClubEventsController());
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
            itemCount: controller.eventsDetails.length,
            itemBuilder: (context, int index) {
              //  GetClubsResult item = controller.getClubsModel!.result![index];
              return GestureDetector(
                onTap: () {
                  controller.clickOnEvent(index);
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
                      // CachedNetworkImage(
                      //   imageUrl: item.image!,
                      //   fit: BoxFit.cover,
                      //   width: double.infinity,
                      //   height: 200.px,
                      //   placeholder: (BuildContext context, String url) =>
                      //       Image.asset(
                      //     ImageConstants.event1Img,
                      //     fit: BoxFit.fill,
                      //     height: 200.px,
                      //   ),
                      //   errorWidget:
                      //       (BuildContext context, String url, dynamic error) =>
                      //           Image.asset(
                      //     ImageConstants.event1Img,
                      //     fit: BoxFit.fill,
                      //     height: 200.px,
                      //   ),
                      // ),
                      Expanded(
                          flex: 4,
                          child: CommonWidgets.appIcons(
                            assetName: controller.eventsImages[index],
                            fit: BoxFit.fill,
                            height: 100.px,
                            width: 150.px,
                          )),
                      Expanded(
                          flex: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                controller.eventsDetails[index]['name'] ?? '',
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
                                      controller.eventsDetails[index]['date'] ??
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
                                      controller.eventsDetails[index]['time'] ??
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
                                    Icons.location_on_outlined,
                                    size: 20.px,
                                    color: primary3Color,
                                  ),
                                  Expanded(
                                    child: Text(
                                      controller.eventsDetails[index]
                                              ['location'] ??
                                          '',
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
