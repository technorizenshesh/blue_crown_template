import 'package:get/get.dart';

import '../controllers/provider_add_list_controller.dart';

class ProviderAddListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProviderAddListController>(
      () => ProviderAddListController(),
    );
  }
}
