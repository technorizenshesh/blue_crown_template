import 'package:blue_crown_template/app/routes/app_pages.dart';
import 'package:get/get.dart';

class BlueCrownPointController extends GetxController {
  final count = 0.obs;
  @override
  Future<void> onInit() async {
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
  clickOnUseButton() {
    Get.toNamed(Routes.CLUB_EVENTS);
  }
}
