import 'package:blue_crown_template/app/data/constants/string_constants.dart';
import 'package:blue_crown_template/app/modules/controller/terms_condition_controller.dart';
import 'package:blue_crown_template/common/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../common/colors.dart';

class TermsConditionView extends StatefulWidget {
  const TermsConditionView({Key? key}) : super(key: key);
  @override
  State<TermsConditionView> createState() => TermsConditionState();
}

class TermsConditionState extends State<TermsConditionView> {
  TermsConditionController controller = Get.put(TermsConditionController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: CommonWidgets.appBar(
            title: StringConstants.termsAndCondition, wantBackButton: true),
        body: Obx(() {
          controller.count.value;
          return CommonWidgets.customProgressBar(
              inAsyncCall: controller.showProgressBar.value,
              child: WebViewWidget(controller: controller.webViewController));
        }));
  }
}
