import 'package:blue_crown_template/app/data/apis/api_models/get_club_request_model.dart';
import 'package:blue_crown_template/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/add_request_model.dart';

class ProviderListHistoryController extends GetxController {
  final showListProgressBar = true.obs;
  final showTableProgressBar = true.obs;
  Map<String, String?> parameters = Get.parameters;

  ClubRequestResult? tableRequestResult;
  ClubRequestResult? listRequestResult;

  final count = 0.obs;
  final tabIndex = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getListRequestList();
    getTableRequestList();
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

  changeTabIndex(index) {
    tabIndex.value = index;
    increment();
  }

  clickOnCurrentButton() {
    Map<String, String> data = {
      ApiKeyConstants.clubId: parameters[ApiKeyConstants.clubId] ?? '',
      ApiKeyConstants.eventId: parameters[ApiKeyConstants.eventId] ?? '',
    };
    Get.toNamed(Routes.PROVIDER_CURRENT_LIST, parameters: data);
  }

  clickOnAddToListButton() {
    Get.toNamed(Routes.PROVIDER_ADD_LIST);
  }

  Future<void> getTableRequestList() async {
    try {
      Map<String, String> bodyParamsForTableRequests = {
        ApiKeyConstants.clubId: parameters[ApiKeyConstants.clubId] ?? '',
        ApiKeyConstants.eventId: parameters[ApiKeyConstants.eventId] ?? '',
        ApiKeyConstants.type: 'TableBooking',
        ApiKeyConstants.status: 'Pending'
      };
      print("bodyParamsForTableRequests:::::$bodyParamsForTableRequests");
      showTableProgressBar.value = true;

      ClubRequestModel? clubRequestModel =
          await ApiMethods.getClubRequestListApi(
              bodyParams: bodyParamsForTableRequests);
      if (clubRequestModel!.status != "0" ?? false) {
        tableRequestResult = clubRequestModel.result!;
        print("Successfully get  request  list ...");
      } else {
        print("Add request Failed....");
        CommonWidgets.showMyToastMessage(clubRequestModel.message!);
      }
    } catch (e) {
      print('Error:-' + e.toString());
      CommonWidgets.showMyToastMessage(
          'Server issue please try again after some time ');
    }
    showTableProgressBar.value = false;
    increment();
  }

  Future<void> getListRequestList() async {
    try {
      Map<String, String> bodyParamsForListRequests = {
        ApiKeyConstants.clubId: parameters[ApiKeyConstants.clubId] ?? '',
        ApiKeyConstants.eventId: parameters[ApiKeyConstants.eventId] ?? '',
        ApiKeyConstants.type: 'ListRequest',
        ApiKeyConstants.status: 'Pending'
      };
      print("bodyParamsForListRequests:::::$bodyParamsForListRequests");
      showListProgressBar.value = true;

      ClubRequestModel? clubRequestModel =
          await ApiMethods.getClubRequestListApi(
              bodyParams: bodyParamsForListRequests);
      if (clubRequestModel!.status != "0" ?? false) {
        print("Successfully get  request  list ...");
        listRequestResult = clubRequestModel.result!;
      } else {
        print("Add request Failed....");
        CommonWidgets.showMyToastMessage(clubRequestModel.message!);
      }
    } catch (e) {
      print('Error:-' + e.toString());
      CommonWidgets.showMyToastMessage(
          'Server issue please try again after some time ');
    }
    showListProgressBar.value = false;
    increment();
  }

  acceptRejectRequest(String status, String requestId) async {
    try {
      Map<String, String> bodyParamsForStatusRequests = {
        ApiKeyConstants.clubId: parameters[ApiKeyConstants.clubId] ?? '',
        ApiKeyConstants.requestId: requestId,
        ApiKeyConstants.status: status
      };
      print("bodyParamsForRequestsStatus:::::$bodyParamsForStatusRequests");

      AddRequestModel? addRequestModel =
          await ApiMethods.updateRequestStatusApi(
              bodyParams: bodyParamsForStatusRequests);
      if (addRequestModel!.status != "0" ?? false) {
        print("Successfully update  request  status ...");
        tabIndex.value == 0 ? getListRequestList() : getTableRequestList();
      } else {
        print("update  request  status Failed....");
        CommonWidgets.showMyToastMessage(addRequestModel.message!);
      }
    } catch (e) {
      print('Error:-' + e.toString());
      CommonWidgets.showMyToastMessage(
          'Server issue please try again after some time ');
    }
    increment();
  }
}
