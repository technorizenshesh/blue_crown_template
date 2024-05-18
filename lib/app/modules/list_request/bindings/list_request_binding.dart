import 'package:get/get.dart';

import '../controllers/list_request_controller.dart';

class ListRequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListRequestController>(
      () => ListRequestController(),
    );
  }
}
