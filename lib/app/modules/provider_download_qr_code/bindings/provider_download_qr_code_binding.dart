import 'package:get/get.dart';

import '../controllers/provider_download_qr_code_controller.dart';

class ProviderDownloadQrCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProviderDownloadQrCodeController>(
      () => ProviderDownloadQrCodeController(),
    );
  }
}
