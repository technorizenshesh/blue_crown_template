import 'package:blue_crown_template/common/common_widgets.dart';
import 'package:get/get.dart';

import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_how_get_points_model.dart';

class HowGetPointController extends GetxController {
  RxBool showProgressbar = true.obs;
  HowToEarnPointsModel? howToEarnPointsModel;
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getHowToEarnPoints();
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
  changeShowProgressBar(bool value) {
    showProgressbar.value = value;
  }

  getHowToEarnPoints() async {
    howToEarnPointsModel = await ApiMethods.howToEarnPointsApi();
    if (howToEarnPointsModel!.status != "0" ?? false) {
      print(" How to earn more points Successfully complete...");
      changeShowProgressBar(false);
    } else {
      print("How to earn more points Failed....");
      changeShowProgressBar(true);
      CommonWidgets.showMyToastMessage(howToEarnPointsModel!.message!);
    }
  }
}
