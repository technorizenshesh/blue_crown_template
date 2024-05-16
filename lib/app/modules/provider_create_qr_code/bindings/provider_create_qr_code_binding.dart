import 'package:get/get.dart';

import '../controllers/provider_create_qr_code_controller.dart';

class ProviderCreateQrCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProviderCreateQrCodeController>(
      () => ProviderCreateQrCodeController(),
    );
  }
}
