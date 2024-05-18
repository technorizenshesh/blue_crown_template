import 'package:get/get.dart';

import '../controllers/provider_all_event_controller.dart';

class ProviderAllEventBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProviderAllEventController>(
      () => ProviderAllEventController(),
    );
  }
}
