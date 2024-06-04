import 'package:blue_crown_template/app/data/apis/api_models/get_club_info_model.dart';
import 'package:get/get.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../routes/app_pages.dart';

class ClubInfoController extends GetxController {
  final inAsyncCall = true.obs;
  ClubInfoModel? clubInfoData;
  List<String> clubPhotos = [
    'assets/un_used_images/party1.png',
    'assets/un_used_images/party2.png',
    'assets/un_used_images/party3.png',
    'assets/un_used_images/party4.png',
    'assets/un_used_images/party1.png',
    'assets/un_used_images/party2.png'
  ];
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    showClubInformation();
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
    Get.toNamed(Routes.LIST_REQUEST);
  }

  Future<void> showClubInformation() async {
    try {
      ClubInfoModel? clubInfoModel = await ApiMethods.getClubInfoApi();
      if (clubInfoModel!.status != "0" ?? false) {
        clubInfoData = clubInfoModel;
      } else {
        print("List request Failed....");
        CommonWidgets.showMyToastMessage(clubInfoModel.message!);
      }
    } catch (e) {
      print('Error:-' + e.toString());
      CommonWidgets.showMyToastMessage('Requests are not present ...');
    }
    inAsyncCall.value = false;
    increment();
  }
}
