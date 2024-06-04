import 'package:get/get.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_my_purchased_event_model.dart';

class ProviderPurchasedUsersController extends GetxController {
  final isLoading = true.obs;
  Map<String, String?> parameters = Get.parameters;

  List<GetMyPurchasingEventResult> userList = [];

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
        ApiKeyConstants.eventId: parameters[ApiKeyConstants.eventId] ?? ''
      };
      GetMyPurchasingEventModel? getMyPurchasingEventModel =
          await ApiMethods.getPurchasedUserListApi(
              queryParameters: queryParameters);
      if (getMyPurchasingEventModel!.status != "0" ?? false) {
        userList = getMyPurchasingEventModel.result!;
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
