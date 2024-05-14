import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  final count = 0.obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    await manageSession();
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

  manageSession() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offAllNamed(Routes.LOGIN_TYPE);
  }
}
