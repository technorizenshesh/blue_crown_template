import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/privacy_policy_controller.dart';

class PrivacyPolicyView extends GetView<PrivacyPolicyController> {
  const PrivacyPolicyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: CommonWidgets.appBar(
            title: StringConstants.privacyPolicy, wantBackButton: true),
        body: Obx(() {
          controller.count.value;
          return CommonWidgets.customProgressBar(
              inAsyncCall: controller.showProgressBar.value,
              child: WebViewWidget(controller: controller.webViewController));
        }));
  }
}
