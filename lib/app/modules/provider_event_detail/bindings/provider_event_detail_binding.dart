import 'package:get/get.dart';

import '../controllers/provider_event_detail_controller.dart';

class ProviderEventDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProviderEventDetailController>(
      () => ProviderEventDetailController(),
    );
  }
}
