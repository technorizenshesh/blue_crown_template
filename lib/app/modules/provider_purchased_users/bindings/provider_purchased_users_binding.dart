import 'package:get/get.dart';

import '../controllers/provider_purchased_users_controller.dart';

class ProviderPurchasedUsersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProviderPurchasedUsersController>(
      () => ProviderPurchasedUsersController(),
    );
  }
}
