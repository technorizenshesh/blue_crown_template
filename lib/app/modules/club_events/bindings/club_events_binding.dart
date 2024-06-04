import 'package:get/get.dart';

import '../controllers/club_events_controller.dart';

class ClubEventsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClubEventsController>(
      () => ClubEventsController(),
    );
  }
}
