import 'package:get/get.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_club_request_model.dart';

class ProviderCurrentListController extends GetxController {
  final showListProgressBar = true.obs;

  ClubRequestResult? listRequestResult;
  Map<String, String?> parameters = Get.parameters;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getListRequestList();
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

  Future<void> getListRequestList() async {
    try {
      Map<String, String> bodyParamsForListRequests = {
        ApiKeyConstants.clubId: parameters[ApiKeyConstants.clubId] ?? '',
        ApiKeyConstants.eventId: parameters[ApiKeyConstants.eventId] ?? '',
        ApiKeyConstants.type: 'ListRequest',
        ApiKeyConstants.status: 'Accept'
      };
      print("bodyParamsForListRequests:::::$bodyParamsForListRequests");
      showListProgressBar.value = true;

      ClubRequestModel? clubRequestModel =
          await ApiMethods.getClubRequestListApi(
              bodyParams: bodyParamsForListRequests);
      if (clubRequestModel!.status != "0" ?? false) {
        listRequestResult = clubRequestModel.result!;
        print(
            "Successfully get  request  list ... ${listRequestResult!.eventReqData!.length.toString()}");
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
}
