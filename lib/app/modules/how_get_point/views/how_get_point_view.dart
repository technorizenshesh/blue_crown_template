import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/text_styles.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/how_get_point_controller.dart';

class HowGetPointView extends GetView<HowGetPointController> {
  const HowGetPointView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CommonWidgets.appBar(
          wantBackButton: true, title: StringConstants.howDoIEarnPoints),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // SizedBox(
            //   height: 30.px,
            // ),
            // Text(
            //   StringConstants.howDoIEarnPoints,
            //   style: MyTextStyle.titleStyle20bw,
            //   textAlign: TextAlign.center,
            // ),
            SizedBox(
              height: 30.px,
            ),
            Padding(
              padding: EdgeInsets.all(15.0.px),
              child: Obx(() => controller.showProgressbar.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Text(
                      removeAllHtmlTags(controller
                          .howToEarnPointsModel!.result![0].description!),
                      style: MyTextStyle.titleStyle14w,
                      textAlign: TextAlign.justify,
                    )),
            ),
            SizedBox(
              height: 20.px,
            ),
          ],
        ),
      ),
    );
  }

  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    return htmlText.replaceAll(exp, '');
  }
}
