import 'package:get/get.dart';

import '../controllers/provider_edit_event_controller.dart';

class ProviderEditEventBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProviderEditEventController>(
      () => ProviderEditEventController(),
    );
  }
}
