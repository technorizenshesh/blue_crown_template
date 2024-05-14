import 'package:blue_crown_template/app/modules/controller/home_controller.dart';
import 'package:blue_crown_template/app/modules/controller/scanner_controller.dart';
import 'package:blue_crown_template/app/modules/wardrobe/controllers/wardrobe_controller.dart';
import 'package:get/get.dart';

import '../controllers/nav_bar_controller.dart';

class NavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavBarController>(
      () => NavBarController(),
    );

    Get.lazyPut<WardrobeController>(
      () => WardrobeController(),
    );

    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<ScannerController>(
      () => ScannerController(),
    );
  }
}
