import 'package:get/get.dart';

import '../controllers/club_info_controller.dart';

class ClubInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClubInfoController>(
      () => ClubInfoController(),
    );
  }
}
