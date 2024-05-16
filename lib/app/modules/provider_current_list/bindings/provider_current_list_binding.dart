import 'package:get/get.dart';

import '../controllers/provider_current_list_controller.dart';

class ProviderCurrentListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProviderCurrentListController>(
      () => ProviderCurrentListController(),
    );
  }
}
