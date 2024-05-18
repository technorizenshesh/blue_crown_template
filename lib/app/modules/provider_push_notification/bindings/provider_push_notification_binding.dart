import 'package:get/get.dart';

import '../controllers/provider_push_notification_controller.dart';

class ProviderPushNotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProviderPushNotificationController>(
      () => ProviderPushNotificationController(),
    );
  }
}
