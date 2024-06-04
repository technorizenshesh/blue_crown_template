import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/text_styles.dart';
import '../../../data/apis/api_models/get_club_hanger.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/provider_wardrobe_controller.dart';

class ProviderWardrobeView extends GetView<ProviderWardrobeController> {
  const ProviderWardrobeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: CommonWidgets.appBar(
          title: StringConstants.wardrobe,
          wantBackButton: true,
        ),
        bottomNavigationBar: CommonWidgets.commonElevatedButton(
            onPressed: () {
              controller.clickOnCreateQrNumber();
            },
            child: Text(
              StringConstants.createQrCode,
              style: MyTextStyle.titleStyle16bw,
            ),
            borderRadius: 30.px,
            buttonColor: primaryColor,
            buttonMargin:
                EdgeInsets.only(left: 20.px, right: 20.px, bottom: 10.px)),
        body: Column(
          children: [
            ListTile(
              title: Text(
                StringConstants.hanger,
                style: MyTextStyle.titleStyle16bw,
              ),
              trailing: CommonWidgets.appIcons(
                  assetName: IconConstants.icHanger,
                  width: 50.px,
                  height: 50.px,
                  fit: BoxFit.fill),
            ),
            SizedBox(
              height: 10.px,
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: showAllHangers(),
              ),
            )
          ],
        ));
  }

  /// Show All Hangers ...
  Widget showAllHangers() {
    return Obx(() => controller.showProgressBar.value
        ? CommonWidgets.commonShimmer(
            itemCount: 6,
            shimmerWidget: Container(
              height: 70.px,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.px)),
                  border: Border.all(color: Colors.black87, width: 1.5.px)),
              margin: EdgeInsets.only(
                  left: 20.px, right: 20.px, top: 5.px, bottom: 5.px),
              clipBehavior: Clip.hardEdge,
              child: ListTile(
                leading: Container(
                  height: 50.px,
                  width: 50.px,
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.all(Radius.circular(10.px)),
                  ),
                ),
                title: Container(
                  height: 15.px,
                  width: 50.px,
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.all(Radius.circular(3.px)),
                  ),
                ),
                subtitle: Container(
                  height: 15.px,
                  width: 120.px,
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.all(Radius.circular(3.px)),
                  ),
                ),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 15.px,
                      width: 50.px,
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.all(Radius.circular(3.px)),
                      ),
                    ),
                    Container(
                      height: 25.px,
                      width: 80.px,
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius: BorderRadius.all(Radius.circular(3.px)),
                      ),
                    ),
                  ],
                ),
              ),
            ))
        : controller.wardrobeList.isNotEmpty
            ? ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: controller.wardrobeList.length,
                itemBuilder: (context, int index) {
                  GetClubHangerResult item = controller.wardrobeList[index];
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
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.px)),
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: ListTile(
                          onTap: () {
                            controller.clickOnDownload(index);
                          },
                          leading: CommonWidgets.appIcons(
                              assetName: IconConstants.icQrCode,
                              width: 35.px,
                              height: 35.px,
                              fit: BoxFit.fill),
                          title: Text(
                            item.qrcode ?? '',
                            style: MyTextStyle.titleStyle16bw,
                            maxLines: 1,
                          ),
                          subtitle: Text(
                            item.dateTime ?? '',
                            style: MyTextStyle.titleStyle14w,
                            maxLines: 1,
                          ),
                          trailing: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                item.status ?? '',
                                style: item.status == 'Active'
                                    ? MyTextStyle.titleStyleCustom(
                                        14, FontWeight.normal, greenColor)
                                    : MyTextStyle.titleStyleCustom(
                                        14, FontWeight.normal, errorColor),
                                maxLines: 1,
                              ),
                              SizedBox(height: 3.px),
                              GestureDetector(
                                onTap: () {
                                  controller.clickOnDownload(index);
                                },
                                child: Container(
                                  height: 26.px,
                                  width: 75.px,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(2.px),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(12.px),
                                      color: greenColor),
                                  child: Text(
                                    StringConstants.download,
                                    style: MyTextStyle.titleStyle12w,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
            : CommonWidgets.dataNotFound());
  }
}
