import 'package:blue_crown_template/app/data/constants/string_constants.dart';
import 'package:get/get.dart';

class NotificationSettingController extends GetxController {
  final showEventsProgressBar = false.obs;

  List<String> notificationsSettings = [
    StringConstants.generalNotification,
    StringConstants.sound,
    StringConstants.vibrate,
    StringConstants.appUpdates,
    StringConstants.newTipsAvailable
  ];
  List<bool> notificationsStatus = [true, false, false, true, false];
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  changeNotificationStatus(int index, bool value) {
    notificationsStatus[index] = value;
    increment();
  }
}
