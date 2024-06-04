import 'package:get/get.dart';

import '../controllers/use_points_controller.dart';

class UsePointsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UsePointsController>(
      () => UsePointsController(),
    );
  }
}
