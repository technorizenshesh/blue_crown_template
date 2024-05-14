import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class ClubInfoController extends GetxController {
  final showEventsProgressBar = false.obs;
  List<String> clubPhotos = [
    'assets/un_used_images/party1.png',
    'assets/un_used_images/party2.png',
    'assets/un_used_images/party3.png',
    'assets/un_used_images/party4.png',
    'assets/un_used_images/party1.png',
    'assets/un_used_images/party2.png'
  ];
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

  clickOnListRequest() {
    Get.toNamed(Routes.LIST_REQUEST);
  }
}
