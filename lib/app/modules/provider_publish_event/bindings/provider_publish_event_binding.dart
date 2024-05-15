import 'package:get/get.dart';

import '../controllers/provider_publish_event_controller.dart';

class ProviderPublishEventBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProviderPublishEventController>(
      () => ProviderPublishEventController(),
    );
  }
}
