import 'package:get/get.dart';

import '../controllers/table_request_controller.dart';

class TableRequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TableRequestController>(
      () => TableRequestController(),
    );
  }
}
