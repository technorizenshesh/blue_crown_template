import 'package:get/get.dart';

import '../controllers/how_get_point_controller.dart';

class HowGetPointBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HowGetPointController>(
      () => HowGetPointController(),
    );
  }
}
