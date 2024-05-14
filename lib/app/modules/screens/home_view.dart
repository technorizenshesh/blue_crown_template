import 'package:blue_crown_template/app/data/constants/icons_constant.dart';
import 'package:blue_crown_template/app/modules/controller/home_controller.dart';
import 'package:blue_crown_template/common/colors.dart';
import 'package:blue_crown_template/common/common_widgets.dart';
import 'package:blue_crown_template/common/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.black, Colors.black87],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: Column(
        children: [
          Stack(
            fit: StackFit.loose,
            alignment: Alignment.center,
            children: [
              CommonWidgets.appIcons(
                assetName: 'assets/un_used_images/image1.png',
                height: 300.px,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
              Positioned(
                top: 230.px,
                child: Column(
                  children: [
                    Text(
                      'Makeriet Club',
                      style: MyTextStyle.titleStyle30bw,
                    ),
                    Text(
                      'Johan Smiths',
                      style: MyTextStyle.titleStyle14w,
                    ),
                  ],
                ),
              ),
              Positioned(
                  top: 50.px,
                  right: 20.px,
                  child: GestureDetector(
                    onTap: () {
                      controller.clickOnCrownIcon();
                    },
                    child: CommonWidgets.appIcons(
                      assetName: IconConstants.icCrownWhite,
                      height: 30.px,
                      width: 30.px,
                      fit: BoxFit.fill,
                    ),
                  )),
            ],
          ),
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
