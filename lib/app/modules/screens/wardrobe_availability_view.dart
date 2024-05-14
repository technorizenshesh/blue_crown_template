import 'package:blue_crown_template/app/data/constants/icons_constant.dart';
import 'package:blue_crown_template/app/modules/controller/wardrobe_availability_controller.dart';
import 'package:blue_crown_template/common/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../common/colors.dart';
import '../../../common/text_styles.dart';
import '../../data/constants/string_constants.dart';

class WardrobeAvailabilityView extends StatefulWidget {
  const WardrobeAvailabilityView({Key? key}) : super(key: key);
  @override
  State<WardrobeAvailabilityView> createState() {
    return WardrobeAvailabilityState();
  }
}

class WardrobeAvailabilityState extends State<WardrobeAvailabilityView> {
  WardrobeAvailabilityController controller =
      Get.put(WardrobeAvailabilityController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: CommonWidgets.appBar(
          title: StringConstants.wardrobe,
          wantBackButton: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: showJacketHistory(),
              ),
            )
          ],
        ));
  }

  /// Show Jacket History ...
  Widget showJacketHistory() {
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
            itemCount: controller.wardrobeList.length,
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
                    child: ListTile(
                      onTap: () {
                        controller.clickOnCard(index);
                      },
                      leading: CommonWidgets.appIcons(
                          assetName: IconConstants.icQrCode,
                          width: 35.px,
                          height: 35.px,
                          fit: BoxFit.fill),
                      title: Text(
                        controller.wardrobeList[index]['qr_code'] ?? '',
                        style: MyTextStyle.titleStyle16bw,
                        maxLines: 1,
                      ),
                      subtitle: Text(
                        controller.wardrobeList[index]['name'] ?? '',
                        style: MyTextStyle.titleStyle14w,
                        maxLines: 1,
                      ),
                      trailing: Text(
                        controller.wardrobeList[index]['status'] ?? '',
                        style:
                            controller.wardrobeList[index]['status'] == 'Active'
                                ? MyTextStyle.titleStyleCustom(
                                    14, FontWeight.normal, greenColor)
                                : MyTextStyle.titleStyleCustom(
                                    14, FontWeight.normal, errorColor),
                        maxLines: 1,
                      ),
                    ),
                  ),
                ),
              );
            },
          ));
  }
}
