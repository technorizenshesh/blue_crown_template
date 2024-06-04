import 'package:get/get.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_event_model.dart';
import '../../../routes/app_pages.dart';

class ClubEventsController extends GetxController {
  final showEventsProgressBar = true.obs;
  Map<String, dynamic> queryParamsForGetEvent = {};
  List<GetEventsResult> eventList = [];
  Map<String, String?> parameters = Get.parameters;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getEventsList();
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

  openEventDetail(int index) {
    Get.toNamed(Routes.EVENT_DETAIL, arguments: eventList[index]);
  }

  changeProgressbarStatus(bool value) {
    showEventsProgressBar.value = value;
  }

  Future<void> getEventsList() async {
    try {
      queryParamsForGetEvent = {
        ApiKeyConstants.userId: parameters[ApiKeyConstants.userId],
        ApiKeyConstants.status: 'Active'
      };
      GetEventsModel? model =
          await ApiMethods.getEventApi(queryParameters: queryParamsForGetEvent);
      if (model!.status != "0" ?? false) {
        eventList = model.result!;
        print("Get My published events Successfully complete...");
      } else {
        print("Get My published events Failed....");
        CommonWidgets.showMyToastMessage(model.message!);
      }
      changeProgressbarStatus(false);
    } catch (e) {
      print('Error:-${e.toString()}');
      changeProgressbarStatus(false);
    }
  }
}
