import 'package:blue_crown_template/app/modules/controller/logout_controller.dart';
import 'package:blue_crown_template/common/common_widgets.dart';
import 'package:blue_crown_template/common/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../common/colors.dart';
import '../../data/constants/string_constants.dart';

class LogoutView extends StatefulWidget {
  const LogoutView({Key? key}) : super(key: key);
  @override
  State<LogoutView> createState() => _LogoutViewState();
}

class _LogoutViewState extends State<LogoutView> {
  LogoutController controller = Get.put(LogoutController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        appBar: CommonWidgets.appBar(
            wantBackButton: true, title: StringConstants.logout),
        body: Obx(() {
          controller.count.value;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30.px,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.px))),
                  elevation: 5.px,
                  color: cartColor,
                  margin: EdgeInsets.all(1.px),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20.px,
                        ),
                        Text(
                          StringConstants.areYouSure,
                          style: MyTextStyle.titleStyle20bw,
                        ),
                        SizedBox(
                          height: 10.px,
                        ),
                        Text(StringConstants.doYouWantToLogoutFromThisApp,
                            style: MyTextStyle.titleStyle14w),
                        SizedBox(
                          height: 20.px,
                        ),
                        Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: CommonWidgets.commonElevatedButton(
                                    onPressed: () {},
                                    child: Text(
                                      StringConstants.yes,
                                      style: MyTextStyle.titleStyle16bw,
                                    ),
                                    borderRadius: 30.px,
                                    buttonColor: primaryColor,
                                    buttonMargin: EdgeInsets.only(
                                        top: 20.px,
                                        left: 20.px,
                                        right: 10.px,
                                        bottom: 10.px))),
                            Expanded(
                                flex: 1,
                                child: CommonWidgets.commonElevatedButton(
                                    onPressed: () {},
                                    child: Text(
                                      StringConstants.no,
                                      style: MyTextStyle.titleStyle16bw,
                                    ),
                                    borderRadius: 30.px,
                                    buttonColor: cartColor,
                                    buttonMargin: EdgeInsets.only(
                                        top: 20.px,
                                        left: 20.px,
                                        right: 10.px,
                                        bottom: 10.px)))
                          ],
                        ),
                        SizedBox(
                          height: 20.px,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.px,
                ),
              ],
            ),
          );
        }));
  }
}
