import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/text_styles.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: Container(
        height: 60.px,
        alignment: Alignment.bottomCenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              StringConstants.appCreateBy,
              style: MyTextStyle.titleStyle16bb,
            ),
            Text(
              StringConstants.blueCrownAccessAb,
              style: MyTextStyle.titleStyle16bb,
            ),
          ],
        ),
      ),
      body: Obx(() {
        controller.count.value;
        return Center(
            child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: CommonWidgets.appIcons(
              assetName: IconConstants.icLogo, width: 230.px, height: 120.px),
        ));
      }),
    );
  }
}
