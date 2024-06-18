import 'package:blue_crown_template/app/data/apis/api_constants/api_key_constants.dart';
import 'package:blue_crown_template/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_event_model.dart';

class ProviderEventDetailController extends GetxController {
  Map<String, String?> parameters = Get.parameters;
  GetEventsResult getEventsResult = Get.arguments;

  final inAsyncCall = false.obs;

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
    Map<String, String> data = {
      ApiKeyConstants.clubId: getEventsResult.userId ?? '',
      ApiKeyConstants.eventId: getEventsResult.id ?? ''
    };
    Get.toNamed(Routes.PROVIDER_LIST_HISTORY, parameters: data);
  }

  clickOnPushNotification() {
    Get.toNamed(Routes.PROVIDER_PUSH_NOTIFICATION);
  }

  clickOnListChange() {
    Get.toNamed(Routes.PROVIDER_EDIT_EVENT, arguments: getEventsResult);
  }

  clickOnDownloadQrCode() {
    Map<String, String> data = {
      ApiKeyConstants.qrCode: getEventsResult.qrCode ?? ''
    };
    Get.toNamed(Routes.PROVIDER_DOWNLOAD_QR_CODE, parameters: data);
  }

  clickOnPurchasedUser() {
    Map<String, String> data = {
      ApiKeyConstants.eventId: getEventsResult.id ?? ''
    };
    Get.toNamed(Routes.PROVIDER_PURCHASED_USERS, parameters: data);
  }

  changeEventStatus() async {
    try {
      Map<String, String> bodyParamsForStatusChange = {
        ApiKeyConstants.userId: getEventsResult.userId ?? '',
        ApiKeyConstants.eventId: getEventsResult.id ?? '',
        ApiKeyConstants.status:
            getEventsResult.status == 'Active' ? 'Deactive' : 'Active'
      };
      print("bodyParamsForChangeStatus:::::$bodyParamsForStatusChange");
      inAsyncCall.value = true;
      GetEventsModel? getEventsModel = await ApiMethods.updateEventStatusApi(
          bodyParams: bodyParamsForStatusChange);
      if (getEventsModel!.status != "0" ?? false) {
        print("Successfully update  event  status ...");
        CommonWidgets.showMyToastMessage('Successfully update event status.');
        Get.back(result: true);
      } else {
        print("update  event  status Failed....");
        CommonWidgets.showMyToastMessage(getEventsModel.message!);
      }
    } catch (e) {
      print('Error:-' + e.toString());
      CommonWidgets.showMyToastMessage(
          'Server issue please try again after some time ');
    }
    inAsyncCall.value = false;
    increment();
  }
}
