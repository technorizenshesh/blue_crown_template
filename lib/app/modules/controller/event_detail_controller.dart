import 'package:blue_crown_template/app/routes/app_pages.dart';
import 'package:get/get.dart';

class EventDetailController extends GetxController {
  final showEventsProgressBar = false.obs;

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

  clickOnListRequest() {
    Get.toNamed(Routes.LIST_REQUEST);
  }

  clickOnTableRequest() {
    Get.toNamed(Routes.TABLE_REQUEST);
  }

  clickOnPayWithBlueCrownRequest() {
    Get.toNamed(Routes.USE_POINTS);
  }
}
