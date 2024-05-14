import 'package:blue_crown_template/app/routes/app_pages.dart';
import 'package:blue_crown_template/common/common_widgets.dart';
import 'package:get/get.dart';

class WardrobeAvailabilityController extends GetxController {
  final showProgressBar = false.obs;

  List<Map<String, String>> wardrobeList = [
    {"qr_code": "01", "name": "Johan Smiths", "status": "Active"},
    {"qr_code": "02", "name": "Thomas Dow", "status": "Active"},
    {"qr_code": "03", "name": "Johan Smiths", "status": "Active"},
    {"qr_code": "04", "name": "Thomas Dow", "status": "Active"},
    {"qr_code": "05", "name": " ", "status": "Inactive"},
    {"qr_code": "06", "name": " ", "status": "Inactive"},
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

  clickOnCard(int index) {
    if (wardrobeList[index]['status'] == 'Active') {
      CommonWidgets.showMyToastMessage(
          'This wardrobe is currently active please check another wardrobe.');
    } else {
      Get.toNamed(Routes.WARDROBE_SCANNER);
    }
  }
}
