import 'package:get/get.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_event_model.dart';
import '../../../routes/app_pages.dart';

class ProviderAllEventController extends GetxController {
  final showActiveEventsProgressBar = true.obs;
  final showInactiveEventsProgressBar = true.obs;
  final count = 0.obs;
  final tabIndex = 0.obs;
  Map<String, dynamic> queryParamsForGetEvent = {};
  List<GetEventsResult> activeEventList = [];
  List<GetEventsResult> inactiveEventList = [];
  Map<String, String?> parameters = Get.parameters;
  @override
  void onInit() {
    super.onInit();
    getActiveEventsList();
    getInactiveEventsList();
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

  openActiveEventDetail(int index, String type) {
    Map<String, String> data = {
      ApiKeyConstants.userId: parameters[ApiKeyConstants.userId] ?? '',
      ApiKeyConstants.type: type,
    };
    Get.toNamed(Routes.PROVIDER_EVENT_DETAIL,
        parameters: data, arguments: activeEventList[index]);
  }

  openInactiveEventDetail(int index, String type) {
    Map<String, String> data = {
      ApiKeyConstants.userId: parameters[ApiKeyConstants.userId] ?? '',
      ApiKeyConstants.type: type,
    };
    Get.toNamed(Routes.PROVIDER_EVENT_DETAIL,
        parameters: data, arguments: inactiveEventList[index]);
  }

  changeActiveProgressbarStatus(bool value) {
    showActiveEventsProgressBar.value = value;
  }

  changeInactiveProgressbarStatus(bool value) {
    showInactiveEventsProgressBar.value = value;
  }

  Future<void> getActiveEventsList() async {
    try {
      queryParamsForGetEvent = {
        ApiKeyConstants.userId: parameters[ApiKeyConstants.userId] ?? '',
        ApiKeyConstants.status: 'Active'
      };
      GetEventsModel? model =
          await ApiMethods.getEventApi(queryParameters: queryParamsForGetEvent);
      if (model!.status != "0" ?? false) {
        activeEventList = model.result!;
        print("Get My published events Successfully complete...");
      } else {
        print("Get My published events Failed....");
        CommonWidgets.showMyToastMessage(model.message!);
      }
      changeActiveProgressbarStatus(false);
    } catch (e) {
      print('Error:-${e.toString()}');
      changeActiveProgressbarStatus(false);
    }
  }

  Future<void> getInactiveEventsList() async {
    try {
      queryParamsForGetEvent = {
        ApiKeyConstants.userId: parameters[ApiKeyConstants.userId] ?? '',
        ApiKeyConstants.status: 'Deactive'
      };
      GetEventsModel? model =
          await ApiMethods.getEventApi(queryParameters: queryParamsForGetEvent);
      if (model!.status != "0" ?? false) {
        inactiveEventList = model.result!;
        print("Get My published events Successfully complete...");
      } else {
        print("Get My published events Failed....");
        CommonWidgets.showMyToastMessage(model.message!);
      }
      changeInactiveProgressbarStatus(false);
    } catch (e) {
      print('Error:-${e.toString()}');
      changeInactiveProgressbarStatus(false);
    }
  }
}
