import 'package:get/get.dart';

import '../controllers/bluecrown_point_controller.dart';

class BluecrownPointBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BluecrownPointController>(
      () => BluecrownPointController(),
    );
  }
}
