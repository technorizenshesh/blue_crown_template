import 'package:get/get.dart';

import '../controllers/scanner_second_controller.dart';

class ScannerSecondBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScannerSecondController>(
      () => ScannerSecondController(),
    );
  }
}
