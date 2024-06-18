import 'package:blue_crown_template/app/data/apis/api_constants/api_key_constants.dart';
import 'package:blue_crown_template/app/data/constants/string_constants.dart';
import 'package:blue_crown_template/app/routes/app_pages.dart';
import 'package:blue_crown_template/common/common_widgets.dart';
import 'package:get/get.dart';

import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_club_hanger.dart';

class ProviderWardrobeController extends GetxController {
  final showProgressBar = true.obs;
  List<GetClubHangerResult> wardrobeList = [];
  Map<String, String?> parameters = Get.parameters;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getClubHangers();
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
  clickOnCreateQrNumber() async {
    Map<String, String> data = {
      ApiKeyConstants.userId: parameters[ApiKeyConstants.userId] ?? '',
      ApiKeyConstants.token: parameters[ApiKeyConstants.token] ?? '',
    };
    dynamic result =
        await Get.toNamed(Routes.PROVIDER_CREATE_QR_CODE, parameters: data);
    if (result) {
      showProgressBar.value = true;
      getClubHangers();
    }
  }

  clickOnDownload(int index) {
    Map<String, String> data = {
      ApiKeyConstants.qrCode: wardrobeList[index].qrcode ?? '',
      ApiKeyConstants.type: StringConstants.hanger
    };
    Get.toNamed(Routes.PROVIDER_DOWNLOAD_QR_CODE, parameters: data);
  }

  getClubHangers() async {
    try {
      Map<String, String> parameterData = {
        ApiKeyConstants.clubId: parameters[ApiKeyConstants.userId] ?? ''
      };
      GetClubHangerModel? getClubHangerModel =
          await ApiMethods.getClubHangerApi(queryParameters: parameterData);
      if (getClubHangerModel!.status != "0" ?? false) {
        wardrobeList = getClubHangerModel.result!;
        print(" Get Clubs Hanger Successfully complete...");
      } else {
        print("Get Clubs Hanger Failed....");
        CommonWidgets.showMyToastMessage(getClubHangerModel!.message!);
      }
    } catch (e) {
      print("Error:-${e.toString()}");
      CommonWidgets.showMyToastMessage('Error:-${e.toString()}');
    }
    showProgressBar.value = false;
    increment();
  }
}
