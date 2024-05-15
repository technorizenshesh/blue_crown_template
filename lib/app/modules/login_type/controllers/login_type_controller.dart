import 'package:blue_crown_template/app/data/apis/api_constants/api_key_constants.dart';
import 'package:blue_crown_template/app/data/constants/string_constants.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class LoginTypeController extends GetxController {
//TODO: Implement SelectLoginTypeController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    print("ARBIOIJJ......");
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void openNewPage(int index) {
    switch (index) {
      case 0:
        Map<String, String> data = {
          ApiKeyConstants.type: StringConstants.provider
        };
        Get.toNamed(Routes.LOGIN, parameters: data);
        break;
      case 1:
        Map<String, String> data = {ApiKeyConstants.type: StringConstants.user};
        Get.toNamed(Routes.LOGIN, parameters: data);
        break;
      case 2:
        Get.toNamed(Routes.SIGNUP);
        break;
      default:
        Map<String, String> data = {ApiKeyConstants.type: StringConstants.user};
        Get.toNamed(Routes.LOGIN, parameters: data);
        break;
    }
  }
}
