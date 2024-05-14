import 'package:get/get.dart';

import '../controllers/event_wallet_history_controller.dart';

class EventWalletHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EventWalletHistoryController>(
      () => EventWalletHistoryController(),
    );
  }
}
