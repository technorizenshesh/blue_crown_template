import 'package:blue_crown_template/app/data/apis/api_constants/api_key_constants.dart';
import 'package:get/get.dart';

import '../../../data/apis/api_models/get_event_model.dart';
import '../../../routes/app_pages.dart';

class EventDetailController extends GetxController {
  final showEventsProgressBar = false.obs;
  GetEventsResult getEventsResult = Get.arguments;
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
    Map<String, String> data = {
      ApiKeyConstants.eventId: getEventsResult.id ?? ''
    };
    Get.toNamed(Routes.LIST_REQUEST, parameters: data);
  }

  clickOnTableRequest() {
    Map<String, String> data = {
      ApiKeyConstants.eventId: getEventsResult.id ?? ''
    };
    Get.toNamed(Routes.TABLE_REQUEST, parameters: data);
  }

  clickOnPayWithBlueCrownRequest() {
    Map<String, String> data = {
      ApiKeyConstants.eventId: getEventsResult.id ?? '',
    };
    Get.toNamed(Routes.USE_POINTS,
        parameters: data, arguments: getEventsResult);
  }
}
