import 'package:get/get.dart';

import '../controllers/request_list_history_controller.dart';

class RequestListHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RequestListHistoryController>(
      () => RequestListHistoryController(),
    );
  }
}
