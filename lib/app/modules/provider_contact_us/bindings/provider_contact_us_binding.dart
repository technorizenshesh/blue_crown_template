import 'package:get/get.dart';

import '../controllers/provider_contact_us_controller.dart';

class ProviderContactUsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProviderContactUsController>(
      () => ProviderContactUsController(),
    );
  }
}
