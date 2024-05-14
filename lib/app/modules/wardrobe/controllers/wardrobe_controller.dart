import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class WardrobeController extends GetxController {
  final count = 0.obs;
  RxBool showProgressbar = false.obs;
  RxBool presentData = true.obs;
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

  clickOnHistoryCard() {
    Get.toNamed(Routes.HISTORY);
  }

  clickOnHandInJacket() {
    Get.toNamed(Routes.WARDROBE_SCANNER);
  }
}
