import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/text_styles.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/wardrobe_controller.dart';

class WardrobeView extends GetView<WardrobeController> {
  const WardrobeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87,
        appBar: CommonWidgets.appBar(
            title: StringConstants.wardrobe, wantBackButton: false),
        body: Obx(() {
          controller.count.value;
          return Padding(
            padding: EdgeInsets.all(20.0.px),
            child: Column(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.px)),
                  elevation: 10.px,
                  clipBehavior: Clip.hardEdge,
                  color: cartColor,
                  margin: EdgeInsets.only(top: 10.px, bottom: 10.px),
                  child: GestureDetector(
                    onTap: () {
                      controller.clickOnHandInJacket();
                    },
                    child: Container(
                        padding: EdgeInsets.all(5.px),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.px)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 84.px,
                              width: 84.px,
                              padding: EdgeInsets.all(10.px),
                              child: CommonWidgets.appIcons(
                                assetName: IconConstants.icWardrobeBlue,
                                width: 60.px,
                                height: 60.px,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.px),
                              child: Text(
                                StringConstants.handInJacket,
                                style: MyTextStyle.titleStyle16bw,
                              ),
                            )
                          ],
                        )),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.px)),
                  elevation: 10.px,
                  clipBehavior: Clip.hardEdge,
                  color: cartColor,
                  margin: EdgeInsets.only(top: 10.px, bottom: 10.px),
                  child: GestureDetector(
                    onTap: () {
                      openCurrentJacketNumber(context);
                    },
                    child: Container(
                        padding: EdgeInsets.all(5.px),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.px)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 84.px,
                              width: 84.px,
                              padding: EdgeInsets.all(10.px),
                              child: CommonWidgets.appIcons(
                                assetName: IconConstants.icWardrobeBlue,
                                width: 60.px,
                                height: 60.px,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.px),
                              child: Text(
                                StringConstants.currentJacket,
                                style: MyTextStyle.titleStyle16bw,
                              ),
                            )
                          ],
                        )),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.px)),
                  elevation: 10.px,
                  clipBehavior: Clip.hardEdge,
                  color: cartColor,
                  margin: EdgeInsets.only(top: 10.px, bottom: 10.px),
                  child: GestureDetector(
                    onTap: () {
                      controller.clickOnHistoryCard();
                    },
                    child: Container(
                        padding: EdgeInsets.all(5.px),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.px)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 84.px,
                              width: 84.px,
                              padding: EdgeInsets.all(10.px),
                              child: CommonWidgets.appIcons(
                                assetName: IconConstants.icHistory,
                                width: 60.px,
                                height: 60.px,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.px),
                              child: Text(
                                StringConstants.history,
                                style: MyTextStyle.titleStyle16bw,
                              ),
                            )
                          ],
                        )),
                  ),
                ),
              ],
            ),
          );
        }));
  }

  /// Show Current Jacket Box...
  void openCurrentJacketNumber(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 20.px),
        contentPadding: EdgeInsets.zero,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.px))),
        content: SizedBox(
          height: 300.px,
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.px))),
            elevation: 5.px,
            color: cartColor,
            margin: EdgeInsets.all(1.px),
            child: Center(
              child: Obx(
                () => controller.presentData.value
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 20.px,
                          ),
                          Text(
                            StringConstants.youHaveNumber,
                            style: MyTextStyle.titleStyle20bw,
                          ),
                          SizedBox(
                            height: 20.px,
                          ),
                          Text(
                              controller
                                  .currentJacketList[
                                      controller.currentJacketList.length - 1]
                                  .qrcode!,
                              style: MyTextStyle.titleStyleCustom(
                                  80, FontWeight.bold, primaryColor)),
                          CommonWidgets.commonElevatedButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: Text(
                                StringConstants.done,
                                style: MyTextStyle.titleStyle16bw,
                              ),
                              borderRadius: 10.px,
                              height: 50.px,
                              buttonColor: primaryColor,
                              buttonMargin: EdgeInsets.only(
                                  top: 20.px,
                                  left: 20.px,
                                  right: 20.px,
                                  bottom: 20.px))
                        ],
                      )
                    : Text(
                        '\n\n\nThere are not present your current jacket',
                        style: MyTextStyle.titleStyle20bb,
                        textAlign: TextAlign.center,
                      ),
              ),
            ),
          ),
        ),
        alignment: Alignment.center,
      ),
    );
  }
}
