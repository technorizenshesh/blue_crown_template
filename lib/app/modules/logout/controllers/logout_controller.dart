import 'package:blue_crown_template/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoutController extends GetxController {
  final count = 0.obs;
  late SharedPreferences sharedPreferences;
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

  clickOnYesButton() async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
    Get.offAllNamed(Routes.LOGIN_TYPE);
  }
}
