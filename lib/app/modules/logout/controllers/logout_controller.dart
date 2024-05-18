import 'package:blue_crown_template/app/routes/app_pages.dart';
import 'package:get/get.dart';

class LogoutController extends GetxController {
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
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

  clickOnYesButton() {
    Get.offAllNamed(Routes.LOGIN_TYPE);
  }
}
