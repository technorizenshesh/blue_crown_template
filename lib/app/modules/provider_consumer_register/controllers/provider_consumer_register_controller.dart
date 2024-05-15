import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProviderConsumerRegisterController extends GetxController {
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
      "name": "Alfredo Mango",
      "email": "crown@gmail.com",
      "phone": "0987654321",
      "image": "assets/un_used_images/image2.png"
    },
    {
      "name": "Livia Baptista",
      "email": "crown@gmail.com",
      "phone": "0987654321",
      "image": "assets/images/img_user.png"
    },
    {
      "name": "Emery Septimus",
      "email": "crown@gmail.com",
      "phone": "0987654321",
      "image": "assets/un_used_images/image2.png"
    },
    {
      "name": "Alfredo Mango",
      "email": "crown@gmail.com",
      "phone": "0987654321",
      "image": "assets/images/img_user.png"
    },
    {
      "name": "Ahmad Lubin",
      "email": "crown@gmail.com",
      "phone": "0987654321",
      "image": "assets/un_used_images/image2.png"
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
}
