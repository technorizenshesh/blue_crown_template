import 'package:blue_crown_template/app/routes/app_pages.dart';
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

  clickOnListRequest() {
    Get.toNamed(Routes.PROVIDER_LIST_HISTORY);
  }

  clickOnPushNotification() {
    Get.toNamed(Routes.PROVIDER_PUSH_NOTIFICATION);
  }

  clickOnListChange() {
    Map<String, String> data = {
      "event": parameters['event'] ?? '',
      "date": parameters['date'] ?? '',
      "time": parameters['time'] ?? '',
      "amount": parameters['amount'] ?? ''
    };
    Get.toNamed(Routes.PROVIDER_EDIT_EVENT, parameters: data);
  }
}
