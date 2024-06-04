import 'package:blue_crown_template/app/data/apis/api_models/get_all_user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_add_club_customer_model.dart';

class ProviderConsumerRegisterController extends GetxController {
  final inAsyncCall = true.obs;
  TextEditingController searchController = TextEditingController();
  FocusNode focusSearch = FocusNode();
  final isSearch = false.obs;
  void startListener() {
    focusSearch.addListener(onFocusChange);
  }

  List<AllUsersResult> filterUserList = [];

  List<AllUsersResult> userList = [];
  Map<String, dynamic> bodyParamsForSubmitAddFriendsForm = {};
  void onFocusChange() {
    isSearch.value = focusSearch.hasFocus;
  }

  Map<String, String?> parameters = Get.parameters;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    showClubInformation();
    startListener();
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

  changeFilterUsersList(String query) {
    filterUserList = userList
        .where((item) =>
            item.fullName!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    update();
  }

  Future<void> showClubInformation() async {
    try {
      AllUsersModel? allUsersModel = await ApiMethods.getAllUsersApi();
      if (allUsersModel!.status != "0" && allUsersModel.result!.isNotEmpty) {
        userList = allUsersModel.result!;
        filterUserList = userList;
      } else {
        print("get all user Failed....");
        CommonWidgets.showMyToastMessage(allUsersModel.message!);
      }
    } catch (e) {
      print('Error:-' + e.toString());
      CommonWidgets.showMyToastMessage('get all user are not present ...');
    }
    inAsyncCall.value = false;
    increment();
  }

  void callingSubmitAddContomerForm(String userId) async {
    try {
      bodyParamsForSubmitAddFriendsForm = {
        ApiKeyConstants.clubId: parameters[ApiKeyConstants.userId],
        ApiKeyConstants.friendsId: userId,
        ApiKeyConstants.token: parameters[ApiKeyConstants.token],
      };
      inAsyncCall.value = true;
      print(
          "bodyParamsForSubmitAddFriends:::::$bodyParamsForSubmitAddFriendsForm");
      AddCostomerModel? addCostomerModel =
          await ApiMethods.submitAddCostomerApi(
              bodyParams: bodyParamsForSubmitAddFriendsForm);
      if (addCostomerModel!.status != "0" ?? false) {
        print("Send Request Friends Successfully complete...");
        CommonWidgets.showMyToastMessage(addCostomerModel.message!);
      } else {
        print("Send Request Friends Failed....");
        CommonWidgets.showMyToastMessage(addCostomerModel!.message!);
      }
    } catch (e) {
      CommonWidgets.showMyToastMessage("Something went wrong....");
    }
    inAsyncCall.value = false;
    increment();
  }
}
