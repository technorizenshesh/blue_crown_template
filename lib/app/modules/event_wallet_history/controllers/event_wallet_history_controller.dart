import 'package:get/get.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_my_purchased_event_model.dart';
import '../../../data/apis/api_models/get_wallet_model.dart';

class EventWalletHistoryController extends GetxController {
  final isLoading = true.obs;
  Map<String, String?> parameters = Get.parameters;
  GetClubWalletModel? getClubWalletModel;
  RxString walletAmount = '0'.obs;
  List<GetMyPurchasingEventResult> walletEventList = [];

  final count = 0.obs;
  // final tabIndex = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    await getWalletAccordingClubIdUserId();
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

  /* changeTabIndex(index) {
    tabIndex.value = index;
    increment();
  }  */

  Future<void> getWalletAccordingClubIdUserId() async {
    try {
      Map<String, dynamic> queryParameters = {
        ApiKeyConstants.userId: parameters[ApiKeyConstants.userId] ?? ''
      };
      getClubWalletModel = await ApiMethods.getWalletAmountAccordingClubIdApi(
          queryParameters: queryParameters);
      if (getClubWalletModel!.status != "0" ?? false) {
        walletAmount.value = getClubWalletModel!.result!.wallet ?? '0';
        print("Get Club Wallet Amount Successfully complete...");
      } else {
        print("Get Club Wallet Amount Failed....");
        CommonWidgets.showMyToastMessage('Wallet amount not found');
      }
    } catch (e) {
      print("Error:-${e.toString()}");
      CommonWidgets.showMyToastMessage('Wallet amount not found');
    }
    increment();
  }

  getMyPurchasingEventList() async {
    try {
      Map<String, String> queryParameters = {
        ApiKeyConstants.userId: parameters[ApiKeyConstants.userId] ?? ''
      };
      GetMyPurchasingEventModel? getMyPurchasingEventModel =
          await ApiMethods.getMyPurchasingEventsApi(
              queryParameters: queryParameters);
      if (getMyPurchasingEventModel!.status != "0" ?? false) {
        walletEventList = getMyPurchasingEventModel.result!;
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
