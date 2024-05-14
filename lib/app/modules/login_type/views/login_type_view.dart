import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/text_styles.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/login_type_controller.dart';

class LoginTypeView extends GetView<LoginTypeController> {
  const LoginTypeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          CommonWidgets.appIcons(
            assetName: ImageConstants.imageSplash,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          CommonWidgets.appIcons(
            assetName: ImageConstants.imageBlack,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonWidgets.commonElevatedButton(
                    onPressed: () {
                      controller.openNewPage(0);
                    },
                    child: Text(
                      StringConstants.logInAsClubHost,
                      style: MyTextStyle.titleStyle16bb,
                    ),
                    borderRadius: 30.px),
                SizedBox(
                  height: 15.px,
                ),
                CommonWidgets.commonElevatedButton(
                    onPressed: () {
                      controller.openNewPage(1);
                    },
                    child: Text(
                      StringConstants.loginAsAConsumer,
                      style: MyTextStyle.titleStyle16bb,
                    ),
                    borderRadius: 30.px),
                SizedBox(
                  height: 15.px,
                ),
                CommonWidgets.commonElevatedButton(
                    onPressed: () {
                      controller.openNewPage(2);
                    },
                    child: Text(
                      StringConstants.createAccount,
                      style: MyTextStyle.titleStyle16bb,
                    ),
                    borderRadius: 30.px),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
