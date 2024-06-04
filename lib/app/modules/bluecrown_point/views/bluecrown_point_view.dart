import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/text_styles.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/bluecrown_point_controller.dart';

class BluecrownPointView extends GetView<BluecrownPointController> {
  const BluecrownPointView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CommonWidgets.appBar(
          title: StringConstants.crownPoints, wantBackButton: true),
      body: Obx(() {
        controller.count.value;
        return Padding(
          padding: EdgeInsets.all(20.px),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.px)),
                elevation: 10.px,
                clipBehavior: Clip.hardEdge,
                color: primaryColor,
                margin: EdgeInsets.only(top: 20.px, bottom: 30.px),
                child: Container(
                    height: 150.px,
                    padding: EdgeInsets.all(5.px),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.px)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          StringConstants.yourPoints,
                          style: MyTextStyle.titleStyle24bw,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CommonWidgets.appIcons(
                              assetName: IconConstants.icCrownWhite,
                              width: 75.px,
                              height: 40.px,
                              fit: BoxFit.fill,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10.px),
                              child: Text(
                                '${controller.walletAmount.value} P',
                                style: MyTextStyle.titleStyle30bw,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.px),
                ),
                color: cartColor,
                elevation: 5.px,
                clipBehavior: Clip.hardEdge,
                margin: EdgeInsets.only(top: 10.px, bottom: 10.px),
                child: GestureDetector(
                  onTap: () {
                    controller.clickOnUseButton();
                  },
                  child: Container(
                      padding: EdgeInsets.all(10.px),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.px)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CommonWidgets.appIcons(
                            assetName: IconConstants.icCrownWhite,
                            width: 35.px,
                            height: 20.px,
                            fit: BoxFit.fill,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5.px),
                            child: Text(
                              StringConstants.use,
                              style: MyTextStyle.titleStyle16bw,
                            ),
                          )
                        ],
                      )),
                ),
              ),
              /*  Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.px),
              ),
              color: cartColor,
              elevation: 5.px,
              clipBehavior: Clip.hardEdge,
              margin: EdgeInsets.only(top: 10.px, bottom: 10.px),
              child: Container(
                  padding: EdgeInsets.all(10.px),
                  alignment: Alignment.center,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20.px)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CommonWidgets.appIcons(
                        assetName: IconConstants.icCrownWhite,
                        width: 35.px,
                        height: 20.px,
                        fit: BoxFit.fill,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5.px),
                        child: Text(
                          StringConstants.getMore,
                          style: MyTextStyle.titleStyle16bw,
                        ),
                      )
                    ],
                  )),
            ),*/
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.px),
                ),
                color: cartColor,
                elevation: 5.px,
                clipBehavior: Clip.hardEdge,
                margin: EdgeInsets.only(top: 10.px, bottom: 10.px),
                child: GestureDetector(
                  onTap: () {
                    controller.clickOnHowDoIGetPoints();
                  },
                  child: Container(
                      padding: EdgeInsets.all(10.px),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.px)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CommonWidgets.appIcons(
                            assetName: IconConstants.icCrownWhite,
                            width: 35.px,
                            height: 20.px,
                            fit: BoxFit.fill,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5.px),
                            child: Text(
                              StringConstants.howDoIEarnPoints,
                              style: MyTextStyle.titleStyle16bw,
                            ),
                          )
                        ],
                      )),
                ),
              ),
              SizedBox(
                height: 10.px,
              ),
            ],
          ),
        );
      }),
    );
  }
}
