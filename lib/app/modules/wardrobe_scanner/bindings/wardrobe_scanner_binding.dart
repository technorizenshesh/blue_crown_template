import 'package:get/get.dart';

import '../controllers/wardrobe_scanner_controller.dart';

class WardrobeScannerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WardrobeScannerController>(
      () => WardrobeScannerController(),
    );
  }
}
