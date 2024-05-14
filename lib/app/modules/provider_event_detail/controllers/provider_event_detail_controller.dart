import 'package:get/get.dart';

class ProviderEventDetailController extends GetxController {
  Map<String, String?> parameters = Get.parameters;

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
}
