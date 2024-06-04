import 'package:blue_crown_template/app/data/apis/api_models/get_request_model.dart';
import 'package:get/get.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';

class RequestListHistoryController extends GetxController {
  final showListProgressBar = true.obs;
  final showTableProgressBar = true.obs;
  List<GetRequestResult> tableRequestList = [];
  List<GetRequestResult> listRequestList = [];
  Map<String, String?> parameters = Get.parameters;

  final count = 0.obs;
  final tabIndex = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    showTableRequest();
    showListRequest();
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

  Future<void> showListRequest() async {
    try {
      Map<String, String> bodyParams = {
        ApiKeyConstants.userId: parameters[ApiKeyConstants.userId] ?? '',
        ApiKeyConstants.type: 'ListRequest',
      };
      GetRequestModel? getRequestModel =
          await ApiMethods.getRequestApi(queryParameters: bodyParams);
      if (getRequestModel!.status != "0" ?? false) {
        listRequestList = getRequestModel.result!;
      } else {
        print("Get List request Failed....");
        CommonWidgets.showMyToastMessage(getRequestModel.message!);
      }
    } catch (e) {
      print('Error:-' + e.toString());
      CommonWidgets.showMyToastMessage('Requests are not present ...');
    }
    showListProgressBar.value = false;
  }

  Future<void> showTableRequest() async {
    try {
      Map<String, String> bodyParams = {
        ApiKeyConstants.userId: parameters[ApiKeyConstants.userId] ?? '',
        ApiKeyConstants.type: 'TableBooking',
      };
      GetRequestModel? getRequestModel =
          await ApiMethods.getRequestApi(queryParameters: bodyParams);
      if (getRequestModel!.status != "0" ?? false) {
        tableRequestList = getRequestModel.result!;
      } else {
        print("List request Failed....");
        CommonWidgets.showMyToastMessage(getRequestModel.message!);
      }
    } catch (e) {
      print('Error:-' + e.toString());
      CommonWidgets.showMyToastMessage('Requests are not present ...');
    }
    showTableProgressBar.value = false;
  }
}
