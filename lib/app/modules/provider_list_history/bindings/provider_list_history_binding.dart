import 'package:get/get.dart';

import '../controllers/provider_list_history_controller.dart';

class ProviderListHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProviderListHistoryController>(
      () => ProviderListHistoryController(),
    );
  }
}
