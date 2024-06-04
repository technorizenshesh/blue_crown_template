import 'package:blue_crown_template/common/custom_provider_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/text_styles.dart';
import '../../../data/apis/api_models/get_event_model.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/provider_nav_bar_controller.dart';

class ProviderNavBarView extends GetView<ProviderNavBarController> {
  const ProviderNavBarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.count.value;
    return Obx(() {
      return Scaffold(
        backgroundColor: backgroundColor,
        endDrawer: controller.isLoading.value
            ? null
            : CustomProviderDrawer.drawer(controller.userData),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        floatingActionButton: Builder(builder: (context) {
          return GestureDetector(
            onTap: () {
              print("hiii....");
              Scaffold.of(context).openEndDrawer();
            },
            child: CommonWidgets.appIcons(
              assetName: IconConstants.icMenu,
              height: 25.px,
              width: 25.px,
              fit: BoxFit.fill,
            ),
          );
        }),
        bottomNavigationBar: Container(
          height: 85.px,
          alignment: Alignment.bottomCenter,
          decoration: const BoxDecoration(color: Colors.black87),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 15.px),
                child: CommonWidgets.appIcons(
                    assetName: ImageConstants.imageBottomBar,
                    fit: BoxFit.fill,
                    height: 70.px,
                    width: double
                        .infinity //MediaQuery.of(context).size.width + 40.px,
                    ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 18.px),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.changeIndex(0);
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10.px,
                          ),
                          CommonWidgets.appIcons(
                            assetName: controller.tabIndex.value == 0
                                ? IconConstants.icWardrobeBlue
                                : IconConstants.icWardrobe,
                            fit: BoxFit.cover,
                            height: 25.px,
                            width: 25.px,
                          ),
                          Text(
                            StringConstants.wardrobe,
                            style: controller.tabIndex.value == 0
                                ? MyTextStyle.titleStyleCustom(
                                    14, FontWeight.normal, primaryColor)
                                : MyTextStyle.titleStyle14w,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 50.px,
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.changeIndex(2);
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10.px,
                          ),
                          CommonWidgets.appIcons(
                            assetName: controller.tabIndex.value == 2
                                ? IconConstants.icProfileColor
                                : IconConstants.icProfile,
                            fit: BoxFit.cover,
                            height: 25.px,
                            width: 25.px,
                          ),
                          Text(
                            StringConstants.consumerRegister,
                            style: controller.tabIndex.value == 2
                                ? MyTextStyle.titleStyleCustom(
                                    14, FontWeight.normal, primaryColor)
                                : MyTextStyle.titleStyle14w,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  controller.changeIndex(1);
                },
                child: Padding(
                  padding: EdgeInsets.only(bottom: 15.px),
                  child: CommonWidgets.appIcons(
                    assetName: IconConstants.icAdd,
                    fit: BoxFit.fill,
                    height: 70.px,
                    width: 70.px,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Column(
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
                        controller.clubName.value,
                        style: MyTextStyle.titleStyle30bw,
                      ),
                      Text(
                        controller.clubAdminName.value,
                        style: MyTextStyle.titleStyle14w,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 5.px),
                      child: Text(
                        StringConstants.activeEvent,
                        style: MyTextStyle.titleStyle18bw,
                      ),
                    ),
                    showClubEvents(),
                    Padding(
                      padding: EdgeInsets.only(left: 5.px, top: 5.px),
                      child: Text(
                        StringConstants.inactiveEvent,
                        style: MyTextStyle.titleStyle18bw,
                      ),
                    ),
                    showInactiveEvents(),
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
                                    style: MyTextStyle.titleStyle10bb,
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
                                    style: MyTextStyle.titleStyle10bb,
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
