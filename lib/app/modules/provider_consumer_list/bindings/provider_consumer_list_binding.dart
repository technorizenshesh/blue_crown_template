import 'package:get/get.dart';

import '../controllers/provider_consumer_list_controller.dart';

class ProviderConsumerListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProviderConsumerListController>(
      () => ProviderConsumerListController(),
    );
  }
}
