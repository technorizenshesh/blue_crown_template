import 'package:blue_crown_template/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationsController extends GetxController {
  final showProgressBar = false.obs;
  TextEditingController searchController = TextEditingController();
  FocusNode focusSearch = FocusNode();
  final isSearch = false.obs;
  void startListener() {
    focusSearch.addListener(onFocusChange);
  }

  List<Map<String, String>> filterUserList = [];

  List<Map<String, String>> userList = [
    {
      "type": "List request accepted",
      "message": "kung Fu Chau added new image inFurniture and Garden.",
      "time": "10 min ago"
    },
    {
      "type": "Update version",
      "message": "kung Fu Chau added new image inFurniture and Garden.",
      "time": "5 dasys ago"
    },
    {
      "type": "List request accepted",
      "message": "kung Fu Chau added new image inFurniture and Garden.",
      "time": "7 days ago"
    },
    {
      "type": "You earned money",
      "message": "kung Fu Chau added new image inFurniture and Garden.",
      "time": "10 days ago"
    },
    {
      "type": "List request Rejected",
      "message": "kung Fu Chau added new image inFurniture and Garden.",
      "time": "15 days ago"
    },
  ];

  void onFocusChange() {
    isSearch.value = focusSearch.hasFocus;
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    filterUserList = userList;

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
        .where(
            (item) => item['name']!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    update();
  }

  clickOnSettingIcon() {
    Get.toNamed(Routes.NOTIFICATION_SETTING);
  }
}
