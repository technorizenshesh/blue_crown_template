import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/colors.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/text_styles.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/provider_consumer_register_controller.dart';

class ProviderConsumerRegisterView
    extends GetView<ProviderConsumerRegisterController> {
  const ProviderConsumerRegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProviderConsumerRegisterView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          CommonWidgets.commonTextFieldForLoginSignUP(
            focusNode: controller.focusSearch,
            controller: controller.searchController,
            isCard: controller.isSearch.value,
            hintText: StringConstants.search,
            hintStyle: MyTextStyle.titleStyle14w,
            style: MyTextStyle.titleStyle14w,
            keyboardType: TextInputType.visiblePassword,
            prefixIcon: Icon(
              Icons.search,
              color: primary3Color,
              size: 20.px,
            ),
          ),
        ],
      ),
    );
  }
}
