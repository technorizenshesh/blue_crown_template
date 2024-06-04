import 'package:blue_crown_template/app/modules/scanner/controllers/scanner_controller.dart';
import 'package:get/get.dart';

import '../../home/controllers/home_controller.dart';
import '../../wardrobe/controllers/wardrobe_controller.dart';
import '../controllers/provider_nav_bar_controller.dart';

class ProviderNavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProviderNavBarController>(
      () => ProviderNavBarController(),
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
