import 'package:blue_crown_template/app/data/apis/api_constants/api_key_constants.dart';
import 'package:blue_crown_template/common/common_widgets.dart';
import 'package:get/get.dart';

import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_my_purchased_event_model.dart';

class HistoryController extends GetxController {
  final isLoading = true.obs;
  Map<String, String?> parameters = Get.parameters;

  List<GetMyPurchasingEventResult> eventList = [];

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getMyPurchasingEventList();
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

  getMyPurchasingEventList() async {
    try {
      Map<String, String> queryParameters = {
        ApiKeyConstants.userId: parameters[ApiKeyConstants.userId] ?? ''
      };
      GetMyPurchasingEventModel? getMyPurchasingEventModel =
          await ApiMethods.getMyPurchasingEventsApi(
              queryParameters: queryParameters);
      if (getMyPurchasingEventModel!.status != "0" ?? false) {
        eventList = getMyPurchasingEventModel.result!;
        print(" Get Booking Event Successfully complete...");
      } else {
        print("Get Booking Event Failed....");
        CommonWidgets.showMyToastMessage(getMyPurchasingEventModel.message!);
      }
    } catch (e) {
      print("Error:-${e.toString()}");
    }
    isLoading.value = false;
  }
}
