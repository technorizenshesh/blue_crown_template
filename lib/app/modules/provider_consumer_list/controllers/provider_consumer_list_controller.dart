import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_all_user_model.dart';

class ProviderConsumerListController extends GetxController {
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
    getClubConsumerList();
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

  Future<void> getClubConsumerList() async {
    try {
      Map<String, dynamic> queryParams = {
        ApiKeyConstants.userId: parameters[ApiKeyConstants.userId]
      };
      AllUsersModel? allUsersModel = await ApiMethods.getClubsConsumerListApi(
          queryParameters: queryParams);
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
}
