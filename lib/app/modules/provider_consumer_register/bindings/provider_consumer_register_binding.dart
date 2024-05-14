import 'package:get/get.dart';

import '../controllers/provider_consumer_register_controller.dart';

class ProviderConsumerRegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProviderConsumerRegisterController>(
      () => ProviderConsumerRegisterController(),
    );
  }
}
