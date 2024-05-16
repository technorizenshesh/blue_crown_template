import 'package:get/get.dart';

import '../controllers/provider_wardrobe_controller.dart';

class ProviderWardrobeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProviderWardrobeController>(
      () => ProviderWardrobeController(),
    );
  }
}
