import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/text_styles.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/club_info_controller.dart';

class ClubInfoView extends GetView<ClubInfoController> {
  const ClubInfoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: CommonWidgets.appBar(
            title: StringConstants.clubInfo, wantBackButton: true),
        body: Container(
          padding: EdgeInsets.all(20.px),
          decoration: const BoxDecoration(color: backgroundColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.px,
              ),
              Text(
                StringConstants.bio,
                style: MyTextStyle.titleStyle18bw,
              ),
              Text(
                StringConstants.test,
                style: MyTextStyle.titleStyle14w,
              ),
              Text(
                StringConstants.readMore,
                style: MyTextStyle.titleStyleCustom(
                    16, FontWeight.bold, primaryColor),
              ),
              SizedBox(
                height: 10.px,
              ),
              Container(
                  height: 100.px,
                  alignment: Alignment.center,
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: showClubPhotos())),
              SizedBox(
                height: 10.px,
              ),
              Text(
                StringConstants.clubLocation,
                style: MyTextStyle.titleStyle18bw,
              ),
              CommonWidgets.appIcons(
                  assetName: ImageConstants.imageGoogleMap,
                  height: 150.px,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill),
            ],
          ),
        ));
  }

  /// Show C Photos ...
  Widget showClubPhotos() {
    return Obx(() => controller.showEventsProgressBar.value
        ? CommonWidgets.commonShimmer(
            itemCount: 4,
            shimmerWidget: Container(
              height: 100.px,
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
            scrollDirection: Axis.horizontal,
            itemCount: controller.clubPhotos.length,
            itemBuilder: (context, int index) {
              //  GetClubsResult item = controller.getClubsModel!.result![index];
              return Container(
                height: 100.px,
                width: 100.px,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(10.px)),
                ),
                margin: EdgeInsets.only(
                    left: 5.px, right: 5.px, top: 5.px, bottom: 5.px),
                clipBehavior: Clip.hardEdge,
                child: CommonWidgets.appIcons(
                    assetName: controller.clubPhotos[index],
                    height: 90.px,
                    width: 90.px,
                    fit: BoxFit.fill),
              );
            },
          ));
  }
}
